# LoveGiftCake — global cake marketplace (free-first build)

Send a celebration, wherever they are. UK customer → verified baker in Jos → delivered in Jos.

## Run locally (no installs)
Double-click any file in `apps/web/`: `index.html`, `vendors.html`, `cakes.html`,
`checkout.html`, `custom.html`, `track.html`, `review.html`, `admin.html`.

For live data: copy `apps/web/config.example.js` → `apps/web/config.js`,
paste your Supabase URL + anon key. `config.js` is git-ignored and never committed.

## Live backend (Supabase free)
1. Create project at supabase.com → SQL Editor → run `supabase/schema.sql`, then `supabase/rls.sql`, then `supabase/seed_demo.sql`.
2. Storage buckets: `cake-images` (public), `request-refs` (private).

## Deploy free
See `docs/FREE_DEPLOY.md` (Vercel or Cloudflare Pages, root `apps/web`, no build).

## Test payments
See `docs/PAYMENTS_TEST.md`. Checkout writes `payments(status=pending)`; `api/paystack-verify.js`
flips it to paid after Paystack test verification.
