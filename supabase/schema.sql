-- LoveGiftCake Phase 0 step 2 — Supabase (free Postgres) schema starter
-- Run in Supabase SQL editor. No paid extensions required for MVP0.

create extension if not exists "pgcrypto";
create extension if not exists "pg_trgm";

do $$ begin
  create type user_role as enum ('customer','vendor','admin','super_admin');
exception when duplicate_object then null; end $$;

do $$ begin
  create type order_status as enum (
    'placed','awaiting_vendor','accepted','preparing',
    'ready','out_for_delivery','delivered','cancelled','disputed'
  );
exception when duplicate_object then null; end $$;

do $$ begin
  create type verification_status as enum ('pending','approved','rejected','suspended');
exception when duplicate_object then null; end $$;

create table if not exists users (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  email text unique,
  phone text unique,
  role user_role not null default 'customer',
  status text not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists vendors (
  id uuid primary key default gen_random_uuid(),
  owner_user_id uuid not null references users(id) on delete cascade,
  business_name text not null,
  description text,
  city text not null,
  country text not null,
  address text,
  lat double precision,
  lng double precision,
  verification_status verification_status not null default 'pending',
  operating_hours jsonb not null default '{}',
  min_prep_hours int not null default 48,
  max_orders_per_day int not null default 10,
  vacation_mode boolean not null default false,
  status text not null default 'active',
  created_at timestamptz not null default now()
);

create table if not exists delivery_zones (
  id uuid primary key default gen_random_uuid(),
  vendor_id uuid not null references vendors(id) on delete cascade,
  zone_type text not null check (zone_type in ('radius','postal','manual')),
  radius_km numeric,
  center_lat double precision,
  center_lng double precision,
  postal_code text,
  label text,
  fee numeric not null default 0,
  min_order numeric not null default 0,
  lead_time_hours int not null default 48
);

create table if not exists products (
  id uuid primary key default gen_random_uuid(),
  vendor_id uuid not null references vendors(id) on delete cascade,
  name text not null,
  description text,
  category text not null default 'cake',
  base_price numeric not null,
  currency text not null default 'NGN',
  images jsonb not null default '[]',
  prep_hours int not null default 48,
  status text not null default 'active',
  search tsvector generated always as (to_tsvector('english', coalesce(name,'') || ' ' || coalesce(description,''))) stored
);
create index if not exists products_search_idx on products using gin (search);
create index if not exists products_trgm_idx on products using gin (name gin_trgm_ops);

create table if not exists product_options (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references products(id) on delete cascade,
  option_type text not null,
  option_name text not null,
  price_modifier numeric not null default 0,
  available boolean not null default true
);

create table if not exists customer_addresses (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references users(id) on delete set null,
  address text not null,
  city text not null,
  country text not null,
  lat double precision,
  lng double precision,
  instructions text
);

create table if not exists orders (
  id uuid primary key default gen_random_uuid(),
  customer_id uuid references users(id) on delete set null,
  vendor_id uuid not null references vendors(id),
  order_type text not null default 'standard' check (order_type in ('standard','custom')),
  status order_status not null default 'placed',
  subtotal numeric not null default 0,
  delivery_fee numeric not null default 0,
  platform_fee numeric not null default 0,
  total numeric not null default 0,
  currency text not null default 'NGN',
  scheduled_date date,
  scheduled_window text,
  created_at timestamptz not null default now()
);

create table if not exists order_items (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references orders(id) on delete cascade,
  product_id uuid references products(id) on delete set null,
  quantity int not null default 1,
  selected_options jsonb not null default '[]',
  unit_price numeric not null,
  total_price numeric not null
);

create table if not exists recipients (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references orders(id) on delete cascade,
  name text not null,
  phone text,
  address text not null,
  instructions text,
  gift_message text,
  hide_sender boolean not null default false,
  notify_in_advance boolean not null default true
);

create table if not exists custom_requests (
  id uuid primary key default gen_random_uuid(),
  customer_id uuid references users(id) on delete set null,
  description text not null,
  reference_images jsonb not null default '[]',
  budget numeric,
  currency text not null default 'NGN',
  requested_date date,
  city text,
  country text,
  status text not null default 'open',
  created_at timestamptz not null default now()
);

create table if not exists vendor_quotes (
  id uuid primary key default gen_random_uuid(),
  custom_request_id uuid not null references custom_requests(id) on delete cascade,
  vendor_id uuid not null references vendors(id) on delete cascade,
  price numeric not null,
  description text,
  eta_date date,
  status text not null default 'sent',
  created_at timestamptz not null default now()
);

create table if not exists payments (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references orders(id),
  provider text not null,
  provider_ref text,
  amount numeric not null,
  currency text not null,
  status text not null default 'pending',
  idempotency_key text unique,
  created_at timestamptz not null default now()
);

create table if not exists payouts (
  id uuid primary key default gen_random_uuid(),
  vendor_id uuid not null references vendors(id),
  order_id uuid not null references orders(id),
  amount numeric not null,
  status text not null default 'pending',
  payout_ref text,
  created_at timestamptz not null default now()
);

create table if not exists reviews (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references orders(id),
  customer_id uuid references users(id) on delete set null,
  vendor_id uuid not null references vendors(id),
  cake_rating smallint check (cake_rating between 1 and 5),
  vendor_rating smallint check (vendor_rating between 1 and 5),
  delivery_rating smallint check (delivery_rating between 1 and 5),
  comment text,
  status text not null default 'visible'
);

create table if not exists conversations (
  id uuid primary key default gen_random_uuid(),
  order_id uuid references orders(id) on delete set null,
  custom_request_id uuid references custom_requests(id) on delete set null,
  created_at timestamptz not null default now()
);

create table if not exists messages (
  id uuid primary key default gen_random_uuid(),
  conversation_id uuid not null references conversations(id) on delete cascade,
  sender_id uuid references users(id) on delete set null,
  body text,
  attachments jsonb not null default '[]',
  created_at timestamptz not null default now()
);

create table if not exists disputes (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references orders(id),
  raised_by uuid references users(id) on delete set null,
  reason text not null,
  status text not null default 'open',
  resolution text,
  created_at timestamptz not null default now()
);

create table if not exists availability_blocks (
  id uuid primary key default gen_random_uuid(),
  vendor_id uuid not null references vendors(id) on delete cascade,
  block_date date not null,
  reason text
);

create table if not exists notifications (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  kind text not null,
  title text not null,
  body text,
  read boolean not null default false,
  created_at timestamptz not null default now()
);
