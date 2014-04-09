/*

  Creates the urbano schema.

*/

\i 00-config.sql

begin;

create schema urbano;
create schema urbano_import;
create schema urbano_export;


create table urbano.uso_urbano (
  id_uso_urbano serial,
  anyo1956 varchar(4),
  anyo1978 varchar(4),
  anyo1985 varchar(4),
  anyo1998 varchar(4),
  anyo2001 varchar(4),
  anyo2004 varchar(4),
  anyo2007 varchar(4),
  anyo2009 varchar(4),
  anyo2011 varchar(4)
);

select AddGeometryColumn(
       'urbano',
       'uso_urbano',
       'geom',
       25830,
       'MULTIPOLYGON',
       2);

alter table urbano.uso_urbano add constraint uso_urbano_pkey primary key (id_uso_urbano);


create table urbano.tipologia_nv4 (
       id_tipologia_nv4 varchar(4),
       descripcion_nv4 text,
       id_tipologia_nv3 varchar(3)
);

alter table urbano.tipologia_nv4
add constraint tipologia_nv4_pkey primary key (id_tipologia_nv4);


create table urbano.tipologia_nv3 (
       id_tipologia_nv3 varchar(3),
       descripcion_nv3 text,
       id_tipologia_nv2 varchar(2)
);

alter table urbano.tipologia_nv3
add constraint tipologia_nv3_pkey primary key (id_tipologia_nv3);


create table urbano.tipologia_nv2 (
       id_tipologia_nv2 varchar(2),
       descripcion_nv2 text,
       id_tipologia_nv1 varchar(1)
);

alter table urbano.tipologia_nv2
add constraint tipologia_nv2_pkey primary key (id_tipologia_nv2);


create table urbano.tipologia_nv1 (
       id_tipologia_nv1 varchar(1),
       descripcion_nv1 text
);

alter table urbano.tipologia_nv1
add constraint tipologia_nv1_pkey primary key (id_tipologia_nv1);


create table urbano.fuente (
       id_fuente integer,
       tipo text,
       resolucion_fuente double precision,
       epsg integer,
       crs_original text,
       fuente text,
       resolucion_original double precision,
       escala text,
       texto_wms text,
       crs_digitalizacion text,
       transformacion text,
       digitalizador text,
       rango_fecha text
);

alter table urbano.fuente
add constraint fuente_pkey primary key (id_fuente);


create table urbano.codigo (
       codigo_unico varchar(2),
       id_tipologia_nv4 varchar(4)
);

alter table urbano.codigo
add constraint codigo_pkey primary key (codigo_unico);


alter table urbano.uso_urbano add constraint uso_urbano_1956_tipologia_nv4_fkey
      foreign key (anyo1956) references urbano.tipologia_nv4(id_tipologia_nv4);

alter table urbano.uso_urbano add constraint uso_urbano_1978_tipologia_nv4_fkey
      foreign key (anyo1978) references urbano.tipologia_nv4(id_tipologia_nv4);
 
alter table urbano.uso_urbano add constraint uso_urbano_1985_tipologia_nv4_fkey
      foreign key (anyo1985) references urbano.tipologia_nv4(id_tipologia_nv4);

alter table urbano.uso_urbano add constraint uso_urbano_1998_tipologia_nv4_fkey
      foreign key (anyo1998) references urbano.tipologia_nv4(id_tipologia_nv4);

alter table urbano.uso_urbano add constraint uso_urbano_2001_tipologia_nv4_fkey
      foreign key (anyo2001) references urbano.tipologia_nv4(id_tipologia_nv4);

alter table urbano.uso_urbano add constraint uso_urbano_2004_tipologia_nv4_fkey
      foreign key (anyo2004) references urbano.tipologia_nv4(id_tipologia_nv4);

alter table urbano.uso_urbano add constraint uso_urbano_2007_tipologia_nv4_fkey
      foreign key (anyo2007) references urbano.tipologia_nv4(id_tipologia_nv4);

alter table urbano.uso_urbano add constraint uso_urbano_2009_tipologia_nv4_fkey
      foreign key (anyo2009) references urbano.tipologia_nv4(id_tipologia_nv4);

alter table urbano.uso_urbano add constraint uso_urbano_2011_tipologia_nv4_fkey
      foreign key (anyo2011) references urbano.tipologia_nv4(id_tipologia_nv4);

alter table urbano.codigo add constraint codigo_tipologia_nv4_fkey
      foreign key (id_tipologia_nv4) references urbano.tipologia_nv4(id_tipologia_nv4);


-- Views

create or replace view urbano.vw__complete_described as
select
  row_number() over (order by geom) as gid,

  nv1_1956.descripcion_nv1 as nv1_1956,
  nv1_1956.id_tipologia_nv1 as cod_nv1_1956,
  nv2_1956.descripcion_nv2 as nv2_1956,
  nv2_1956.id_tipologia_nv2 as cod_nv2_1956,
  nv3_1956.descripcion_nv3 as nv3_1956,
  nv3_1956.id_tipologia_nv3 as cod_nv3_1956,
  nv4_1956.descripcion_nv4 as nv4_1956,
  nv4_1956.id_tipologia_nv4 as cod_nv4_1956,
  (select texto_wms from urbano.fuente where id_fuente = '1956') as fuente_1956,

  nv1_1978.descripcion_nv1 as nv1_1978,
  nv1_1978.id_tipologia_nv1 as cod_nv1_1978,
  nv2_1978.descripcion_nv2 as nv2_1978,
  nv2_1978.id_tipologia_nv2 as cod_nv2_1978,
  nv3_1978.descripcion_nv3 as nv3_1978,
  nv3_1978.id_tipologia_nv3 as cod_nv3_1978,
  nv4_1978.descripcion_nv4 as nv4_1978,
  nv4_1978.id_tipologia_nv4 as cod_nv4_1978,
  (select texto_wms from urbano.fuente where id_fuente = '1978') as fuente_1978,

  nv1_1985.descripcion_nv1 as nv1_1985,
  nv1_1985.id_tipologia_nv1 as cod_nv1_1985,
  nv2_1985.descripcion_nv2 as nv2_1985,
  nv2_1985.id_tipologia_nv2 as cod_nv2_1985,
  nv3_1985.descripcion_nv3 as nv3_1985,
  nv3_1985.id_tipologia_nv3 as cod_nv3_1985,
  nv4_1985.descripcion_nv4 as nv4_1985,
  nv4_1985.id_tipologia_nv4 as cod_nv4_1985,
  (select texto_wms from urbano.fuente where id_fuente = '1985') as fuente_1985,

  nv1_1998.descripcion_nv1 as nv1_1998,
  nv1_1998.id_tipologia_nv1 as cod_nv1_1998,
  nv2_1998.descripcion_nv2 as nv2_1998,
  nv2_1998.id_tipologia_nv2 as cod_nv2_1998,
  nv3_1998.descripcion_nv3 as nv3_1998,
  nv3_1998.id_tipologia_nv3 as cod_nv3_1998,
  nv4_1998.descripcion_nv4 as nv4_1998,
  nv4_1998.id_tipologia_nv4 as cod_nv4_1998,
  (select texto_wms from urbano.fuente where id_fuente = '1998') as fuente_1998,

  nv1_2001.descripcion_nv1 as nv1_2001,
  nv1_2001.id_tipologia_nv1 as cod_nv1_2001,
  nv2_2001.descripcion_nv2 as nv2_2001,
  nv2_2001.id_tipologia_nv2 as cod_nv2_2001,
  nv3_2001.descripcion_nv3 as nv3_2001,
  nv3_2001.id_tipologia_nv3 as cod_nv3_2001,
  nv4_2001.descripcion_nv4 as nv4_2001,
  nv4_2001.id_tipologia_nv4 as cod_nv4_2001,
  (select texto_wms from urbano.fuente where id_fuente = '2001') as fuente_2001,

  nv1_2004.descripcion_nv1 as nv1_2004,
  nv1_2004.id_tipologia_nv1 as cod_nv1_2004,
  nv2_2004.descripcion_nv2 as nv2_2004,
  nv2_2004.id_tipologia_nv2 as cod_nv2_2004,
  nv3_2004.descripcion_nv3 as nv3_2004,
  nv3_2004.id_tipologia_nv3 as cod_nv3_2004,
  nv4_2004.descripcion_nv4 as nv4_2004,
  nv4_2004.id_tipologia_nv4 as cod_nv4_2004,
  (select texto_wms from urbano.fuente where id_fuente = '2004') as fuente_2004,

  nv1_2007.descripcion_nv1 as nv1_2007,
  nv1_2007.id_tipologia_nv1 as cod_nv1_2007,
  nv2_2007.descripcion_nv2 as nv2_2007,
  nv2_2007.id_tipologia_nv2 as cod_nv2_2007,
  nv3_2007.descripcion_nv3 as nv3_2007,
  nv3_2007.id_tipologia_nv3 as cod_nv3_2007,
  nv4_2007.descripcion_nv4 as nv4_2007,
  nv4_2007.id_tipologia_nv4 as cod_nv4_2007,
  (select texto_wms from urbano.fuente where id_fuente = '2007') as fuente_2007,

  nv1_2009.descripcion_nv1 as nv1_2009,
  nv1_2009.id_tipologia_nv1 as cod_nv1_2009,
  nv2_2009.descripcion_nv2 as nv2_2009,
  nv2_2009.id_tipologia_nv2 as cod_nv2_2009,
  nv3_2009.descripcion_nv3 as nv3_2009,
  nv3_2009.id_tipologia_nv3 as cod_nv3_2009,
  nv4_2009.descripcion_nv4 as nv4_2009,
  nv4_2009.id_tipologia_nv4 as cod_nv4_2009,
  (select texto_wms from urbano.fuente where id_fuente = '2009') as fuente_2009,

  nv1_2011.descripcion_nv1 as nv1_2011,
  nv1_2011.id_tipologia_nv1 as cod_nv1_2011,
  nv2_2011.descripcion_nv2 as nv2_2011,
  nv2_2011.id_tipologia_nv2 as cod_nv2_2011,
  nv3_2011.descripcion_nv3 as nv3_2011,
  nv3_2011.id_tipologia_nv3 as cod_nv3_2011,
  nv4_2011.descripcion_nv4 as nv4_2011,
  nv4_2011.id_tipologia_nv4 as cod_nv4_2011,
  (select texto_wms from urbano.fuente where id_fuente = '2011') as fuente_2011,

  uso.geom as geom
from
  urbano.uso_urbano uso

  left join urbano.tipologia_nv4 nv4_1956 on uso.anyo1956=nv4_1956.id_tipologia_nv4
  left join urbano.tipologia_nv3 nv3_1956 on nv4_1956.id_tipologia_nv3=nv3_1956.id_tipologia_nv3
  left join urbano.tipologia_nv2 nv2_1956 on nv2_1956.id_tipologia_nv2=nv3_1956.id_tipologia_nv2
  left join urbano.tipologia_nv1 nv1_1956 on nv1_1956.id_tipologia_nv1=nv2_1956.id_tipologia_nv1

  left join urbano.tipologia_nv4 nv4_1978 on uso.anyo1978=nv4_1978.id_tipologia_nv4
  left join urbano.tipologia_nv3 nv3_1978 on nv4_1978.id_tipologia_nv3=nv3_1978.id_tipologia_nv3
  left join urbano.tipologia_nv2 nv2_1978 on nv2_1978.id_tipologia_nv2=nv3_1978.id_tipologia_nv2
  left join urbano.tipologia_nv1 nv1_1978 on nv1_1978.id_tipologia_nv1=nv2_1978.id_tipologia_nv1

  left join urbano.tipologia_nv4 nv4_1985 on uso.anyo1985=nv4_1985.id_tipologia_nv4
  left join urbano.tipologia_nv3 nv3_1985 on nv4_1985.id_tipologia_nv3=nv3_1985.id_tipologia_nv3
  left join urbano.tipologia_nv2 nv2_1985 on nv2_1985.id_tipologia_nv2=nv3_1985.id_tipologia_nv2
  left join urbano.tipologia_nv1 nv1_1985 on nv1_1985.id_tipologia_nv1=nv2_1985.id_tipologia_nv1

  left join urbano.tipologia_nv4 nv4_1998 on uso.anyo1998=nv4_1998.id_tipologia_nv4
  left join urbano.tipologia_nv3 nv3_1998 on nv4_1998.id_tipologia_nv3=nv3_1998.id_tipologia_nv3
  left join urbano.tipologia_nv2 nv2_1998 on nv2_1998.id_tipologia_nv2=nv3_1998.id_tipologia_nv2
  left join urbano.tipologia_nv1 nv1_1998 on nv1_1998.id_tipologia_nv1=nv2_1998.id_tipologia_nv1

  left join urbano.tipologia_nv4 nv4_2001 on uso.anyo2001=nv4_2001.id_tipologia_nv4
  left join urbano.tipologia_nv3 nv3_2001 on nv4_2001.id_tipologia_nv3=nv3_2001.id_tipologia_nv3
  left join urbano.tipologia_nv2 nv2_2001 on nv2_2001.id_tipologia_nv2=nv3_2001.id_tipologia_nv2
  left join urbano.tipologia_nv1 nv1_2001 on nv1_2001.id_tipologia_nv1=nv2_2001.id_tipologia_nv1

  left join urbano.tipologia_nv4 nv4_2004 on uso.anyo2004=nv4_2004.id_tipologia_nv4
  left join urbano.tipologia_nv3 nv3_2004 on nv4_2004.id_tipologia_nv3=nv3_2004.id_tipologia_nv3
  left join urbano.tipologia_nv2 nv2_2004 on nv2_2004.id_tipologia_nv2=nv3_2004.id_tipologia_nv2
  left join urbano.tipologia_nv1 nv1_2004 on nv1_2004.id_tipologia_nv1=nv2_2004.id_tipologia_nv1

  left join urbano.tipologia_nv4 nv4_2007 on uso.anyo2007=nv4_2007.id_tipologia_nv4
  left join urbano.tipologia_nv3 nv3_2007 on nv4_2007.id_tipologia_nv3=nv3_2007.id_tipologia_nv3
  left join urbano.tipologia_nv2 nv2_2007 on nv2_2007.id_tipologia_nv2=nv3_2007.id_tipologia_nv2
  left join urbano.tipologia_nv1 nv1_2007 on nv1_2007.id_tipologia_nv1=nv2_2007.id_tipologia_nv1

  left join urbano.tipologia_nv4 nv4_2009 on uso.anyo2009=nv4_2009.id_tipologia_nv4
  left join urbano.tipologia_nv3 nv3_2009 on nv4_2009.id_tipologia_nv3=nv3_2009.id_tipologia_nv3
  left join urbano.tipologia_nv2 nv2_2009 on nv2_2009.id_tipologia_nv2=nv3_2009.id_tipologia_nv2
  left join urbano.tipologia_nv1 nv1_2009 on nv1_2009.id_tipologia_nv1=nv2_2009.id_tipologia_nv1

  left join urbano.tipologia_nv4 nv4_2011 on uso.anyo2011=nv4_2011.id_tipologia_nv4
  left join urbano.tipologia_nv3 nv3_2011 on nv4_2011.id_tipologia_nv3=nv3_2011.id_tipologia_nv3
  left join urbano.tipologia_nv2 nv2_2011 on nv2_2011.id_tipologia_nv2=nv3_2011.id_tipologia_nv2
  left join urbano.tipologia_nv1 nv1_2011 on nv1_2011.id_tipologia_nv1=nv2_2011.id_tipologia_nv1;


create or replace view urbano.vw__uso_produccion as
select
        id_uso_urbano as id,
        c1956.codigo_unico as uso_1956,
        c1978.codigo_unico as uso_1978,
        c1985.codigo_unico as uso_1985,
        c1998.codigo_unico as uso_1998,
        c2001.codigo_unico as uso_2001,
        c2004.codigo_unico as uso_2004,
        c2007.codigo_unico as uso_2007,
        c2009.codigo_unico as uso_2009,
        c2011.codigo_unico as uso_2011,
        uso.geom
from
        urbano.uso_urbano uso left join
        urbano.codigo c1956 on uso.anyo1956=c1956.id_tipologia_nv4 left join
        urbano.codigo c1978 on uso.anyo1956=c1978.id_tipologia_nv4 left join
        urbano.codigo c1985 on uso.anyo1956=c1985.id_tipologia_nv4 left join
        urbano.codigo c1998 on uso.anyo1998=c1998.id_tipologia_nv4 left join
        urbano.codigo c2001 on uso.anyo2001=c2001.id_tipologia_nv4 left join
        urbano.codigo c2004 on uso.anyo2004=c2004.id_tipologia_nv4 left join
        urbano.codigo c2007 on uso.anyo2004=c2007.id_tipologia_nv4 left join
        urbano.codigo c2009 on uso.anyo2004=c2009.id_tipologia_nv4 left join
        urbano.codigo c2011 on uso.anyo2007=c2011.id_tipologia_nv4;


create or replace view urbano.vw__codigo_produccion as
select
        codigo_unico,
        nv1.id_tipologia_nv1,
        nv1.descripcion_nv1,
        nv2.id_tipologia_nv2,
        nv2.descripcion_nv2,
        nv3.id_tipologia_nv3,
        nv3.descripcion_nv3,
        nv4.id_tipologia_nv4,
        nv4.descripcion_nv4
from
        urbano.codigo cod left join
        urbano.tipologia_nv4 nv4 on cod.id_tipologia_nv4=nv4.id_tipologia_nv4 left join
        urbano.tipologia_nv3 nv3 on nv4.id_tipologia_nv3=nv3.id_tipologia_nv3 left join
        urbano.tipologia_nv2 nv2 on nv3.id_tipologia_nv2=nv2.id_tipologia_nv2 left join
        urbano.tipologia_nv1 nv1 on nv2.id_tipologia_nv1=nv1.id_tipologia_nv1
order by codigo_unico;


create or replace view urbano.vw__jerarquia as
select
        n1.id_tipologia_nv1 as id_tipologia_nv1,
        n1.descripcion_nv1 as descripcion_nv1,
        n2.id_tipologia_nv2 as id_tipologia_nv2,
        n2.descripcion_nv2 as descripcion_nv2,
        n3.id_tipologia_nv3 as id_tipologia_nv3,
        n3.descripcion_nv3 as descripcion_nv3,
        n4.id_tipologia_nv4 as id_tipologia_nv4,
        n4.descripcion_nv4 as descripcion_nv4,
        c.codigo_unico as codigo_unico
from
        urbano.tipologia_nv1 n1 left join
        urbano.tipologia_nv2 n2 on n1.id_tipologia_nv1=n2.id_tipologia_nv1 left join
        urbano.tipologia_nv3 n3 on n2.id_tipologia_nv2=n3.id_tipologia_nv2 left join
        urbano.tipologia_nv4 n4 on n3.id_tipologia_nv3=n4.id_tipologia_nv3 left join
        urbano.codigo c on n4.id_tipologia_nv4=c.id_tipologia_nv4
order by n4.id_tipologia_nv4;


-- This one is used for export
create or replace view urbano_export.urbano_unicode as
select
  b.codigo_unico as urb56,
  c.codigo_unico as urb78,
  d.codigo_unico as urb85,
  e.codigo_unico as urb98,
  f.codigo_unico as urb01,
  g.codigo_unico as urb04,
  h.codigo_unico as urb07,
  i.codigo_unico as urb09,
  j.codigo_unico as urb11,
  a.geom as geom
from
  urbano.uso_urbano a left join 
  urbano.codigo b on a.anyo1956=b.id_tipologia_nv4 left join 
  urbano.codigo c on a.anyo1978=c.id_tipologia_nv4 left join 
  urbano.codigo d on a.anyo1985=d.id_tipologia_nv4 left join 
  urbano.codigo e on a.anyo1998=e.id_tipologia_nv4 left join 
  urbano.codigo f on a.anyo2001=f.id_tipologia_nv4 left join 
  urbano.codigo g on a.anyo2004=g.id_tipologia_nv4 left join 
  urbano.codigo h on a.anyo2007=h.id_tipologia_nv4 left join 
  urbano.codigo i on a.anyo2009=i.id_tipologia_nv4 left join 
  urbano.codigo j on a.anyo2011=j.id_tipologia_nv4;


create or replace function public.ssl__urbano_analysis(
  _anyos varchar[]
) returns boolean as
$$
declare
  _sql text;
  _v varchar;
begin

  foreach _v in array _anyos loop
    _sql = '
      drop table if exists urbano_export.urbano_' || _v || ';

      create table urbano_export.urbano_' || _v || ' as
      with a as(
        select
          fuente_' || _v || ',
          st_union(geom) as geom
        from
          urbano.vw__complete_described
        where
          cod_nv1_' || _v || ' is not null
        group by
          fuente_' || _v || '
      ), b as(
        select
          fuente_' || _v || ',
          (st_dump(geom)).geom as geom
        from a)
      select
        row_number() over (order by geom) as gid,
        fuente_' || _v || ',
        st_perimeter(geom) as length,
        st_area(geom) as area,
        geom
      from b;

      alter table urbano_export.urbano_' || _v || '
      add constraint urbano_' || _v || '_pkey
      primary key(gid);
      
      create index urbano_' || _v || '_gist
      on urbano_export.urbano_' || _v || '
      using gist(geom);';

    execute _sql;

    _sql = '
      drop table if exists urbano_export.urbano_nv1_' || _v || ';
      create table urbano_export.urbano_nv1_' || _v || ' as
      with a as(
        select
          cod_nv1_' || _v || ',
          nv1_' || _v || ',
          fuente_' || _v || ',
          st_union(geom) as geom
        from
          urbano.vw__complete_described
        where
          cod_nv1_' || _v || ' is not null
        group by
          cod_nv1_' || _v || ', nv1_' || _v || ', fuente_' || _v || '
      ), b as(
        select
          cod_nv1_' || _v || ',
          nv1_' || _v || ',
          fuente_' || _v || ',
          (st_dump(geom)).geom as geom
        from a)
      select
        row_number() over (order by geom) as gid,
        cod_nv1_' || _v || ',
        nv1_' || _v || ',
        fuente_' || _v || ',
        st_perimeter(geom) as length,
        st_area(geom) as area,
        geom
      from b;

      alter table urbano_export.urbano_nv1_' || _v || '
      add constraint urbano_nv1_' || _v || '_pkey
      primary key(gid);
      
      create index urbano_nv1_' || _v || '_gist
      on urbano_export.urbano_nv1_' || _v || '
      using gist(geom);';

    execute _sql;

    _sql = '
      drop table if exists urbano_export.urbano_nv2_' || _v || ';
      create table urbano_export.urbano_nv2_' || _v || ' as
      with a as(
        select
          cod_nv1_' || _v || ',
          nv1_' || _v || ',
          cod_nv2_' || _v || ',
          nv2_' || _v || ',
          fuente_' || _v || ',
          st_union(geom) as geom
        from
          urbano.vw__complete_described
        where
          cod_nv2_' || _v || ' is not null
        group by
          cod_nv1_' || _v || ', nv1_' || _v || ',
          cod_nv2_' || _v || ', nv2_' || _v || ', 
          fuente_' || _v || '
      ), b as(
        select
          cod_nv1_' || _v || ',
          nv1_' || _v || ',
          cod_nv2_' || _v || ',
          nv2_' || _v || ',
          fuente_' || _v || ',
          (st_dump(geom)).geom as geom
        from a)
      select
        row_number() over (order by geom) as gid,
        cod_nv1_' || _v || ',
        nv1_' || _v || ',
        cod_nv2_' || _v || ',
        nv2_' || _v || ',
        fuente_' || _v || ',
        st_perimeter(geom) as length,
        st_area(geom) as area,
        geom
      from b;

      alter table urbano_export.urbano_nv2_' || _v || '
      add constraint urbano_nv2_' || _v || '_pkey
      primary key(gid);
      
      create index urbano_nv2_' || _v || '_gist
      on urbano_export.urbano_nv2_' || _v || '
      using gist(geom);';

    execute _sql;

    _sql = '
      drop table if exists urbano_export.urbano_nv3_' || _v || ';
      create table urbano_export.urbano_nv3_' || _v || ' as
      with a as(
        select
          cod_nv1_' || _v || ',
          nv1_' || _v || ',
          cod_nv2_' || _v || ',
          nv2_' || _v || ',
          cod_nv3_' || _v || ',
          nv3_' || _v || ',
          fuente_' || _v || ',
          st_union(geom) as geom
        from
          urbano.vw__complete_described
        where
          cod_nv3_' || _v || ' is not null
        group by
          cod_nv1_' || _v || ', nv1_' || _v || ',
          cod_nv2_' || _v || ', nv2_' || _v || ', 
          cod_nv3_' || _v || ', nv3_' || _v || ', 
          fuente_' || _v || '
      ), b as(
        select
          cod_nv1_' || _v || ',
          nv1_' || _v || ',
          cod_nv2_' || _v || ',
          nv2_' || _v || ',
          cod_nv3_' || _v || ',
          nv3_' || _v || ',
          fuente_' || _v || ',
          (st_dump(geom)).geom as geom
        from a)
      select
        row_number() over (order by geom) as gid,
        cod_nv1_' || _v || ',
        nv1_' || _v || ',
        cod_nv2_' || _v || ',
        nv2_' || _v || ',
        cod_nv3_' || _v || ',
        nv3_' || _v || ',
        fuente_' || _v || ',
        st_perimeter(geom) as length,
        st_area(geom) as area,
        geom
      from b;

      alter table urbano_export.urbano_nv3_' || _v || '
      add constraint urbano_nv3_' || _v || '_pkey
      primary key(gid);
      
      create index urbano_nv3_' || _v || '_gist
      on urbano_export.urbano_nv3_' || _v || '
      using gist(geom);';

    execute _sql;

    _sql = '
      drop table if exists urbano_export.urbano_nv4_' || _v || ';
      create table urbano_export.urbano_nv4_' || _v || ' as
      with a as(
        select
          cod_nv1_' || _v || ',
          nv1_' || _v || ',
          cod_nv2_' || _v || ',
          nv2_' || _v || ',
          cod_nv3_' || _v || ',
          nv3_' || _v || ',
          cod_nv4_' || _v || ',
          nv4_' || _v || ',
          fuente_' || _v || ',
          st_union(geom) as geom
        from
          urbano.vw__complete_described
        where
          cod_nv4_' || _v || ' is not null
        group by
          cod_nv1_' || _v || ', nv1_' || _v || ',
          cod_nv2_' || _v || ', nv2_' || _v || ', 
          cod_nv3_' || _v || ', nv3_' || _v || ', 
          cod_nv4_' || _v || ', nv4_' || _v || ', 
          fuente_' || _v || '
      ), b as(
        select
          cod_nv1_' || _v || ',
          nv1_' || _v || ',
          cod_nv2_' || _v || ',
          nv2_' || _v || ',
          cod_nv3_' || _v || ',
          nv3_' || _v || ',
          cod_nv4_' || _v || ',
          nv4_' || _v || ',
          fuente_' || _v || ',
          (st_dump(geom)).geom as geom
        from a)
      select
        row_number() over (order by geom) as gid,
        cod_nv1_' || _v || ',
        nv1_' || _v || ',
        cod_nv2_' || _v || ',
        nv2_' || _v || ',
        cod_nv3_' || _v || ',
        nv3_' || _v || ',
        cod_nv4_' || _v || ',
        nv4_' || _v || ',
        fuente_' || _v || ',
        st_perimeter(geom) as length,
        st_area(geom) as area,
        geom
      from b;

      alter table urbano_export.urbano_nv4_' || _v || '
      add constraint urbano_nv4_' || _v || '_pkey
      primary key(gid);
      
      create index urbano_nv4_' || _v || '_gist
      on urbano_export.urbano_nv4_' || _v || '
      using gist(geom);';

    execute _sql;

  end loop;

  return true;

end;
$$
language plpgsql;


commit;

\c :dbname :superuser

vacuum analyze;

\c :dbname :user

