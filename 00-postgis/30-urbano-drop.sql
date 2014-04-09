/*

  Drops the urbano schema.

*/

\i 00-config.sql

begin;

drop schema urbano cascade;
drop schema urbano_import cascade;
drop schema urbano_export cascade;

delete from public.geometry_columns where
f_table_schema='urbano';

delete from public.geometry_columns where
f_table_schema='urbano_import';

delete from public.geometry_columns where
f_table_schema='urbano_export';

drop function public.ssl__urbano_analysis(varchar[]) cascade;

commit;

\c :dbname :superuser

vacuum analyze;

\c :dbname :user
