SELECT av.*, ST_Area(geometrie) as ls_flaeche
FROM av_avdpool_ng.liegenschaften_grundstueck av
 LEFT JOIN av_avdpool_ng.liegenschaften_liegenschaft av_li ON av_li.liegenschaft_von = av.tid
WHERE av.art = 0 AND replace(replace(av.nummer, '/','.'), ' LRO','')::numeric >= 90000
AND av.gem_bfs = 2549;


SELECT av.gem_bfs, av.nummer, av.nbident, av.gem_bfs
FROM av_avdpool_ng.liegenschaften_grundstueck av
 LEFT JOIN av_avdpool_ng.liegenschaften_liegenschaft av_li ON av_li.liegenschaft_von = av.tid
WHERE av.art = 0 AND replace(replace(av.nummer, '/','.'), ' LRO','')::numeric >= 90000
AND av.gem_bfs = 2549;


SELECT a.art, a.art_txt, sum(ST_Area(b.geometrie)) as flaeche, round(sum(ST_Area(b.geometrie))::numeric,0) as flaeche_ger
FROM
av_avdpool_ng.bodenbedeckung_boflaeche as a,
(
 SELECT 1 as ogc_fid, ST_PointOnSurface(a.geom) as point, a.geom as geometrie
 FROM
 (
  SELECT 1 as ogc_fid, (ST_Dump(ST_Intersection(a.geometrie, b.geometrie))).geom
  FROM 
  av_avdpool_ng.bodenbedeckung_boflaeche as a,
  (
   SELECT c.*, b.nummer, b.egris_egrid, b.nbident 
   FROM av_avdpool_ng.liegenschaften_grundstueck as b, av_avdpool_ng.liegenschaften_liegenschaft as c
   WHERE c.liegenschaft_von = b.tid
  ) as b
  WHERE a.gem_bfs = b.gem_bfs
  AND ST_Intersects(b.geometrie, a.geometrie)
  AND b.gem_bfs = ?
  AND b.nummer = ?
  AND b.nbident = ?
 ) as a
 WHERE geometrytype(a.geom) = 'POLYGON' AND ST_isValid(a.geom)
) as b
WHERE a.gem_bfs = ?
AND a.geometrie && b.geometrie
AND ST_Distance(a.geometrie, b.point) = 0
GROUP BY art, art_txt
ORDER BY art;
