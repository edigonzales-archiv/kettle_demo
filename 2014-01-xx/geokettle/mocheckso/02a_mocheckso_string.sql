CREATE SCHEMA av_mocheckso
  AUTHORIZATION stefan;
GRANT ALL ON SCHEMA av_mocheckso TO stefan;
GRANT USAGE ON SCHEMA av_mocheckso TO mspublic;


CREATE TABLE av_mocheckso.mocheckso
(
  ogc_fid serial NOT NULL,
  wkb_geometry geometry,
  ricsservice character varying,
  ricsdate character varying,
  datasetname character varying,
  datasetid character varying,
  ilmodel character varying,
  iltopic character varying,
  iltable character varying,
  errorid character varying,
  errorcategory character varying,
  errorcount character varying,
  bfsnr character varying,
  kt character varying,
  errordescription character varying,
  ricsprofile character varying,
  errorx character varying,
  errory character varying,
  CONSTRAINT mocheckso_pk PRIMARY KEY (ogc_fid),
  CONSTRAINT enforce_dims_wkb_geometry CHECK (st_ndims(wkb_geometry) = 2),
  CONSTRAINT enforce_geotype_wkb_geometry CHECK (geometrytype(wkb_geometry) = 'POINT'::text OR wkb_geometry IS NULL),
  CONSTRAINT enforce_srid_wkb_geometry CHECK (st_srid(wkb_geometry) = 21781)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE av_mocheckso.mocheckso
  OWNER TO stefan;

GRANT ALL ON TABLE av_mocheckso.mocheckso TO stefan;
GRANT SELECT ON TABLE av_mocheckso.mocheckso TO mspublic;

-- Index: av_mocheckso.mocheckso_geom_idx

-- DROP INDEX av_mocheckso.mocheckso_geom_idx;

CREATE INDEX mocheckso_geom_idx
  ON av_mocheckso.mocheckso
  USING gist
  (wkb_geometry);


