/*

  (Re)Creates the full database.

*/

\i 00-config.sql
\i 20-database-ddl.sql
\i 30-linea_costa-ddl.sql
\i 30-urbano-ddl.sql

vacuum;
