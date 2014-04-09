create table trash.test_line2 as
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
  excl_dsas,
  causa_excl,
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
  excl_dsas,
  causa_excl,
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
  excl_dsas,
  causa_excl,
  fecha_excl,
  id_sustrato,
  duna_anchura,
  duna_anc_indicador,
  tramos_cambiados;
