CREATE TABLE "public"."Organizations" (
"id" int4 NOT NULL DEFAULT nextval('"Organizations_id_seq"'::regclass),
"changedOn" timestamptz(6),
"name" varchar(255) COLLATE "default",
"website" varchar(512) COLLATE "default",
"private" bool,
"stockExchange" varchar(255) COLLATE "default",
"tickerSymbol" varchar(255) COLLATE "default",
"numberOfEmployees" int4,
"keyCompetitor" varchar(255) COLLATE "default",
"companyRank" int4,
"untracked" bool,
"description" text COLLATE "default",
"changedBy" int4,
"OrganizationTypeId" int4,
"migrationId" varchar(255) COLLATE "default",
"migrationDate" timestamptz(6),
"deleted" bool DEFAULT false,
"updateDate" timestamptz(6),
"systemUpdateDate" timestamptz(6),
"categories" varchar(255)[] COLLATE "default",
CONSTRAINT "Organizations_pkey" PRIMARY KEY ("id") ,
CONSTRAINT "Organizations_OrganizationTypeId_fkey" FOREIGN KEY ("OrganizationTypeId") REFERENCES "public"."OrganizationTypes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT "Organizations_changedBy_fkey" FOREIGN KEY ("changedBy") REFERENCES "public"."Users" ("id") ON DELETE SET NULL ON UPDATE CASCADE
)
WITHOUT OIDS;
CREATE UNIQUE INDEX "IDX_Organizations_MigrationId" ON "public"."Organizations" USING btree ();
ALTER TABLE "public"."Organizations" OWNER TO "th_master";