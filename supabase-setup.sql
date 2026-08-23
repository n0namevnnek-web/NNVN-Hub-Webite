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
