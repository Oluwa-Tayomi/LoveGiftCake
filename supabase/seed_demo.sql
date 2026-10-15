-- LoveGiftCake demo seed — run AFTER schema.sql in Supabase SQL editor.
-- Creates 1 demo user, 1 approved vendor in Jos, 1 delivery zone, 2 cakes.

insert into users (name, email, role) values
  ('Demo Owner', 'owner@example.com', 'vendor')
on conflict (email) do nothing;

with u as (select id from users where email = 'owner@example.com' limit 1)
insert into vendors (owner_user_id, business_name, description, city, country, address, verification_status, min_prep_hours, max_orders_per_day)
select u.id, 'Sunshine Bakery', 'Birthday and anniversary cakes in Jos.', 'Jos', 'Nigeria', '14 Ahmadu Bello Way, Jos', 'approved', 48, 10
from u
on conflict do nothing;

with v as (select id from vendors where business_name = 'Sunshine Bakery' limit 1)
insert into delivery_zones (vendor_id, zone_type, radius_km, center_lat, center_lng, label, fee, min_order, lead_time_hours)
select v.id, 'radius', 15, 9.9285, 8.8921, 'Jos metro', 2000, 0, 48 from v;

with v as (select id from vendors where business_name = 'Sunshine Bakery' limit 1)
insert into products (vendor_id, name, description, category, base_price, currency, prep_hours, status)
select v.id, 'Chocolate Birthday Cake', 'Rich chocolate layers, buttercream finish.', 'cake', 18000, 'NGN', 48, 'active' from v
union all
select v.id, 'Vanilla Anniversary Cake', 'Classic vanilla sponge, elegant piping.', 'cake', 22000, 'NGN', 72, 'active' from v;
