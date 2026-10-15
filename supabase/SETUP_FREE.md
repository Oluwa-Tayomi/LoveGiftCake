# Supabase Free Setup — LoveGiftCake (5–10 minutes, no card)

You already have `supabase/schema.sql` in this repo. Now we put it live for free.

## 1. Create the free project
1. Go to https://supabase.com → Sign in with GitHub.
2. New project → name `lovegiftcake` → free plan → pick region closest to Nigeria/Europe (e.g. EU West).
3. Wait ~2 minutes until it says Active.

## 2. Create the tables
1. Left menu → SQL Editor → New query.
2. Open `supabase/schema.sql` from this repo, copy everything, paste, Run.
3. Left menu → Table Editor — you should see `users, vendors, products, orders…`.

## 3. Turn on login (free)
1. Authentication → Providers → enable Email. Keep phone OTP off for now (SMS costs).
2. Authentication → Settings → allow guest sign-in later for guest checkout.

## 4. Turn on cake photo storage (free)
1. Storage → New bucket → name `cake-images` → Public ON (so shoppers see cakes).
2. Storage → New bucket → name `request-refs` → Public OFF (custom-order references stay private).

## 5. Copy 2 keys (we need them in step 5)
1. Project Settings → API → copy `Project URL` and `anon public key`.
2. Keep them private — never commit them to GitHub. We will put them in a local `.env.local` file only.

Done? Tell me and we do step 5: connect the home page to this live database.
