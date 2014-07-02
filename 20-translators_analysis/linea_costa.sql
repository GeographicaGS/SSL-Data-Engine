/*

  Translates from linea_costa_import_XXX to linea_costa_XXX.

*/

begin;

delete from geometry_columns
where f_table_schema='linea_costa_import';

delete from linea_costa.linea_costa;
delete from linea_costa.tipo_linea;
delete from linea_costa.infraestructura_exposicion;
delete from linea_costa.infraestructura;
delete from linea_costa.fuente_toponimo_ssl;
delete from linea_costa.fuente;
delete from linea_costa.estacion;
delete from linea_costa.duna;
delete from linea_costa.deslinde;
delete from linea_costa.criterio;
delete from linea_costa.acantilado;
delete from linea_costa.tipo_margen;
delete from linea_costa.playa;
delete from linea_costa.infraestructura_localizacion;
delete from linea_costa.infraestructura_tipo;
delete from linea_costa.urbano_proximidad;
delete from linea_costa.urbano;
delete from linea_costa.tipologia_nv4;
delete from linea_costa.tipologia_nv3;
delete from linea_costa.tipologia_nv2;
delete from linea_costa.tipologia_nv1;
delete from linea_costa.sustrato;
delete from linea_costa.causa_excl;
delete from linea_costa.excl_dsas;


insert into linea_costa.causa_excl
select
  id_causa_excl,
  causa_excl
from
  linea_costa_import.causa_excl
order by
  id_causa_excl;


insert into linea_costa.excl_dsas
select
  id_excl_dsas,
  excl_dsas
from
  linea_costa_import.excl_dsas
order by
  id_excl_dsas;


insert into linea_costa.tipo_margen
select
  id_tipo_margen::integer,
  descripcion_tipo_margen
from
  linea_costa_import.tipo_margen
order by
  id_tipo_margen;


insert into linea_costa.duna
select
  id_duna::integer,
  descripcion_duna::varchar(50)
from
  linea_costa_import.duna
order by
  id_duna;


insert into linea_costa.estacion
select
  id_estacion::integer,
  descripcion_estacion::varchar(50)
from
  linea_costa_import.estacion;


insert into linea_costa.playa
select
  id_playa::integer,
  descripcion_playa
from
  linea_costa_import.playa
order by
  id_playa;


insert into linea_costa.deslinde
select
  id_deslinde::integer,
  descripcion_deslinde::varchar(10)
from
  linea_costa_import.deslinde
order by
  id_deslinde;


insert into linea_costa.infraestructura_localizacion
select
  id_infraestructura_localizacion::integer,
  descripcion_infraestructura_localizacion
from
  linea_costa_import.infraestructura_localizacion
order by
  id_infraestructura_localizacion;


insert into linea_costa.infraestructura_tipo
select
  id_infraestructura_tipo::integer,
  descripcion_infraestructura_tipo
from
  linea_costa_import.infraestructura_tipo
order by
  id_infraestructura_tipo;


insert into linea_costa.infraestructura
select
  id_infraestructura::integer,
  descripcion_infraestructura
from
  linea_costa_import.infraestructura
order by
  id_infraestructura;


insert into linea_costa.infraestructura_exposicion
select
  id_infraestructura_exposicion::integer,
  descripcion_infraestructura_exposicion
from
  linea_costa_import.infraestructura_exposicion
order by
  id_infraestructura_exposicion;


insert into linea_costa.fuente_toponimo_ssl
select
  id_fuente_toponimo_ssl::integer,
  descripcion_fuente_toponimo_ssl,
  escala,
  organismo,
  fecha,
  url_web
from
  linea_costa_import.fuente_toponimo_ssl
order by
  id_fuente_toponimo_ssl;


insert into linea_costa.urbano_proximidad
select
  id_urbano_proximidad::integer,
  descripcion_urbano_proximidad
from
  linea_costa_import.urbano_proximidad
order by 
  id_urbano_proximidad;


insert into linea_costa.fuente
select
  id_fuente::integer,
  tipo,
  resolucion_fuente,
  epsg::integer,
  crs_original,
  fuente,
  resolucion_original,
  escala,
  texto_wms,
  crs_digitalizacion,
  transformacion,
  digitalizador,
  rango_fecha
from
  linea_costa_import.fuente
order by
  id_fuente;


insert into linea_costa.urbano
select
  id_urbano::integer,
  descripcion_urbano
from
  linea_costa_import.urbano
order by 
  id_urbano;


insert into linea_costa.criterio
select
  id_criterio::integer,
  descripcion_criterio::varchar(250)
from
  linea_costa_import.criterio;


insert into linea_costa.acantilado
select
  id_acantilado::integer,
  descripcion_acantilado::varchar(250)
from
  linea_costa_import.acantilado
order by
  id_acantilado;


insert into linea_costa.tipologia_nv1(
  id_tipologia_nv1,
  descripcion_nv1)
select
  id_tipologia_nv1,
  descripcion_nv1
from
  linea_costa_import.tipologia_nv1
order by
  id_tipologia_nv1;


insert into linea_costa.tipologia_nv2(
  id_tipologia_nv2,
  descripcion_nv2,
  id_tipologia_nv1)
select
  id_tipologia_nv2,
  descripcion_nv2,
  id_tipologia_nv1
from
  linea_costa_import.tipologia_nv2
order by
  id_tipologia_nv2;


insert into linea_costa.tipologia_nv3(
  id_tipologia_nv3,
  descripcion_nv3,
  id_tipologia_nv2)
select
  id_tipologia_nv3,
  descripcion_nv3,
  id_tipologia_nv2
from
  linea_costa_import.tipologia_nv3
order by
  id_tipologia_nv3;


insert into linea_costa.tipologia_nv4(
  id_tipologia_nv4,
  descripcion_nv4,
  id_tipologia_nv3)
select
  id_tipologia_nv4,
  descripcion_nv4,
  id_tipologia_nv3
from
  linea_costa_import.tipologia_nv4
order by
  id_tipologia_nv4;


insert into linea_costa.tipo_linea(
  id_tipo_linea,
  descripcion)
select
  id_tipo_linea, 
  descripcion_tipo_linea
from
  linea_costa_import.tipo_linea
order by
  id_tipo_linea;


insert into linea_costa.sustrato
select
  id_sustrato,
  descripcion
from
  linea_costa_import.sustrato
order by
  id_sustrato;


-- Conversion from the weird geometric model from FME

insert into linea_costa.linea_costa(
  id_tipo_linea,
  id_tipologia_nv4,
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
  id_urbano,
  id_urbano_proximidad,
  id_fuente,
  tipo_toponimo_ssl,
  toponimo_ssl,
  id_fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  id_excl_dsas,
  id_causa_excl,
  fecha_excl,
  id_sustrato,
  duna_anchura,
  duna_anc_indicador,
  tramos_cambiados,
  geom)
with a as
(select
  tipo_linea::integer as id_tipo_linea,
  id_tipologia_nv4,
  id_playa::integer,
  id_duna::integer,
  id_acantilado::integer,
  id_infraestructura_frente::integer,
  id_infraestructura_2_linea::integer,
  id_infraestructura_tipo::integer,
  id_infraestructura_localizacion::integer,
  id_infraestructura_exposicion::integer,
  id_criterio::integer,
  id_deslinde::integer,
  id_tipo_margen::integer,
  id_estacion::integer,
  case
    when estacion_comentario='null' then null
    else estacion_comentario
  end as estacion_comentario,
  id_urbano::integer,
  id_urbano_proximidad::integer,
  id_fuente::integer,
  case 
    when tipo_toponimo_ssl='-1' then null
    else tipo_toponimo_ssl
  end as tipo_toponimo_ssl,
  case
    when toponimo_ssl='-1' then null
    else toponimo_ssl
  end as toponimo_ssl,
  id_fuente_toponimo_ssl::integer,
  case
    when toponimo_sigla='-1' then null
    else toponimo_sigla
  end as toponimo_sigla,
  case
    when toponimo_aeroguia='-1' then null
    else toponimo_aeroguia
  end as toponimo_aeroguia,
  case
    when toponimo_carta_nautica='-1' then null
    else toponimo_carta_nautica
  end as toponimo_carta_nautica,
  case
    when toponimo_ministerio='-1' then null
    else toponimo_ministerio
  end as toponimo_ministerio,
  id_excl_dsas,
  id_causa_excl,
  fecha_excl,
  id_sustrato,
  duna_anchura,
  duna_anc_indicador,
  tramos_cambiados,
  st_curvetoline((st_dump(geom)).geom) as geom
from
  linea_costa_import.linea_costa)
select
  id_tipo_linea,
  id_tipologia_nv4,
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
  id_urbano,
  id_urbano_proximidad,
  id_fuente,
  tipo_toponimo_ssl,
  toponimo_ssl,
  id_fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  id_excl_dsas,
  id_causa_excl,
  fecha_excl,
  id_sustrato,
  duna_anchura,
  duna_anc_indicador,
  tramos_cambiados,
  (st_dump(st_linemerge(st_collect(geom)))).geom as geom
from a
group by
  id_tipo_linea,
  id_tipologia_nv4,
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
  id_urbano,
  id_urbano_proximidad,
  id_fuente,
  tipo_toponimo_ssl,
  toponimo_ssl,
  id_fuente_toponimo_ssl,
  toponimo_sigla,
  toponimo_aeroguia,
  toponimo_carta_nautica,
  toponimo_ministerio,
  id_excl_dsas,
  id_causa_excl,
  fecha_excl,
  id_sustrato,
  duna_anchura,
  duna_anc_indicador,
  tramos_cambiados;

commit;
