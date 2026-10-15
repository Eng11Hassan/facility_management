-- BGC Tickets Dashboard: initial shared-state table
-- Run in Supabase SQL Editor.
create table if not exists public.bgc_app_state (
  id integer primary key check (id = 1),
  payload jsonb not null default '{"tickets":[],"seq":0,"customAssets":[]}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.bgc_app_state enable row level security;

-- IMPORTANT SECURITY NOTE:
-- The public reporting page writes through the anon key. Do not expose sensitive data in this shared JSON payload.
-- These MVP policies allow public read/write to one shared row and are NOT suitable for confidential or production use.
-- For production, implement Supabase Auth + role-based policies and split tickets/assets into separate tables.
create policy "BGC MVP read state" on public.bgc_app_state for select to anon, authenticated using (true);
create policy "BGC MVP insert state" on public.bgc_app_state for insert to anon, authenticated with check (id = 1);
create policy "BGC MVP update state" on public.bgc_app_state for update to anon, authenticated using (id = 1) with check (id = 1);

alter table public.bgc_app_state replica identity full;
alter publication supabase_realtime add table public.bgc_app_state;
