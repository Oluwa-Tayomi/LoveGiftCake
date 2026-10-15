# Test payments — Paystack (NG) + Stripe (UK), both free in test mode

Checkout currently writes `payments.status = pending` with provider `paystack_test`.

## Paystack test (do first — you sell in Nigeria)
1. https://dashboard.paystack.com → Sign up → switch to **Test mode**.
2. Get test public + secret keys. Keep secret server-side only (never in config.js).
3. Later: a tiny free serverless function calls transaction/initialize then verifies by webhook,
   then flips `payments.status` to `paid` and `orders.status` to `awaiting_vendor`.

## Stripe test (UK cards)
1. https://dashboard.stripe.com → Developers → test keys. Same webhook pattern.

## Money rules
- Pay → confirm → vendor fulfills → payout after 48h dispute window.
- Every charge carries an `idempotency_key` so double-clicks never double-charge.
