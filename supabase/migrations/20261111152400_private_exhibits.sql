insert into storage.buckets (id,name,public) values ('exhibits','exhibits',false);
create policy exhibits_active_read on storage.objects for select to authenticated using (bucket_id = 'exhibits' and exists (select 1 from public.profiles where id = (select auth.uid()) and active));
