CREATE TABLE “public”.“OrganizationTypes” (
“id” int4 NOT NULL DEFAULT nextval(‘“OrganizationTypes_id_seq”’::regclass),
“name” varchar(255) COLLATE “default” NOT NULL,
CONSTRAINT “OrganizationTypes_pkey” PRIMARY KEY (“id”)
)
WITHOUT OIDS;
ALTER TABLE “public”.“OrganizationTypes” OWNER TO “th_master”;