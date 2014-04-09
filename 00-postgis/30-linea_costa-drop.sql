/*

  Drops the linea costa database schema.

*/

\i 00-config.sql

begin;

drop schema if exists linea_costa cascade;
drop schema if exists linea_costa_export cascade;
drop schema if exists linea_costa_import cascade;

delete from public.geometry_columns where 
f_table_schema='linea_costa';

delete from public.geometry_columns where 
f_table_schema='linea_costa_export';

delete from public.geometry_columns where 
f_table_schema='linea_costa_import';

commit;

vacuum;
