// Shared nav + session badge. Include on every page AFTER supabase CDN + config.js:
// <script src="./nav.js" defer></script>  (responsive.css holds the styles)
(function () {
  function el(html) { const t = document.createElement("template"); t.innerHTML = html.trim(); return t.content.firstChild; }
  async function session() {
    try {
      if (!window.supabase || !window.SUPABASE_URL || String(window.SUPABASE_URL).includes("PASTE")) return { user: null, role: null };
      const db = window.supabase.createClient(window.SUPABASE_URL, window.SUPABASE_ANON_KEY);
      const res = await db.auth.getSession();
      const user = res.data && res.data.session ? res.data.session.user : null;
      if (!user) return { user: null, role: null };
      const r = await db.from("users").select("role,name").eq("id", user.id).single();
      return { user, role: r.data ? r.data.role : "customer", name: r.data ? r.data.name : user.email, db };
    } catch (e) { return { user: null, role: null }; }
  }
  document.addEventListener("DOMContentLoaded", async () => {
    const s = await session();
    const links = [
      ["index.html", "Home"], ["vendors.html", "Bakers"], ["cakes.html", "Cakes"],
      ["custom.html", "Custom"], ["track.html", "Track"], ["checkout.html", "Checkout"],
    ];
    if (s.role === "vendor" || s.role === "admin") links.push(["vendor.html", "My orders"]);
    if (s.role === "admin") links.push(["admin.html", "Admin"]);
    const here = (location.pathname.split("/").pop() || "index.html");
    const nav = el('<nav class="site-nav"><div class="inner"><a class="brand" href="./index.html">LoveGiftCake</a><button class="burger" aria-label="Menu">X</button><div class="links"></div></div></nav>');
    const box = nav.querySelector(".links");
    links.forEach(([href, label]) => {
      const a = document.createElement("a");
      a.className = "navlink"; a.href = "./" + href; a.textContent = label;
      if (href === here) a.style.fontWeight = "800";
      box.appendChild(a);
    });
    const who = document.createElement("span"); who.className = "who";
    if (s.user) {
      who.textContent = "Hi, " + (s.name || s.user.email) + (s.role ? " (" + s.role + ")" : "");
      const out = document.createElement("a"); out.className = "navlink"; out.href = "./auth.html?mode=out"; out.textContent = "Sign out";
      box.appendChild(who); box.appendChild(out);
    } else {
      const a = document.createElement("a"); a.className = "navlink"; a.href = "./auth.html"; a.textContent = "Sign in";
      box.appendChild(a);
    }
    nav.querySelector(".burger").onclick = () => nav.classList.toggle("open");
    document.body.prepend(nav);
    if (document.body.dataset.require === "admin" && s.role !== "admin") {
      document.body.innerHTML = '<div class="wrap"><div class="card"><h1>Admins only</h1><p class="muted">Sign in with an admin account. <a href="./auth.html">Go to sign in</a></p></div></div>';
    }
    if (document.body.dataset.require === "vendor" && !(s.role === "vendor" || s.role === "admin")) {
      document.body.innerHTML = '<div class="wrap"><div class="card"><h1>Vendors only</h1><p class="muted">Sign in with a vendor account. <a href="./auth.html">Go to sign in</a></p></div></div>';
    }
  });
})();
