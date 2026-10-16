-- LoveGiftCake notifications migration — run AFTER schema.sql (Supabase SQL editor, free).
-- Adds vendor contact email, customer email on orders, and a delivery log.

alter table vendors add column if not exists contact_email text;
alter table orders add column if not exists customer_email text;

create table if not exists notification_log (
  id uuid primary key default gen_random_uuid(),
  order_id uuid references orders(id) on delete cascade,
  event text not null,
  to_email text not null,
  audience text not null check (audience in ('vendor','customer')),
  status text not null default 'sent',
  created_at timestamptz not null default now()
);
