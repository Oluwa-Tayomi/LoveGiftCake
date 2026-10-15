# LoveGiftCake — Implementation Plan (Free-First Stack)

> Source: `cake_marketplace_prd.md` v1.0. MVP split into MVP0 (standard orders) → MVP1 (custom + messaging) → Admin/Money → Hardening.

## Free stack decisions (no paid services in MVP)

| Need | Free choice | Why |
|---|---|---|
| Frontend hosting | Vercel Free | Best Next.js free tier, preview deploys |
| Backend + DB + Auth + Storage | Supabase Free | Postgres + PostGIS, Auth (email/phone OTP), Storage (cake images), Row-Level Security |
| Cache/queue | Supabase + Next.js revalidation first; Upstash Redis Free only if needed | Avoid extra service until proven |
| Search | Postgres Full-Text + trigram | No Algolia/Typesense cost |
| Email | Resend Free (100 mails/day) or Brevo Free | Transactional: verify, order, payout |
| SMS (critical only) | Termii test / Africa's Talking sandbox; SMS off by default, email + in-app first | PRD wants SMS only for critical events |
| Payments (test) | Paystack Test (NG-friendly) + Stripe Test (UK cards) behind one interface | UK→Jos flow needs both; test mode is free |
| Maps/zones | OpenStreetMap + manual radius/postal zones, no Google Maps billing | PRD zones can be radius/postal/manual |
| CI | GitHub Actions Free | Lint/type/test/build |
| Monitoring | Sentry Free + Vercel Analytics | — |

## Phase 0 — Foundation (design system + architecture)

Deliverables:
- `apps/web` Next.js 14 App Router + TypeScript + Tailwind (mobile-first).
- Design tokens: `tokens.css` (colors, type, spacing, radius, shadows), components: Button, Input, Card, VendorCard, PriceBreakdown, OrderStepper (9 statuses), Rating, Toast, Empty/Error.
- `supabase/schema.sql`: User, Vendor, DeliveryZone, Product, ProductOption, CustomerAddress, Order, OrderItem, Recipient, CustomRequest, VendorQuote, Payment, Payout, Review, Conversation, Message, Dispute/Refund, AvailabilityBlock.
- Rules: multi-currency (`Intl.NumberFormat`), timezone-safe dates (`date-fns-tz`), image limits (5MB, WebP, 1600px), guest checkout, RBAC (customer/vendor/admin/super-admin), audit logs.
- SLAs (added, PRD was silent): vendor respond 24h, quote TTL 48h, dispute window 48h post-delivery.

Exit: tokens render, schema applies cleanly on free Supabase, CI green.

## Phase 1 — MVP0 Standard ordering

Build: auth/guest → location-first discovery → vendor/product pages → customization with vendor pricing → scheduling guard → recipient/gift/surprise → checkout with fee breakdown + policy → Paystack/Stripe test pay → vendor accept/reject → status machine → tracking → verified reviews → email + in-app notifications.

Exit: UK test card → Jos vendor → fulfilled → payout pending.

## Phase 2 — MVP1 Custom requests + messaging

CustomRequest → match 3–5 vendors → quotes → select → convert to Order. Order-linked messaging (text + images, report/block, mask contacts until accepted).

## Phase 3 — Admin, money, trust

Admin queues (vendor approval → Verified badge), finance ledger (gross/fees/refunds/net), idempotency + webhook reconciliation, cancellation-by-status matrix, failed-delivery flow.

## Phase 4 — Hardening + launch

p95 search <800ms, RBAC tests, secure uploads, GDPR/NDPR deletion, metrics dashboards, seed 1 city (Jos), manual verification first.

## Acceptance mapping

Maps 1:1 to PRD §25 (20 criteria). MVP0 covers 1–4, 8–20 minus custom; MVP1 covers 5–7.
