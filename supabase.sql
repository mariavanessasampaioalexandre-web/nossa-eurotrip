create table if not exists public.eurotrip_state (
  id text primary key,
  itinerary jsonb not null default '[]'::jsonb,
  bookings jsonb not null default '[]'::jsonb,
  expenses jsonb not null default '[]'::jsonb,
  checks jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.eurotrip_state enable row level security;

drop policy if exists "eurotrip read" on public.eurotrip_state;
drop policy if exists "eurotrip write" on public.eurotrip_state;

create policy "eurotrip read"
on public.eurotrip_state for select
to anon
using (true);

create policy "eurotrip write"
on public.eurotrip_state for all
to anon
using (true)
with check (true);
