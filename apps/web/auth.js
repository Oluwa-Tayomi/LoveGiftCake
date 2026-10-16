// Auth helpers (free Supabase Auth). Used by auth.html.
function needKeys() {
  const ok = window.SUPABASE_URL && window.SUPABASE_ANON_KEY && !String(window.SUPABASE_URL).includes("PASTE");
  return !ok;
}
function client() { return window.supabase.createClient(window.SUPABASE_URL, window.SUPABASE_ANON_KEY); }
async function signUp({ name, email, password, role }) {
  const db = client();
  const res = await db.auth.signUp({ email, password, options: { data: { name, role } } });
  if (res.error) throw res.error;
  let user = res.data.user;
  if (!user) { const g = await db.auth.getUser(); user = g.data.user; }
  if (user) {
    await db.from("users").upsert({ id: user.id, name, email, role }, { onConflict: "id" });
  }
  return user;
}
async function signIn({ email, password }) {
  const db = client();
  const res = await db.auth.signInWithPassword({ email, password });
  if (res.error) throw res.error;
}
async function signOut() { await client().auth.signOut(); }
