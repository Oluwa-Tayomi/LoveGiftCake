# Order notifications — vendor + customer emails (Resend free)

Free quota: Resend free = 100 emails/day. Plenty for a Jos pilot.

## What happens automatically (after setup)
| Order event | Vendor email | Customer email |
|---|---|---|
| Placed | New order alert | Order received |
| Accepted / preparing | Status update | — |
| Ready | — | Cake ready |
| Out for delivery | — | On its way |
| Delivered | Payout follows 48h window | Delivered + review invite |
| Cancelled | Cancelled notice | Cancelled notice |

Every send is logged in `notification_log`.

## Setup (all free)
1. https://resend.com → sign up → API Keys → create key → copy it.
2. Supabase Dashboard → Edge Functions → New function → name `notify` → paste
   `supabase/functions/notify/index.ts` → Deploy.
3. On the function → Secrets → add: `RESEND_API_KEY`, `FROM_EMAIL`
   (use `LoveGiftCake <onboarding@resend.dev>` for testing),
   `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY` (Project Settings → API).
4. SQL Editor → run `supabase/notify-migration.sql`.
5. Open `supabase/order-events.sql`, replace `<PROJECT_REF>` and `<SERVICE_ROLE_KEY>`,
   paste into SQL Editor → Run. (Keys stay in Supabase only, never GitHub.)
6. Table Editor → `vendors` → fill `contact_email` for Sunshine Bakery.
7. Test: place an order in `checkout.html` → check `notification_log` rows appear,
   and both inboxes receive mail. Resend test mail only reaches your own signup email,
   so use your own address everywhere while testing.
