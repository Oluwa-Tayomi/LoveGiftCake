-- LoveGiftCake RLS — run AFTER schema.sql (Supabase SQL editor, free).
alter table vendors enable row level security;
alter table products enable row level security;
alter table delivery_zones enable row level security;
alter table orders enable row level security;
alter table payments enable row level security;

drop policy if exists "public read approved vendors" on vendors;
create policy "public read approved vendors" on vendors
  for select using (verification_status = 'approved');

drop policy if exists "public read active products" on products;
create policy "public read active products" on products
  for select using (status = 'active');

drop policy if exists "public read zones" on delivery_zones;
create policy "public read zones" on delivery_zones for select using (true);

drop policy if exists "auth read orders" on orders;
create policy "auth read orders" on orders for select to authenticated using (true);
drop policy if exists "auth insert orders" on orders;
create policy "auth insert orders" on orders for insert to authenticated with check (true);

drop policy if exists "auth read payments" on payments;
create policy "auth read payments" on payments for select to authenticated using (true);
drop policy if exists "auth insert payments" on payments;
create policy "auth insert payments" on payments for insert to authenticated with check (true);
