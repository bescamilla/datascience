#### PostgreSQL
library(RPostgreSQL)
conps <- dbConnect(
  RPostgreSQL::PostgreSQL(),
  dbname = "pfmegrnargs",
  host = "hh-pgsql-public.ebi.ac.uk",
  port = 5432,
  user = "reader",
  password = "NWDMCE5xdipIjRrp"
)
dbExistsTable(conps, "rnc_rna_precomputed")
df_postgres <- dbGetQuery(conps, "SELECT
  upi,     -- RNAcentral URS identifier
  taxid,   -- NCBI taxid
  ac       -- external accession
FROM xref
WHERE ac IN ('OTTHUMT00000106564.1', 'OTTHUMT00000416802.1')")
df_mysql <- dbGetQuery(con, "SELECT
                       tweat_id, user_id, message
                       FROM comments
                       WHERE tweat_id = 77 AND user_id = 1")
df2 = dbGetQuery(con, "SELECT
                 precomputed.id
                 FROM rnc_rna_precomputed precomputed
                 JOIN rnc_taxonomy tax
                 ON
                 tax.id = precomputed.taxid
                 WHERE
                 tax.lineage LIKE 'cellular organisms; Bacteria; %'
                 AND precomputed.is_active = true    -- exclude sequences without active cross-references
                 AND rna_type = 'rRNA'")