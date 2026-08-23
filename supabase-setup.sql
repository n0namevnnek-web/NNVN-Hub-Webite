create table if not exists public.script_metrics (
  script_id text primary key,
  views bigint not null default 0,
  updated_at timestamptz not null default now()
);

alter table public.script_metrics enable row level security;

create policy "public can read metrics"
on public.script_metrics
for select
to anon
using (true);

create or replace function public.increment_script_view(input_script_id text)
returns bigint
language plpgsql
security definer
as $$
declare
  next_views bigint;
begin
  insert into public.script_metrics (script_id, views)
  values (input_script_id, 1)
  on conflict (script_id)
  do update set
    views = public.script_metrics.views + 1,
    updated_at = now()
  returning views into next_views;

  return next_views;
end;
$$;

grant execute on function public.increment_script_view(text) to anon;

create table if not exists public.protected_scripts (
  id text primary key,
  owner_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  body text not null,
  size_bytes bigint not null default 0,
  executions bigint not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.protected_scripts enable row level security;

drop policy if exists "users can read own protected scripts" on public.protected_scripts;
create policy "users can read own protected scripts"
on public.protected_scripts
for select
to authenticated
using (auth.uid() = owner_id);

drop policy if exists "users can insert own protected scripts" on public.protected_scripts;
create policy "users can insert own protected scripts"
on public.protected_scripts
for insert
to authenticated
with check (auth.uid() = owner_id);

drop policy if exists "users can update own protected scripts" on public.protected_scripts;
create policy "users can update own protected scripts"
on public.protected_scripts
for update
to authenticated
using (auth.uid() = owner_id)
with check (auth.uid() = owner_id);

drop policy if exists "users can delete own protected scripts" on public.protected_scripts;
create policy "users can delete own protected scripts"
on public.protected_scripts
for delete
to authenticated
using (auth.uid() = owner_id);
