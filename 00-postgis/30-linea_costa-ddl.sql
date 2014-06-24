\i 00-config.sql

begin;

create schema linea_costa;
create schema linea_costa_import;
create schema linea_costa_export;

create table linea_costa.linea_costa(
  id_linea_costa serial,
  id_tipo_linea integer,
  id_tipologia_nv4 char(4),
  id_playa integer,
  id_duna integer,
  id_acantilado integer,
  id_infraestructura_frente integer,
  id_infraestructura_2_linea integer,
  id_infraestructura_tipo integer,
  id_infraestructura_localizacion integer,
  id_infraestructura_exposicion integer,
  id_criterio integer,
  id_deslinde integer,
  id_tipo_margen integer,
  id_estacion integer,
  estacion_comentario text,
  id_urbano integer,
  id_urbano_proximidad integer,
  id_fuente integer,
  tipo_toponimo_ssl varchar(25),
  toponimo_ssl varchar(250),
  id_fuente_toponimo_ssl integer,
  toponimo_sigla varchar(250),
  toponimo_aeroguia varchar(250),
  toponimo_carta_nautica varchar(250),
  toponimo_ministerio varchar(250),
  excl_dsas integer,
  causa_excl integer,
  fecha_excl integer,
  id_sustrato integer,
  duna_anchura integer,
  duna_anc_indicador integer,
  tramos_cambiados text
);

select addgeometrycolumn(
  'linea_costa',
  'linea_costa',
  'geom',
  23030,
  'LINESTRING',
  2);

alter table linea_costa.linea_costa
add constraint linea_costa_pkey primary key (id_linea_costa);

create index linea_costa_gist on 
linea_costa.linea_costa using gist (geom);

create index linea_costa_tipo_toponimo_ssl_idx on 
linea_costa.linea_costa(tipo_toponimo_ssl);

create index linea_costa_toponimo_ssl_idx on
linea_costa.linea_costa(toponimo_ssl);

create index linea_costa_toponimo_sigla_idx on
linea_costa.linea_costa(toponimo_sigla);

create index linea_costa_toponimo_aeroguia_idx on
linea_costa.linea_costa(toponimo_aeroguia);

create index linea_costa_toponimo_carta_nautica_idx on
linea_costa.linea_costa(toponimo_carta_nautica);

create index linea_costa_toponimo_ministerio_idx on
linea_costa.linea_costa(toponimo_ministerio);


create table linea_costa.tipo_linea (
			 id_tipo_linea integer,
			 descripcion varchar(200)
);

alter table linea_costa.tipo_linea
add constraint tipo_linea_pkey primary key (id_tipo_linea);


create table linea_costa.sustrato(
  id_sustrato integer,
  descripcion varchar
);

alter table linea_costa.sustrato
add constraint sustrato_pkey primary key(id_sustrato);


create table linea_costa.fuente(
			 id_fuente integer,
       tipo varchar(50),
       resolucion_fuente float,
       epsg integer,
       crs_original varchar(100),
       fuente varchar(25),
       resolucion_original float,
       escala varchar(20),
       texto_wms varchar(250),
       crs_digitalizacion varchar(25),
       transformacion varchar(250),
       digitalizador varchar(250),
       rango_fecha varchar(50)
);

alter table linea_costa.fuente
add constraint fuente_pkey primary key (id_fuente);


create table linea_costa.fuente_toponimo_ssl (
  id_fuente_toponimo_ssl integer,
  descripcion_fuente_toponimo_ssl varchar(250),
  escala varchar(50),
  organismo varchar(500),
  fecha varchar(25),
  url_web varchar(1000)
);

alter table linea_costa.fuente_toponimo_ssl
add constraint fuente_toponimo_ssl_pkey primary key (id_fuente_toponimo_ssl);

create index fuente_toponimo_ssl_descripcion_fuente_toponimo_ssl_idx
on linea_costa.fuente_toponimo_ssl(descripcion_fuente_toponimo_ssl);


create table linea_costa.estacion (
       id_estacion integer,
       descripcion_estacion varchar(50)
);

alter table linea_costa.estacion
add constraint estacion_pkey primary key (id_estacion);


create table linea_costa.tipo_margen (
       id_tipo_margen integer,
       descripcion_tipo_margen varchar(100)
);

alter table linea_costa.tipo_margen
add constraint tipo_margen_pkey primary key (id_tipo_margen);


create table linea_costa.deslinde (
       id_deslinde integer,
       descripcion_deslinde varchar(10)
);

alter table linea_costa.deslinde
add constraint deslinde_pkey primary key (id_deslinde);


create table linea_costa.criterio (
       id_criterio integer,
       descripcion_criterio varchar(250)
);

alter table linea_costa.criterio
add constraint criterio_pkey primary key (id_criterio);


create table linea_costa.infraestructura_exposicion (
       id_infraestructura_exposicion integer,
       descripcion_infraestructura_exposicion varchar(50)
);

alter table linea_costa.infraestructura_exposicion
add constraint infraestructura_exposicion_pkey primary key (id_infraestructura_exposicion);


create table linea_costa.infraestructura_localizacion (
       id_infraestructura_localizacion integer,
       descripcion_infraestructura_localizacion varchar(25)
);

alter table linea_costa.infraestructura_localizacion
add constraint infraestructura_localizacion_pkey primary key (id_infraestructura_localizacion);


create table linea_costa.infraestructura_tipo (
       id_infraestructura_tipo integer,
       descripcion_infraestructura_tipo varchar(25)
);

alter table linea_costa.infraestructura_tipo
add constraint infraestructura_tipo_pkey primary key (id_infraestructura_tipo);


create table linea_costa.infraestructura (
       id_infraestructura integer,
       descripcion_infraestructura varchar(500)
);

alter table linea_costa.infraestructura
add constraint infraestructura_pkey primary key (id_infraestructura);


create table linea_costa.acantilado (
       id_acantilado integer,
       descripcion_acantilado varchar(250)
);

alter table linea_costa.acantilado
add constraint acantilado_pkey primary key (id_acantilado);


create table linea_costa.tipologia_nv4 (
       id_tipologia_nv4 char(4),
       descripcion_nv4 varchar(250),
       id_tipologia_nv3 char(3)
);

alter table linea_costa.tipologia_nv4
add constraint tipologia_nv4_pkey primary key (id_tipologia_nv4);


create table linea_costa.tipologia_nv3 (
       id_tipologia_nv3 char(3),
       descripcion_nv3 varchar(250),
       id_tipologia_nv2 char(2)
);

alter table linea_costa.tipologia_nv3
add constraint tipologia_nv3_pkey primary key (id_tipologia_nv3);


create table linea_costa.tipologia_nv2 (
       id_tipologia_nv2 char(2),
       descripcion_nv2 varchar(250),
       id_tipologia_nv1 char(1)
);

alter table linea_costa.tipologia_nv2
add constraint tipologia_nv2_pkey primary key (id_tipologia_nv2);


create table linea_costa.tipologia_nv1 (
       id_tipologia_nv1 char(1),
       descripcion_nv1 varchar(250)
);

alter table linea_costa.tipologia_nv1
add constraint tipologia_nv1_pkey primary key (id_tipologia_nv1);


create table linea_costa.playa (
       id_playa integer,
       descripcion_playa varchar(50)
);

alter table linea_costa.playa
add constraint playa_pkey primary key (id_playa);


create table linea_costa.duna (
       id_duna integer,
       descripcion_duna varchar(50)
);

alter table linea_costa.duna
add constraint duna_pkey primary key (id_duna);


create table linea_costa.urbano (
       id_urbano integer,
       descripcion_urbano varchar(100)
);

alter table linea_costa.urbano
add constraint urbano_pkey primary key (id_urbano);


create table linea_costa.urbano_proximidad (
       id_urbano_proximidad integer,
       descripcion_urbano_proximidad varchar(50)
);


alter table linea_costa.urbano_proximidad
add constraint urbano_proximidad_pkey primary key (id_urbano_proximidad);

alter table linea_costa.linea_costa add constraint tipologia_nv4_linea_costa_fkey
foreign key (id_tipologia_nv4) references linea_costa.tipologia_nv4 (id_tipologia_nv4);

alter table linea_costa.tipologia_nv4 add constraint tipologia_nv4_tipologia_nv3_fkey
foreign key (id_tipologia_nv3) references linea_costa.tipologia_nv3 (id_tipologia_nv3);

alter table linea_costa.tipologia_nv3 add constraint tipologia_nv3_tipologia_nv2_fkey
foreign key (id_tipologia_nv2) references linea_costa.tipologia_nv2 (id_tipologia_nv2);

alter table linea_costa.tipologia_nv2 add constraint tipologia_nv2_tipologia_nv1_fkey
foreign key (id_tipologia_nv1) references linea_costa.tipologia_nv1 (id_tipologia_nv1);

alter table linea_costa.linea_costa add constraint playa_linea_costa_fkey
foreign key (id_playa) references linea_costa.playa(id_playa);

alter table linea_costa.linea_costa add constraint duna_linea_costa_fkey
foreign key (id_duna) references linea_costa.duna(id_duna);

alter table linea_costa.linea_costa add constraint acantilado_linea_costa_fkey
foreign key (id_acantilado) references linea_costa.acantilado(id_acantilado);

alter table linea_costa.linea_costa add constraint sustrato_linea_costa_fkey
foreign key (id_sustrato) references linea_costa.sustrato(id_sustrato);

alter table linea_costa.linea_costa
add constraint infraestructura_frente_linea_costa_fkey
foreign key (id_infraestructura_frente)
references linea_costa.infraestructura(id_infraestructura);

alter table linea_costa.linea_costa
add constraint infraestructura_2_linea_linea_costa_fkey
foreign key (id_infraestructura_2_linea)
references linea_costa.infraestructura(id_infraestructura);

alter table linea_costa.linea_costa
add constraint infraestructura_tipo_linea_costa_fkey
foreign key (id_infraestructura_tipo)
references linea_costa.infraestructura_tipo(id_infraestructura_tipo);

alter table linea_costa.linea_costa
add constraint infaestructura_localizacion_linea_costa_fkey
foreign key (id_infraestructura_localizacion)
references linea_costa.infraestructura_localizacion(id_infraestructura_localizacion);

alter table linea_costa.linea_costa
add constraint infraestructura_exposicion_linea_costa_fkey
foreign key (id_infraestructura_exposicion)
references linea_costa.infraestructura_exposicion(id_infraestructura_exposicion);

alter table linea_costa.linea_costa add constraint criterio_linea_costa_fkey
foreign key (id_criterio) references linea_costa.criterio(id_criterio);

alter table linea_costa.linea_costa add constraint deslinde_linea_costa_fkey
foreign key (id_deslinde) references linea_costa.deslinde(id_deslinde);

alter table linea_costa.linea_costa add constraint tipo_margen_linea_costa_fkey
foreign key (id_tipo_margen) references linea_costa.tipo_margen(id_tipo_margen);

alter table linea_costa.linea_costa add constraint estacion_linea_costa_fkey
foreign key (id_estacion) references linea_costa.estacion(id_estacion);

alter table linea_costa.linea_costa add constraint urbano_linea_costa_fkey
foreign key (id_urbano) references linea_costa.urbano(id_urbano);

alter table linea_costa.linea_costa
add constraint urbano_proximidad_linea_costa_fkey
foreign key (id_urbano_proximidad)
references linea_costa.urbano_proximidad(id_urbano_proximidad);

alter table linea_costa.linea_costa
add constraint fuente_toponimo_ssl_linea_costa_fkey
foreign key (id_fuente_toponimo_ssl)
references linea_costa.fuente_toponimo_ssl(id_fuente_toponimo_ssl);

alter table linea_costa.linea_costa add constraint fuente_linea_costa_fkey
foreign key (id_fuente) references linea_costa.fuente(id_fuente);

alter table linea_costa.linea_costa add constraint tipo_linea_fkey
foreign key (id_tipo_linea) references linea_costa.tipo_linea(id_tipo_linea);


/*

  Vistas

*/
create or replace view linea_costa_export.vw__complete_table as
select
  t.id_linea_costa,
  n1.id_tipologia_nv1,
  n2.id_tipologia_nv2,
  n3.id_tipologia_nv3,
  t.id_tipologia_nv4,
  id_playa,
  id_duna,
  id_acantilado,
  id_infraestructura_frente,
  id_infraestructura_2_linea,
  id_infraestructura_tipo,
  id_infraestructura_localizacion,
  id_infraestructura_exposicion,
  id_criterio,
  id_deslinde,
  id_tipo_margen,
  id_estacion,
  estacion_comentario,
  id_fuente,
  id_urbano,
  id_urbano_proximidad,
  tipo_toponimo_ssl,
  toponimo_ssl,
  id_fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  excl_dsas,
  causa_excl,
  fecha_excl,
  id_tipo_linea,
  id_sustrato,
  duna_anchura,
  duna_anc_indicador,
  st_length(geom) as length,
  geom
from
  linea_costa.linea_costa t
  left join linea_costa.tipologia_nv4 n4
  on t.id_tipologia_nv4=n4.id_tipologia_nv4
  left join linea_costa.tipologia_nv3 n3
  on n3.id_tipologia_nv3=n4.id_tipologia_nv3
  left join linea_costa.tipologia_nv2 n2
  on n2.id_tipologia_nv2=n3.id_tipologia_nv2
  left join linea_costa.tipologia_nv1 n1
  on n1.id_tipologia_nv1=n2.id_tipologia_nv1;


create or replace view linea_costa_export.vw__complete_table_larga as
select *
from linea_costa_export.vw__complete_table
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__complete_table_corta as
select *
from linea_costa_export.vw__complete_table
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__complete_table_erosion as
select *
from linea_costa_export.vw__complete_table
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__complete_described as
select
  t.id_linea_costa as id_linea_costa,
  tp.id_tipo_linea as id_tipo_linea,
  tp.descripcion as tipo_linea,
  n1.id_tipologia_nv1 as id_nv1,
  n1.descripcion_nv1 as nv1,
  n2.id_tipologia_nv2 as id_nv2,
  n2.descripcion_nv2 as nv2,
  n3.id_tipologia_nv3 as id_nv3,
  n3.descripcion_nv3 as nv3,
  n4.id_tipologia_nv4 as id_nv4,
  n4.descripcion_nv4 as nv4,
  p.id_playa as id_playa,
  p.descripcion_playa as playas,
  d.id_duna as id_duna,
  d.descripcion_duna as dunas,
  subs.id_sustrato as id_sustrato,
  subs.descripcion as sustrato,
  t.duna_anchura as duna_anchura,
  t.duna_anc_indicador as duna_anc_indicador,
  a.id_acantilado as id_acantilado,
  a.descripcion_acantilado as acantilados,
  t.id_infraestructura_frente as id_infraestructura_frente,
  i1.descripcion_infraestructura as infraestructura_frente,
  t.id_infraestructura_2_linea as id_infraestructura_2_linea,
  i2.descripcion_infraestructura as infraestructura_2_linea,
  t.id_infraestructura_tipo as id_infraestructura_tipo,
  it.descripcion_infraestructura_tipo as infraestructura_tipo,
  t.id_infraestructura_localizacion as id_infraestructura_localizacion,
  il.descripcion_infraestructura_localizacion as infraestructura_localizacion,
  t.id_infraestructura_exposicion as id_infraestructura_exposicion,
  ie.descripcion_infraestructura_exposicion as infraestructura_exposicion,
  t.id_criterio as id_criterio,
  c.descripcion_criterio as criterio,
  t.id_deslinde as id_deslinde,
  de.descripcion_deslinde as deslinde,
  t.id_tipo_margen as id_tipo_margen,
  tm.descripcion_tipo_margen as tipo_margen,
  t.id_estacion as id_estacion,
  es.descripcion_estacion as estacion,
  estacion_comentario as estacion_comentario,
  t.id_fuente as id_fuente,
  fu.texto_wms as texto_wms,
  t.id_urbano as id_urbano,
  ur.descripcion_urbano as urbano,
  t.id_urbano_proximidad as id_urbano_proximidad,
  up.descripcion_urbano_proximidad as urbano_proximidad,
  tipo_toponimo_ssl,
  toponimo_ssl,
  t.id_fuente_toponimo_ssl as id_fuente_toponimo_ssl,
  ft.descripcion_fuente_toponimo_ssl as fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from
  linea_costa.linea_costa t
  left join linea_costa.sustrato subs
  on t.id_sustrato=subs.id_sustrato
  left join linea_costa.tipologia_nv4 n4
  on t.id_tipologia_nv4=n4.id_tipologia_nv4
  left join linea_costa.tipo_linea tp
  on t.id_tipo_linea=tp.id_tipo_linea
  left join linea_costa.tipologia_nv3 n3
  on n3.id_tipologia_nv3=n4.id_tipologia_nv3
  left join linea_costa.tipologia_nv2 n2
  on n2.id_tipologia_nv2=n3.id_tipologia_nv2
  left join linea_costa.tipologia_nv1 n1
  on n1.id_tipologia_nv1=n2.id_tipologia_nv1
  left join linea_costa.playa p
  on t.id_playa=p.id_playa
  left join linea_costa.duna d
  on t.id_duna=d.id_duna
  left join linea_costa.acantilado a
  on t.id_acantilado=a.id_acantilado
  left join linea_costa.infraestructura i1
  on t.id_infraestructura_frente=i1.id_infraestructura
  left join linea_costa.infraestructura i2
  on t.id_infraestructura_2_linea=i2.id_infraestructura
  left join linea_costa.infraestructura_tipo it
  on t.id_infraestructura_tipo=it.id_infraestructura_tipo
  left join linea_costa.infraestructura_localizacion il
  on t.id_infraestructura_localizacion=il.id_infraestructura_localizacion
  left join linea_costa.infraestructura_exposicion ie
  on t.id_infraestructura_exposicion=ie.id_infraestructura_exposicion
  left join linea_costa.criterio c on t.id_criterio=c.id_criterio
  left join linea_costa.deslinde de on t.id_deslinde=de.id_deslinde
  left join linea_costa.tipo_margen tm on t.id_tipo_margen=tm.id_tipo_margen
  left join linea_costa.estacion es on t.id_estacion=es.id_estacion
  left join linea_costa.urbano ur on t.id_urbano=ur.id_urbano
  left join linea_costa.urbano_proximidad up
  on t.id_urbano_proximidad=up.id_urbano_proximidad
  left join linea_costa.fuente_toponimo_ssl ft
  on t.id_fuente_toponimo_ssl=ft.id_fuente_toponimo_ssl
  left join linea_costa.fuente fu on t.id_fuente=fu.id_fuente;


create or replace view linea_costa_export.vw__complete_described_larga as
select *
from linea_costa_export.vw__complete_described
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__complete_described_corta as
select *
from linea_costa_export.vw__complete_described
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__complete_described_erosion as
select *
from linea_costa_export.vw__complete_described
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__linea_costa_descrita as
with a as(
select
  id_tipo_linea,
  tipo_linea,
  nv1,
  nv2,
  nv3,
  nv4,
  playas,
  dunas,
  sustrato,
  duna_anchura,
  duna_anc_indicador,
  acantilados,
  infraestructura_frente,
  infraestructura_2_linea,
  infraestructura_tipo,
  infraestructura_localizacion,
  infraestructura_exposicion,
  criterio,
  deslinde,
  tipo_margen,
  estacion,
  estacion_comentario,
  texto_wms,
  urbano,
  urbano_proximidad,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  (st_dump(st_linemerge(st_collect(geom)))).geom as geom
from
  linea_costa_export.vw__complete_described
group by
  id_tipo_linea,
  tipo_linea,
  nv1,
  nv2,
  nv3,
  nv4,
  playas,
  dunas,
  sustrato,
  duna_anchura,
  duna_anc_indicador,
  acantilados,
  infraestructura_frente,
  infraestructura_2_linea,
  infraestructura_tipo,
  infraestructura_localizacion,
  infraestructura_exposicion,
  criterio,
  deslinde,
  tipo_margen,
  estacion,
  estacion_comentario,
  texto_wms,
  urbano,
  urbano_proximidad,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio)
select
  row_number() over (order by tipo_linea) as gid,
  id_tipo_linea,
  tipo_linea,
  nv1,
  nv2,
  nv3,
  nv4,
  playas,
  dunas,
  sustrato,
  duna_anchura,
  duna_anc_indicador,
  acantilados,
  infraestructura_frente,
  infraestructura_2_linea,
  infraestructura_tipo,
  infraestructura_localizacion,
  infraestructura_exposicion,
  criterio,
  deslinde,
  tipo_margen,
  estacion,
  estacion_comentario,
  texto_wms,
  urbano,
  urbano_proximidad,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from
  a;

create or replace view linea_costa_export.vw__completa_descrita as
select
  row_number() over (order by tipo_linea) as gid,
  tipo_linea,
  nv1,
  nv2,
  nv3,
  nv4,
  playas,
  dunas,
  sustrato,
  duna_anchura,
  duna_anc_indicador,
  acantilados,
  infraestructura_frente,
  infraestructura_2_linea,
  infraestructura_tipo,
  infraestructura_localizacion,
  infraestructura_exposicion,
  criterio,
  deslinde,
  tipo_margen,
  estacion,
  estacion_comentario,
  texto_wms,
  urbano,
  urbano_proximidad,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from 
  linea_costa_export.vw__linea_costa_descrita;

create or replace view linea_costa_export.vw__linea_costa_descrita_larga as
select 
  row_number() over (order by tipo_linea) as gid,
  tipo_linea,
  nv1,
  nv2,
  nv3,
  nv4,
  playas,
  dunas,
  sustrato,
  duna_anchura,
  duna_anc_indicador,
  acantilados,
  infraestructura_frente,
  infraestructura_2_linea,
  infraestructura_tipo,
  infraestructura_localizacion,
  infraestructura_exposicion,
  criterio,
  deslinde,
  tipo_margen,
  estacion,
  estacion_comentario,
  texto_wms,
  urbano,
  urbano_proximidad,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from linea_costa_export.vw__linea_costa_descrita
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__linea_costa_descrita_corta as
select
  row_number() over (order by tipo_linea) as gid,
  tipo_linea,
  nv1,
  nv2,
  nv3,
  nv4,
  playas,
  dunas,
  sustrato,
  duna_anchura,
  duna_anc_indicador,
  acantilados,
  infraestructura_frente,
  infraestructura_2_linea,
  infraestructura_tipo,
  infraestructura_localizacion,
  infraestructura_exposicion,
  criterio,
  deslinde,
  tipo_margen,
  estacion,
  estacion_comentario,
  texto_wms,
  urbano,
  urbano_proximidad,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from linea_costa_export.vw__linea_costa_descrita
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__linea_costa_descrita_erosion as
select
  row_number() over (order by tipo_linea) as gid,
  tipo_linea,
  nv1,
  nv2,
  nv3,
  nv4,
  playas,
  dunas,
  sustrato,
  duna_anchura,
  duna_anc_indicador,
  acantilados,
  infraestructura_frente,
  infraestructura_2_linea,
  infraestructura_tipo,
  infraestructura_localizacion,
  infraestructura_exposicion,
  criterio,
  deslinde,
  tipo_margen,
  estacion,
  estacion_comentario,
  texto_wms,
  urbano,
  urbano_proximidad,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from linea_costa_export.vw__linea_costa_descrita
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__nivel_1 as
with a as(
  select
    nv1,
    id_tipo_linea,
    tipo_linea,
    deslinde,
    id_fuente,
    texto_wms,
    criterio,
    tipo_toponimo_ssl,
    toponimo_ssl,
    fuente_toponimo_ssl,
    toponimo_sigla,
    toponimo_aeroguia,
    toponimo_carta_nautica,
    toponimo_ministerio,
    (st_dump(st_linemerge(st_collect(geom)))).geom as geom
  from
    linea_costa_export.vw__complete_described
  group by
    nv1,
    id_tipo_linea,
    tipo_linea,
    deslinde,
    id_fuente,
    texto_wms,
    criterio,
    tipo_toponimo_ssl,
    toponimo_ssl,
    fuente_toponimo_ssl,
    toponimo_sigla,
    toponimo_aeroguia,
    toponimo_carta_nautica,
    toponimo_ministerio)
select
  row_number() over (order by nv1) as gid,
  nv1,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom as geom
from a;


create or replace view linea_costa_export.vw__nivel_1_larga as
select
  gid,
  nv1,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom as geom
from linea_costa_export.vw__nivel_1
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__nivel_1_corta as
select
  gid,
  nv1,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom as geom
from linea_costa_export.vw__nivel_1
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__nivel_1_erosion as
select
  gid,
  nv1,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom as geom
from linea_costa_export.vw__nivel_1
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__nivel_2 as
with a as(
  select
    nv1,
    nv2,
    id_tipo_linea,
    tipo_linea,
    deslinde,
    id_fuente,
    texto_wms,
    criterio,
    tipo_toponimo_ssl,
    toponimo_ssl,
    fuente_toponimo_ssl,
    toponimo_sigla,
    toponimo_aeroguia,
    toponimo_carta_nautica,
    toponimo_ministerio,
    (st_dump(st_linemerge(st_collect(geom)))).geom as geom
  from
    linea_costa_export.vw__complete_described
  group by
    nv1,
    nv2,
    id_tipo_linea,
    tipo_linea,
    deslinde,
    id_fuente,
    texto_wms,
    criterio,
    tipo_toponimo_ssl,
    toponimo_ssl,
    fuente_toponimo_ssl,
    toponimo_sigla,
    toponimo_aeroguia,
    toponimo_carta_nautica,
    toponimo_ministerio)
select 
  row_number() over (order by id_tipo_linea) as gid,
  nv1,
  nv2,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from a;


create or replace view linea_costa_export.vw__nivel_2_larga as
select
  gid,
  nv1,
  nv2,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__nivel_2
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__nivel_2_corta as
select
  gid,
  nv1,
  nv2,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__nivel_2
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__nivel_2_erosion as
select
  gid,
  nv1,
  nv2,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__nivel_2
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__nivel_3 as
with a as(
  select
    nv1,
    nv2,
    nv3,
    id_tipo_linea,
    tipo_linea,
    deslinde,
    id_fuente,
    texto_wms,
    criterio,
    tipo_toponimo_ssl,
    toponimo_ssl,
    fuente_toponimo_ssl,
    toponimo_sigla,
    toponimo_aeroguia,
    toponimo_carta_nautica,
    toponimo_ministerio,
    (st_dump(st_linemerge(st_collect(geom)))).geom as geom
  from
    linea_costa_export.vw__complete_described
  group by
    nv1,
    nv2,
    nv3,
    id_tipo_linea,
    tipo_linea,
    deslinde,
    id_fuente,
    texto_wms,
    criterio,
    tipo_toponimo_ssl,
    toponimo_ssl,
    fuente_toponimo_ssl,
    toponimo_sigla,
    toponimo_aeroguia,
    toponimo_carta_nautica,
    toponimo_ministerio)
select
  row_number() over (order by id_tipo_linea) as gid,
  nv1,
  nv2,
  nv3,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from a;

create or replace view linea_costa_export.vw__nivel_3_larga as
select
  gid,
  nv1,
  nv2,
  nv3,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__nivel_3
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__nivel_3_corta as
select
  gid,
  nv1,
  nv2,
  nv3,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__nivel_3
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__nivel_3_erosion as
select
  gid,
  nv1,
  nv2,
  nv3,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__nivel_3
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__nivel_4 as
with a as(
  select
    nv1,
    nv2,
    nv3,
    nv4,
    id_tipo_linea,
    tipo_linea,
    deslinde,
    id_fuente,
    texto_wms,
    criterio,
    tipo_toponimo_ssl,
    toponimo_ssl,
    fuente_toponimo_ssl,
    toponimo_sigla,
    toponimo_aeroguia,
    toponimo_carta_nautica,
    toponimo_ministerio,
    (st_dump(st_linemerge(st_collect(geom)))).geom as geom
  from
    linea_costa_export.vw__complete_described
  group by
    nv1,
    nv2,
    nv3,
    nv4,
    id_tipo_linea,
    tipo_linea,
    deslinde,
    id_fuente,
    texto_wms,
    criterio,
    tipo_toponimo_ssl,
    toponimo_ssl,
    fuente_toponimo_ssl,
    toponimo_sigla,
    toponimo_aeroguia,
    toponimo_carta_nautica,
    toponimo_ministerio)
select
  row_number() over (order by id_tipo_linea) as gid,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from a;


create or replace view linea_costa_export.vw__nivel_4_larga as
select
  gid,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__nivel_4
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__nivel_4_corta as
select
  gid,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__nivel_4
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__nivel_4_erosion as
select
  gid,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  deslinde,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__nivel_4
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__playas as
select
  row_number() over (order by id_tipo_linea) as gid,
  playas,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  sustrato,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from
  linea_costa_export.vw__complete_described
where playas is not null;


create or replace view linea_costa_export.vw__playas_larga as
select
  gid,
  playas,
  nv1,
  nv2,
  nv3,
  nv4,
  tipo_linea,
  sustrato,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from linea_costa_export.vw__playas
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__playas_corta as
select
  gid,
  playas,
  nv1,
  nv2,
  nv3,
  nv4,
  tipo_linea,
  sustrato,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from linea_costa_export.vw__playas
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__playas_erosion as
select
  gid,
  playas,
  nv1,
  nv2,
  nv3,
  nv4,
  tipo_linea,
  sustrato,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from linea_costa_export.vw__playas
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__dunas as
select
  row_number() over (order by id_tipo_linea) as gid,
  dunas,
  duna_anchura,
  duna_anc_indicador,
  sustrato,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from
  linea_costa_export.vw__complete_described
where dunas is not null;


create or replace view linea_costa_export.vw__dunas_larga as
select
  gid,
  dunas,
  duna_anchura,
  duna_anc_indicador,
  sustrato,
  nv1,
  nv2,
  nv3,
  nv4,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__dunas
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__dunas_corta as
select
  gid,
  dunas,
  duna_anchura,
  duna_anc_indicador,
  sustrato,
  nv1,
  nv2,
  nv3,
  nv4,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__dunas
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__dunas_erosion as
select
  gid,
  dunas,
  duna_anchura,
  duna_anc_indicador,
  sustrato,
  nv1,
  nv2,
  nv3,
  nv4,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__dunas
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__acantilados as
select
  row_number() over (order by id_tipo_linea) as gid,
  acantilados,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from
  linea_costa_export.vw__complete_described
where acantilados is not null;


create or replace view linea_costa_export.vw__acantilados_larga as
select
  gid,
  acantilados,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__acantilados
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__acantilados_corta as
select  
  gid,
  acantilados,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__acantilados
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__acantilados_erosion as
select
  gid,
  acantilados,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__acantilados
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__infraestructuras as
select
  row_number() over (order by id_tipo_linea) as gid,
  infraestructura_frente,
  infraestructura_2_linea,
  infraestructura_tipo,
  infraestructura_localizacion,
  infraestructura_exposicion,
  id_tipo_linea,
  tipo_linea,
  nv1,
  nv2,
  nv3,
  nv4,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from
  linea_costa_export.vw__complete_described
where infraestructura_frente is not null;


create or replace view linea_costa_export.vw__infraestructuras_larga as
select
  gid,
  infraestructura_frente,
  infraestructura_2_linea,
  infraestructura_tipo,
  infraestructura_localizacion,
  infraestructura_exposicion,
  id_tipo_linea,
  tipo_linea,
  nv1,
  nv2,
  nv3,
  nv4,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__infraestructuras
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__infraestructuras_corta as
select
  gid,
  infraestructura_frente,
  infraestructura_2_linea,
  infraestructura_tipo,
  infraestructura_localizacion,
  infraestructura_exposicion,
  id_tipo_linea,
  tipo_linea,
  nv1,
  nv2,
  nv3,
  nv4,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__infraestructuras
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__infraestructuras_erosion as
select
  gid,
  infraestructura_frente,
  infraestructura_2_linea,
  infraestructura_tipo,
  infraestructura_localizacion,
  infraestructura_exposicion,
  id_tipo_linea,
  tipo_linea,
  nv1,
  nv2,
  nv3,
  nv4,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__infraestructuras
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__margenes_estuarios_canyos as
select
  row_number() over (order by id_tipo_linea) as gid,
  tipo_margen,
  deslinde,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from
  linea_costa_export.vw__complete_described
where tipo_margen is not null;


create or replace view linea_costa_export.vw__margenes_estuarios_canyos_larga as
select
  gid,
  tipo_margen,
  deslinde,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__margenes_estuarios_canyos
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__margenes_estuarios_canyos_corta as
select
  gid,
  tipo_margen,
  deslinde,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__margenes_estuarios_canyos
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__margenes_estuarios_canyos_erosion as
select
  gid,
  tipo_margen,
  deslinde,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__margenes_estuarios_canyos
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__urbano as
select
  row_number() over (order by id_tipo_linea) as gid,
  urbano,
  urbano_proximidad,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from
  linea_costa_export.vw__complete_described
where
  urbano is not null;


create or replace view linea_costa_export.vw__urbano_larga as
select
  gid,
  urbano,
  urbano_proximidad,
  nv1,
  nv2,
  nv3,
  nv4,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__urbano
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__urbano_corta as
select
  gid,
  urbano,
  urbano_proximidad,
  nv1,
  nv2,
  nv3,
  nv4,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__urbano
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__urbano_erosion as
select
  gid,
  urbano,
  urbano_proximidad,
  nv1,
  nv2,
  nv3,
  nv4,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__urbano
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__criterio as
select
  row_number() over (order by id_tipo_linea) as gid,
  criterio,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from
  linea_costa_export.vw__complete_described
where criterio is not null;


create or replace view linea_costa_export.vw__criterio_larga as
select
  gid,
  criterio,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__criterio
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__criterio_corta as
select
  gid,
  criterio,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__criterio
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__criterio_erosion as
select
  gid,
  criterio,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__criterio
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__fechas as
select
  row_number() over (order by id_tipo_linea) as gid,
  nv1,
  nv2,
  nv3,
  nv4,
  id_tipo_linea,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from
  linea_costa_export.vw__complete_described;


create or replace view linea_costa_export.vw__fechas_larga as
select
  gid,
  nv1,
  nv2,
  nv3,
  nv4,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__fechas
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__fechas_corta as
select
  gid,
  nv1,
  nv2,
  nv3,
  nv4,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__fechas
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__fechas_erosion as
select
  gid,
  nv1,
  nv2,
  nv3,
  nv4,
  tipo_linea,
  id_fuente,
  texto_wms,
  criterio,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__fechas
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__toponimo_aeroguia as
with a as(
  select
    id_tipo_linea,
    tipo_linea,
    toponimo_aeroguia,
    (st_dump(st_linemerge(st_collect(geom)))).geom as geom
  from
    linea_costa_export.vw__complete_described
  where toponimo_aeroguia is not null
  group by
    id_tipo_linea,
    tipo_linea,
    toponimo_aeroguia)
select
  row_number() over (order by id_tipo_linea) as gid,
  id_tipo_linea,
  tipo_linea,
  toponimo_aeroguia,
  st_length(geom) as length,
  geom as geom
from a;


create or replace view linea_costa_export.vw__toponimo_aeroguia_larga as
select
  gid,
  id_tipo_linea,
  tipo_linea,
  toponimo_aeroguia,
  length,
  geom
from linea_costa_export.vw__toponimo_aeroguia
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__toponimo_aeroguia_corta as
select
  gid,
  id_tipo_linea,
  tipo_linea,
  toponimo_aeroguia,
  length,
  geom
from linea_costa_export.vw__toponimo_aeroguia
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__toponimo_aeroguia_erosion as
select
  gid,
  id_tipo_linea,
  tipo_linea,
  toponimo_aeroguia,
  length,
  geom
from linea_costa_export.vw__toponimo_aeroguia
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__toponimo_ssl as
with a as(
  select
    id_tipo_linea,
    tipo_linea,
    tipo_toponimo_ssl,
    toponimo_ssl,
    fuente_toponimo_ssl,
    (st_dump(st_linemerge(st_collect(geom)))).geom as geom
  from
    linea_costa_export.vw__complete_described
  where toponimo_ssl is not null
  group by
    id_tipo_linea,
    tipo_linea,
    tipo_toponimo_ssl,
    toponimo_ssl,
    fuente_toponimo_ssl)
select
  row_number() over (order by id_tipo_linea) as gid,
  id_tipo_linea,
  tipo_linea,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  st_length(geom) as length,
  geom
from a;


create or replace view linea_costa_export.vw__toponimo_ssl_larga as
select
  gid,
  tipo_linea,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  length,
  geom
from linea_costa_export.vw__toponimo_ssl
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__toponimo_ssl_corta as
select
  gid,
  tipo_linea,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  length,
  geom
from linea_costa_export.vw__toponimo_ssl
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__toponimo_ssl_erosion as
select
  gid,
  tipo_linea,
  tipo_toponimo_ssl,
  toponimo_ssl,
  fuente_toponimo_ssl,
  length,
  geom
from linea_costa_export.vw__toponimo_ssl
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__toponimo_sigla as
with a as(
  select
    id_tipo_linea,
    tipo_linea,
    toponimo_sigla,
    (st_dump(st_linemerge(st_collect(geom)))).geom as geom
  from
    linea_costa_export.vw__complete_described
  where toponimo_sigla is not null
  group by
    id_tipo_linea,
    tipo_linea,
    toponimo_sigla)
select
  row_number() over (order by id_tipo_linea) as gid,
  id_tipo_linea,
  tipo_linea,
  toponimo_sigla,
  st_length(geom) as length,
  geom
from a;


create or replace view linea_costa_export.vw__toponimo_sigla_larga as
select
  gid,
  tipo_linea,
  toponimo_sigla,
  length,
  geom
from linea_costa_export.vw__toponimo_sigla
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__toponimo_sigla_corta as
select 
  gid,
  tipo_linea,
  toponimo_sigla,
  length,
  geom
from linea_costa_export.vw__toponimo_sigla
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__toponimo_sigla_erosion as
select 
  gid,
  tipo_linea,
  toponimo_sigla,
  length,
  geom
from linea_costa_export.vw__toponimo_sigla
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__toponimo_carta_nautica as
with a as(
  select
    id_tipo_linea,
    tipo_linea,
    toponimo_carta_nautica,
    (st_dump(st_linemerge(st_collect(geom)))).geom as geom
  from
    linea_costa_export.vw__complete_described
  where toponimo_carta_nautica is not null
  group by
    id_tipo_linea,
    tipo_linea,
    toponimo_carta_nautica)
select
  row_number() over (order by id_tipo_linea) as gid,
  id_tipo_linea,
  tipo_linea,
  toponimo_carta_nautica,
  st_length(geom) as length,
  geom
from a;


create or replace view linea_costa_export.vw__toponimo_carta_nautica_larga as
select
  gid,
  tipo_linea,
  toponimo_carta_nautica,
  length,
  geom
from linea_costa_export.vw__toponimo_carta_nautica
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__toponimo_carta_nautica_corta as
select
  gid,
  tipo_linea,
  toponimo_carta_nautica,
  length,
  geom
from linea_costa_export.vw__toponimo_carta_nautica
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__toponimo_carta_nautica_erosion as
select
  gid,
  tipo_linea,
  toponimo_carta_nautica,
  length,
  geom
from linea_costa_export.vw__toponimo_carta_nautica
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__toponimo_ministerio as
with a as(
  select
    id_tipo_linea,
    tipo_linea,
    toponimo_ministerio,
    (st_dump(st_linemerge(st_collect(geom)))).geom as geom
  from
    linea_costa_export.vw__complete_described
  where toponimo_ministerio is not null
  group by
    id_tipo_linea,
    tipo_linea,
    toponimo_ministerio)
select
  row_number() over (order by id_tipo_linea) as gid,
  id_tipo_linea,
  tipo_linea,
  toponimo_ministerio,
  st_length(geom) as length,
  geom
from a;


create or replace view linea_costa_export.vw__toponimo_ministerio_larga as
select
  gid,
  tipo_linea,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__toponimo_ministerio
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__toponimo_ministerio_corta as
select
  gid,
  tipo_linea,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__toponimo_ministerio
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__toponimo_ministerio_erosion as
select
  gid,
  tipo_linea,
  toponimo_ministerio,
  length,
  geom
from linea_costa_export.vw__toponimo_ministerio
where id_tipo_linea in (0,2,3,5,6);


create or replace view linea_costa_export.vw__linea_costa as
with base as (
  select
    e.id_tipologia_nv1,
    d.id_tipologia_nv2,
    c.id_tipologia_nv3,
    a.id_tipologia_nv4,
    a.id_playa,
    a.id_duna,
    a.id_acantilado,
    a.id_infraestructura_frente,
    a.id_infraestructura_2_linea,
    a.id_infraestructura_tipo,
    a.id_infraestructura_localizacion,
    a.id_infraestructura_exposicion,
    a.id_criterio,
    a.id_deslinde,
    a.id_tipo_margen,
    a.id_estacion,
    a.estacion_comentario,
    a.id_fuente,
    a.id_urbano,
    a.id_urbano_proximidad,
    a.tipo_toponimo_ssl,
    a.toponimo_ssl,
    a.id_fuente_toponimo_ssl,
    a.toponimo_sigla,
    a.toponimo_aeroguia,
    a.toponimo_carta_nautica,
    a.toponimo_ministerio,
    a.excl_dsas,
    a.causa_excl,
    a.fecha_excl,
    a.id_tipo_linea,
    a.id_sustrato,
    a.duna_anchura,
    a.duna_anc_indicador,
    a.tramos_cambiados,
    st_length(geom) as length,
    geom
  from
    linea_costa.linea_costa a inner join 
    linea_costa.tipologia_nv4 b on 
    a.id_tipologia_nv4=b.id_tipologia_nv4 inner join
    linea_costa.tipologia_nv3 c on
    b.id_tipologia_nv3=c.id_tipologia_nv3 inner join
    linea_costa.tipologia_nv2 d on
    c.id_tipologia_nv2=d.id_tipologia_nv2 inner join
    linea_costa.tipologia_nv1 e on 
    d.id_tipologia_nv1=e.id_tipologia_nv1)
select



create or replace view linea_costa_export.vw__sustrato as
with a as(
select
  sustrato,
  id_tipo_linea,
  tipo_linea,
  (st_dump(st_linemerge(st_collect(geom)))).geom as geom
from
  linea_costa_export.vw__complete_described
where sustrato is not null
group by
  sustrato,
  id_tipo_linea,
  tipo_linea
)
select
  row_number() over (order by sustrato) as gid,
  sustrato,
  id_tipo_linea,
  tipo_linea,
  st_length(geom) as length,
  geom
from
  a;


create or replace view linea_costa_export.vw__sustrato_larga as
select
  gid,
  tipo_linea,
  sustrato,
  length,
  geom
from linea_costa_export.vw__sustrato
where id_tipo_linea in (0,1,3,4,5,6);


create or replace view linea_costa_export.vw__sustrato_corta as
select
  gid,
  tipo_linea,
  sustrato,
  length,
  geom
from linea_costa_export.vw__sustrato
where id_tipo_linea in (0,1,7);


create or replace view linea_costa_export.vw__sustrato_erosion as
select
  gid,
  tipo_linea,
  sustrato,
  length,
  geom
from linea_costa_export.vw__sustrato
where id_tipo_linea in (0,2,3,5,6);


commit;

vacuum;
