-- Optional: auto-mirror new signups into public.users (free).
-- Run AFTER schema.sql. App code already does this insert, so this is a safety net.
-- The role comes from the sign-up metadata (customer/vendor). Admins are NEVER
-- self-assigned: set role='admin' manually in Table Editor for your own user only.

create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.users (id, name, email, role)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'name', split_part(new.email, '@', 1)),
    new.email,
    case when coalesce(new.raw_user_meta_data->>'role', 'customer') = 'vendor' then 'vendor' else 'customer' end
  )
  on conflict (id) do nothing;
  return new;
end $$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users for each row execute function public.handle_new_user();
