Introduction
============
This is a project by University of Sevilla and Geographica to process and publish data from the Subsistema Litoral (Coastal Subsystem).

Version Policy
==============
Make heavy use of tags to track each year version of the workflow. Follow this example:

    2014.2.11

where 2014 is the ongoing edition of SSL, 2 is increased every time a non-compatible change is made to the database schema, and 11 are bugfixing.

Installation
============
Steps:

  * create database (check database configuration);
  * install in Windows Git, GDAL and gdal-110-1600-core/filegdb;
  * clone 

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
  * rebuild database with 10-full.sql.

Coast Line Workflow
===================
Steps:

  * import with _Import-LineaCostaProduccion_;
  * translate info with _linea_costa.sql_;
  * export with _Export-LineaCostaShapes_ and _Export-LineaCostaPgdbProduccion_.
