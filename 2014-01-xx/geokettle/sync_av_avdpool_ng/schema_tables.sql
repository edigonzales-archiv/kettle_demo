CREATE SCHEMA av_avdpool_ng
  AUTHORIZATION stefan;
GRANT ALL ON SCHEMA av_avdpool_ng TO stefan;
GRANT USAGE ON SCHEMA av_avdpool_ng TO mspublic;

/*
-- ogc_fid als SERIAL oder bloss INTEGER? PK aber natürlich immer.
*/


-- Table: av_avdpool_ng.gemeindegrenzen_gemeindegrenze

-- DROP TABLE av_avdpool_ng.gemeindegrenzen_gemeindegrenze;

CREATE TABLE av_avdpool_ng.gemeindegrenzen_gemeindegrenze
(
  ogc_fid integer NOT NULL,
  tid character varying,
  entstehung character varying,
  gemeindegrenze_von character varying,
  geometrie geometry(Polygon,21781),
  gem_bfs integer,
  los integer,
  lieferdatum date,
  CONSTRAINT gemeindegrenzen_gemeindegrenze_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE av_avdpool_ng.gemeindegrenzen_gemeindegrenze OWNER TO stefan;
GRANT ALL ON TABLE av_avdpool_ng.gemeindegrenzen_gemeindegrenze TO stefan;
GRANT SELECT ON TABLE av_avdpool_ng.gemeindegrenzen_gemeindegrenze TO mspublic;

-- Index: av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_entstehung

-- DROP INDEX av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_entstehung;

CREATE INDEX idx_gemeindegrenzen_gemeindegrenze_entstehung
  ON av_avdpool_ng.gemeindegrenzen_gemeindegrenze
  USING btree
  (entstehung);

-- Index: av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_gem_bfs

-- DROP INDEX av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_gem_bfs;

CREATE INDEX idx_gemeindegrenzen_gemeindegrenze_gem_bfs
  ON av_avdpool_ng.gemeindegrenzen_gemeindegrenze
  USING btree
  (gem_bfs);

-- Index: av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_gemeindegrenze_von

-- DROP INDEX av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_gemeindegrenze_von;

CREATE INDEX idx_gemeindegrenzen_gemeindegrenze_gemeindegrenze_von
  ON av_avdpool_ng.gemeindegrenzen_gemeindegrenze
  USING btree
  (gemeindegrenze_von);

-- Index: av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_geometrie

-- DROP INDEX av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_geometrie;

CREATE INDEX idx_gemeindegrenzen_gemeindegrenze_geometrie
  ON av_avdpool_ng.gemeindegrenzen_gemeindegrenze
  USING gist
  (geometrie);

-- Index: av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_los

-- DROP INDEX av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_los;

CREATE INDEX idx_gemeindegrenzen_gemeindegrenze_los
  ON av_avdpool_ng.gemeindegrenzen_gemeindegrenze
  USING btree
  (los);

-- Index: av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_ogc_fid

-- DROP INDEX av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_ogc_fid;

CREATE INDEX idx_gemeindegrenzen_gemeindegrenze_ogc_fid
  ON av_avdpool_ng.gemeindegrenzen_gemeindegrenze
  USING btree
  (ogc_fid);

-- Index: av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_tid

-- DROP INDEX av_avdpool_ng.idx_gemeindegrenzen_gemeindegrenze_tid;

CREATE INDEX idx_gemeindegrenzen_gemeindegrenze_tid
  ON av_avdpool_ng.gemeindegrenzen_gemeindegrenze
  USING btree
  (tid);




-- Table: av_avdpool_ng.bodenbedeckung_boflaeche

-- DROP TABLE av_avdpool_ng.bodenbedeckung_boflaeche;

CREATE TABLE av_avdpool_ng.bodenbedeckung_boflaeche
(
  ogc_fid serial NOT NULL,
  tid character varying,
  entstehung character varying,
  geometrie geometry(Polygon,21781),
  qualitaet integer,
  qualitaet_txt character varying,
  art integer,
  art_txt character varying,
  gem_bfs integer,
  los integer,
  lieferdatum date,
  CONSTRAINT bodenbedeckung_boflaeche_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE av_avdpool_ng.bodenbedeckung_boflaeche OWNER TO stefan;
GRANT ALL ON TABLE av_avdpool_ng.bodenbedeckung_boflaeche TO stefan;
GRANT SELECT ON TABLE av_avdpool_ng.bodenbedeckung_boflaeche TO mspublic;

-- Index: av_avdpool_ng.idx_bodenbedeckung_boflaeche_entstehung

-- DROP INDEX av_avdpool_ng.idx_bodenbedeckung_boflaeche_entstehung;

CREATE INDEX idx_bodenbedeckung_boflaeche_entstehung
  ON av_avdpool_ng.bodenbedeckung_boflaeche
  USING btree
  (entstehung);

-- Index: av_avdpool_ng.idx_bodenbedeckung_boflaeche_gem_bfs

-- DROP INDEX av_avdpool_ng.idx_bodenbedeckung_boflaeche_gem_bfs;

CREATE INDEX idx_bodenbedeckung_boflaeche_gem_bfs
  ON av_avdpool_ng.bodenbedeckung_boflaeche
  USING btree
  (gem_bfs);

-- Index: av_avdpool_ng.idx_bodenbedeckung_boflaeche_geometrie

-- DROP INDEX av_avdpool_ng.idx_bodenbedeckung_boflaeche_geometrie;

CREATE INDEX idx_bodenbedeckung_boflaeche_geometrie
  ON av_avdpool_ng.bodenbedeckung_boflaeche
  USING gist
  (geometrie);

-- Index: av_avdpool_ng.idx_bodenbedeckung_boflaeche_los

-- DROP INDEX av_avdpool_ng.idx_bodenbedeckung_boflaeche_los;

CREATE INDEX idx_bodenbedeckung_boflaeche_los
  ON av_avdpool_ng.bodenbedeckung_boflaeche
  USING btree
  (los);

-- Index: av_avdpool_ng.idx_bodenbedeckung_boflaeche_ogc_fid

-- DROP INDEX av_avdpool_ng.idx_bodenbedeckung_boflaeche_ogc_fid;

CREATE INDEX idx_bodenbedeckung_boflaeche_ogc_fid
  ON av_avdpool_ng.bodenbedeckung_boflaeche
  USING btree
  (ogc_fid);

-- Index: av_avdpool_ng.idx_bodenbedeckung_boflaeche_tid

-- DROP INDEX av_avdpool_ng.idx_bodenbedeckung_boflaeche_tid;

CREATE INDEX idx_bodenbedeckung_boflaeche_tid
  ON av_avdpool_ng.bodenbedeckung_boflaeche
  USING btree
  (tid);
