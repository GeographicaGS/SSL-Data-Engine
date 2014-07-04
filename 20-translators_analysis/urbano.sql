/*

  Urbano translator.

  This has to run from PgAdmin3, so no psql directives!

*/

begin;

delete from geometry_columns
where f_table_schema='urbano_import';

delete from urbano.uso_urbano;
delete from urbano.codigo;
delete from urbano.fuente;
delete from urbano.tipologia_nv1;
delete from urbano.tipologia_nv2;
delete from urbano.tipologia_nv3;
delete from urbano.tipologia_nv4;


insert into urbano.tipologia_nv1
select
        id_tipologia_nv1::varchar(1),
        descripcion_nv1::text
from
        urbano_import.tipologia_nv1
order by id_tipologia_nv1;


insert into urbano.tipologia_nv2
select
        id_tipologia_nv2::varchar(2),
        descripcion_nv2::text,
        id_tipologia_nv1::varchar(1)
from
        urbano_import.tipologia_nv2
order by id_tipologia_nv2;


insert into urbano.tipologia_nv3
select
        id_tipologia_nv3::varchar(3),
        descripcion_nv3::text,
        id_tipologia_nv2::varchar(2)
from
        urbano_import.tipologia_nv3
order by id_tipologia_nv3;


insert into urbano.tipologia_nv4
select
        id_tipologia_nv4::varchar(4),
        descripcion_nv4::text,
        id_tipologia_nv3::varchar(3)
from
        urbano_import.tipologia_nv4
order by id_tipologia_nv4;


insert into urbano.fuente
select
        id_fuente::integer,
        tipo::text,
        resolucion_fuente::double precision,
        epsg::integer,
        crs_original::text,
        fuente::text,
        resolucion_original::double precision,
        escala::text,
        texto_wms::text,
        crs_digitalizacion::text,
        transformacion::text,
        digitalizador::text,
        rango_fecha::text
from
        urbano_import.fuente
order by id_fuente;


insert into urbano.codigo
select
        codigo_unico::varchar(2),
        id_tipologia_nv4::varchar(4)
from
        urbano_import.codigo
order by codigo_unico;


update urbano_import.urbano
set urb56=null
where urb56='';

update urbano_import.urbano
set urb78=null
where urb78='';

update urbano_import.urbano
set urb85=null
where urb85='';

update urbano_import.urbano
set urb98=null
where urb98='';

update urbano_import.urbano
set urb01=null
where urb01='';

update urbano_import.urbano
set urb04=null
where urb04='';

update urbano_import.urbano
set urb07=null
where urb07='';

update urbano_import.urbano
set urb09=null
where urb09='';

update urbano_import.urbano
set urb11=null
where urb11='';


insert into urbano.uso_urbano(
  anyo1956,
  anyo1978,
  anyo1985,
  anyo1998,
  anyo2001,
  anyo2004,
  anyo2007,
  anyo2009,
  anyo2011,
  geom)
select
  b.id_tipologia_nv4,
  c.id_tipologia_nv4,
  d.id_tipologia_nv4,
  e.id_tipologia_nv4,
  f.id_tipologia_nv4,
  g.id_tipologia_nv4,
  h.id_tipologia_nv4,
  i.id_tipologia_nv4,
  j.id_tipologia_nv4,
  st_multi(st_curvetoline(a.geom)) as geom
from
  urbano_import.urbano a left join
  urbano_import.codigo b on
  a.urb56=b.codigo_unico left join
  urbano_import.codigo c on
  a.urb78=c.codigo_unico left join
  urbano_import.codigo d on
  a.urb85=d.codigo_unico left join
  urbano_import.codigo e on
  a.urb98=e.codigo_unico left join
  urbano_import.codigo f on
  a.urb01=f.codigo_unico left join
  urbano_import.codigo g on
  a.urb04=g.codigo_unico left join
  urbano_import.codigo h on
  a.urb07=h.codigo_unico left join
  urbano_import.codigo i on
  a.urb09=i.codigo_unico left join
  urbano_import.codigo j on
  a.urb11=j.codigo_unico;


select ssl__urbano_analysis(array['1956', '1978', '1985', '1998', 
                                   '2001', '2004', '2007', '2009', '2011']::varchar[]);

commit;
