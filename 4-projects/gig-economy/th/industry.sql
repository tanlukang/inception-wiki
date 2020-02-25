CREATE TABLE "public"."Industries" (
"id" int4 NOT NULL DEFAULT nextval('"Industries_id_seq"'::regclass),
"name" varchar(255) COLLATE "default",
"level" "public"."enum_Industries_level",
"ParentId" int4,
"migrationId" int4,
"deleted" bool DEFAULT false,
CONSTRAINT "Industries_pkey" PRIMARY KEY ("id") ,
CONSTRAINT "Industries_ParentId_fkey" FOREIGN KEY ("ParentId") REFERENCES "public"."Industries" ("id") ON DELETE SET NULL ON UPDATE CASCADE
)
WITHOUT OIDS;
ALTER TABLE "public"."Industries" OWNER TO "th_master";