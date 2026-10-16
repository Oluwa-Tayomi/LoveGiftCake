-- LoveGiftCake order-event trigger — run AFTER notify-migration.sql (free).
-- Fires the notify Edge Function on every new order and every status change.
-- FIRST: replace <PROJECT_REF> with your Supabase project ref, and paste your
-- service_role key ONLY in this SQL editor (never commit it to GitHub).

create extension if not exists pg_net;

create or replace function public.notify_order_event()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  v_event text;
begin
  if TG_OP = 'INSERT' then
    v_event := 'placed';
  else
    v_event := NEW.status;
  end if;
  perform net.http_post(
    url := 'https://<PROJECT_REF>.supabase.co/functions/v1/notify',
    headers := jsonb_build_object(
      'Content-Type', 'application/json',
      'Authorization', 'Bearer <SERVICE_ROLE_KEY>'
    ),
    body := jsonb_build_object('order_id', NEW.id, 'event', v_event)
  );
  return NEW;
end $$;

drop trigger if exists order_notify on orders;
create trigger order_notify
  after insert or update of status on orders
  for each row execute function public.notify_order_event();
