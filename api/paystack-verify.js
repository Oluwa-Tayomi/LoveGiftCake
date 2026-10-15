// Vercel serverless (free tier) — Paystack verify template.
// Secrets live in Vercel env vars, NEVER in the repo.
// Env needed: PAYSTACK_SECRET_KEY, SUPABASE_URL, SUPABASE_SERVICE_KEY.

export default async function handler(req, res) {
  if (req.method !== "GET") return res.status(405).json({ error: "GET only" });
  const { reference, order_id } = req.query;
  if (!reference || !order_id) return res.status(400).json({ error: "reference + order_id required" });
  try {
    const v = await fetch("https://api.paystack.co/transaction/verify/" + reference, {
      headers: { Authorization: "Bearer " + process.env.PAYSTACK_SECRET_KEY },
    }).then((r) => r.json());
    if (!v || !v.data || v.data.status !== "success") return res.status(402).json({ error: "not paid" });
    const { createClient } = await import("@supabase/supabase-js");
    const db = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_KEY);
    await db.from("payments").update({ status: "paid", provider_ref: String(reference) }).eq("order_id", order_id);
    await db.from("orders").update({ status: "awaiting_vendor" }).eq("id", order_id);
    return res.json({ ok: true });
  } catch (e) {
    return res.status(500).json({ error: String((e && e.message) || e) });
  }
}
