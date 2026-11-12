create function public.admin_set_account_active(p_user_id uuid, p_active boolean)
returns void
language plpgsql
security definer
set search_path = ''
as $$
begin
  if private.actor_role() is distinct from 'admin' then
    raise exception 'Administrator access required' using errcode = '42501';
  end if;

  if p_user_id = auth.uid() or p_active is null then
    raise exception 'Invalid account status change' using errcode = '22023';
  end if;

  update public.profiles
  set active = p_active
  where id = p_user_id and role = 'user';

  if not found then
    raise exception 'Manageable account not found' using errcode = '22023';
  end if;
end;
$$;

revoke all on function public.admin_set_account_active(uuid, boolean) from public, anon, authenticated;
grant execute on function public.admin_set_account_active(uuid, boolean) to authenticated;
