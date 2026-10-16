// Supabase Edge Function: notify — free tier, deployed via Dashboard (no CLI).
// Secrets to set on the function: RESEND_API_KEY, FROM_EMAIL, SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY.
// Called by the orders trigger with { order_id, event }.
import { serve } from "https://deno.land/std@0.224.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const RESEND = Deno.env.get("RESEND_API_KEY");
const FROM = Deno.env.get("FROM_EMAIL") || "LoveGiftCake <onboarding@resend.dev>";

const SUBJECT = {
  placed: "New cake order",
  accepted: "Order accepted",
  preparing: "Cake in preparation",
  ready: "Cake ready",
  out_for_delivery: "Cake on its way",
  delivered: "Cake delivered",
  cancelled: "Order cancelled",
};

const VB = {
  placed: (o) => "New order " + o.id + " — " + o.total + " " + o.currency + ", due " + (o.scheduled_date || "ASAP") + ". Open vendor.html to accept it.",
  delivered: (o) => "Order " + o.id + " marked delivered. Payout follows the 48h dispute window.",
};

const CB = {
  placed: (o) => "Order " + o.id + " received (" + o.total + " " + o.currency + "). The baker has 24h to accept. Track it on track.html.",
  ready: (o) => "Good news — order " + o.id + " is ready.",
  out_for_delivery: (o) => "Order " + o.id + " is on its way to the recipient.",
  delivered: (o) => "Order " + o.id + " delivered. Enjoy — you can leave a review on review.html.",
};

async function send(to, subject, text) {
  const r = await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: { Authorization: "Bearer " + RESEND, "Content-Type": "application/json" },
    body: JSON.stringify({ from: FROM, to: [to], subject, text }),
  });
  if (!r.ok) throw new Error("Resend " + r.status + ": " + (await r.text()).slice(0, 200));
}

serve(async (req) => {
  try {
    const body = await req.json();
    const db = createClient(Deno.env.get("SUPABASE_URL"), Deno.env.get("SUPABASE_SERVICE_ROLE_KEY"));
    const ord = await db.from("orders").select("*, vendors(business_name, contact_email)").eq("id", body.order_id).single();
    if (ord.error || !ord.data) throw new Error("order not found");
    const o = ord.data;
    const subject = (SUBJECT[body.event] || body.event) + " — " + String(o.id).slice(0, 8);
    const jobs = [];
    if (o.vendors && o.vendors.contact_email) {
      const text = (VB[body.event] || ((x) => "Order " + x.id + ": " + body.event + " (" + x.total + " " + x.currency + ")."))(o);
      const to = o.vendors.contact_email;
      jobs.push(send(to, subject, text).then(
        () => db.from("notification_log").insert({ order_id: o.id, event: body.event, to_email: to, audience: "vendor" }),
        (e) => db.from("notification_log").insert({ order_id: o.id, event: body.event, to_email: to, audience: "vendor", status: "failed: " + String(e.message).slice(0, 120) }),
      ));
    }
    let cmail = o.customer_email;
    if (!cmail && o.customer_id) {
      const u = await db.from("users").select("email").eq("id", o.customer_id).single();
      cmail = (u.data && u.data.email) || null;
    }
    if (cmail && (CB[body.event] || body.event === "placed")) {
      const text = (CB[body.event] || ((x) => "Order " + x.id + ": " + body.event + "."))(o);
      jobs.push(send(cmail, subject, text).then(
        () => db.from("notification_log").insert({ order_id: o.id, event: body.event, to_email: cmail, audience: "customer" }),
        (e) => db.from("notification_log").insert({ order_id: o.id, event: body.event, to_email: cmail, audience: "customer", status: "failed: " + String(e.message).slice(0, 120) }),
      ));
    }
    await Promise.all(jobs);
    return Response.json({ ok: true });
  } catch (e) {
    return Response.json({ error: String((e && e.message) || e) }, { status: 500 });
  }
});
