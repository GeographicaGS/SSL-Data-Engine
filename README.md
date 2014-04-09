# This is my README

Database Configuration
======================

Database Versions
-----------------
Install these versions:

  version(): 

    PostgreSQL 9.1.2 on i686-pc-linux-gnu, compiled by gcc
    (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1, 32-bit

  postgis_full_version():

    POSTGIS="1.5.3" GEOS="3.3.2-CAPI-1.7.2" PROJ="Rel. 4.7.1, 23
    September 2009" LIBXML="2.7.8" USE_STATS

Database Build
--------------
Follow this steps (files in 00-postgis unless stated):

  * drop database with 20-database-drop.sql if needed;
  * configure 00-config.sql;
  * rebuild database with 10-full.sql;
  
