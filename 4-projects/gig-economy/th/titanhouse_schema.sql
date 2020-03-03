/*
 Navicat Premium Data Transfer

 Source Server         : local-pg
 Source Server Type    : PostgreSQL
 Source Server Version : 110003
 Source Host           : localhost:5432
 Source Catalog        : gig
 Source Schema         : titanhouse_schema

 Target Server Type    : PostgreSQL
 Target Server Version : 110003
 File Encoding         : 65001

 Date: 02/03/2020 23:48:06
*/


-- ----------------------------
-- Sequence structure for Experiences_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_schema"."Experiences_id_seq";
CREATE SEQUENCE "titanhouse_schema"."Experiences_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_schema"."Experiences_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Industries_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_schema"."Industries_id_seq";
CREATE SEQUENCE "titanhouse_schema"."Industries_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_schema"."Industries_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Organizations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_schema"."Organizations_id_seq";
CREATE SEQUENCE "titanhouse_schema"."Organizations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_schema"."Organizations_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Roles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_schema"."Roles_id_seq";
CREATE SEQUENCE "titanhouse_schema"."Roles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_schema"."Roles_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Talents_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_schema"."Talents_id_seq";
CREATE SEQUENCE "titanhouse_schema"."Talents_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_schema"."Talents_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Departments
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Departments";
CREATE TABLE "titanhouse_schema"."Departments" (
  "id" int4 NOT NULL,
  "title" text COLLATE "pg_catalog"."default",
  "parentId" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "_deleted" bool
)
;
ALTER TABLE "titanhouse_schema"."Departments" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Experiences
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Experiences";
CREATE TABLE "titanhouse_schema"."Experiences" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_schema"."Experiences_id_seq"'::regclass),
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "_syncStatus" text COLLATE "pg_catalog"."default" DEFAULT 'created'::character varying,
  "expTitle" text COLLATE "pg_catalog"."default",
  "expType" text COLLATE "pg_catalog"."default",
  "expSize" int4,
  "expRevenue" int4,
  "expOte" int4,
  "expBase" int4,
  "expCurrent" bool,
  "expEnd" timestamptz(6),
  "expStart" timestamptz(6),
  "roleId" int4,
  "organizationId" int4,
  "talentId" int4,
  "expProducts" text[] COLLATE "pg_catalog"."default",
  "expTerritories" text[] COLLATE "pg_catalog"."default",
  "expQuotas" jsonb[],
  "expAwards" jsonb[],
  "otherSkills" jsonb[],
  "references" text[] COLLATE "pg_catalog"."default",
  "_state" text COLLATE "pg_catalog"."default",
  "_versionId" int4,
  "_deleted" bool
)
;
ALTER TABLE "titanhouse_schema"."Experiences" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Experiences_Industries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Experiences_Industries";
CREATE TABLE "titanhouse_schema"."Experiences_Industries" (
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "experienceId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Experiences_Industries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Experiences__Versions
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Experiences__Versions";
CREATE TABLE "titanhouse_schema"."Experiences__Versions" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_schema"."Experiences_id_seq"'::regclass),
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "expTitle" text COLLATE "pg_catalog"."default",
  "expType" text COLLATE "pg_catalog"."default",
  "expSize" int4,
  "expRevenue" int4,
  "expOte" int4,
  "expBase" int4,
  "expCurrent" bool,
  "expEnd" timestamptz(6),
  "expStart" timestamptz(6),
  "roleId" int4,
  "organizationId" int4,
  "expProducts" text[] COLLATE "pg_catalog"."default",
  "expTerritories" text[] COLLATE "pg_catalog"."default",
  "expQuotas" jsonb[],
  "expAwards" jsonb[],
  "otherSkills" jsonb[],
  "references" text[] COLLATE "pg_catalog"."default",
  "_entityId" int4,
  "_previousVersionId" int4,
  "_state" text COLLATE "pg_catalog"."default",
  "talentId" int4
)
;
ALTER TABLE "titanhouse_schema"."Experiences__Versions" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Experiences__Versions_Industries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Experiences__Versions_Industries";
CREATE TABLE "titanhouse_schema"."Experiences__Versions_Industries" (
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "experienceVersionId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Experiences__Versions_Industries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Industries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Industries";
CREATE TABLE "titanhouse_schema"."Industries" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_schema"."Industries_id_seq"'::regclass),
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "_syncStatus" text COLLATE "pg_catalog"."default" DEFAULT 'created'::character varying,
  "name" text COLLATE "pg_catalog"."default",
  "level" int4,
  "_deleted" bool,
  "parentId" int4
)
;
ALTER TABLE "titanhouse_schema"."Industries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Jobs";
CREATE TABLE "titanhouse_schema"."Jobs" (
  "id" int4 NOT NULL,
  "companyId" int4,
  "companyName" text COLLATE "pg_catalog"."default",
  "companyUrl" text COLLATE "pg_catalog"."default",
  "companyLocation" jsonb,
  "companyType" text COLLATE "pg_catalog"."default",
  "companyRevenue" int4,
  "companyRevenueGrowthPercent" int4,
  "companyEmployeeCount" int4,
  "companyEmployeeCountGrowthPercent" int4,
  "companyCulture" text COLLATE "pg_catalog"."default",
  "companyHasMentorship" bool,
  "companyMentorshipDesp" text COLLATE "pg_catalog"."default",
  "companyHasEducationReimbursement" bool,
  "companyHasReimbursementDesp" bool,
  "companyAdmiredCompanies" jsonb[],
  "positionTitle" text COLLATE "pg_catalog"."default",
  "positionRoleId" int4,
  "positionTravelPercent" int4,
  "positionSaleType" text COLLATE "pg_catalog"."default",
  "positionBase" int4,
  "positionOTE" int4,
  "positionQuotaTarget" int4,
  "positionClientType" text[] COLLATE "pg_catalog"."default",
  "positionProductFileUrl" text COLLATE "pg_catalog"."default",
  "positionOverview" text COLLATE "pg_catalog"."default",
  "teamSize" int4,
  "saleTools" text[] COLLATE "pg_catalog"."default",
  "career" text COLLATE "pg_catalog"."default",
  "training" text COLLATE "pg_catalog"."default",
  "teamVideoUrl" text COLLATE "pg_catalog"."default",
  "dealPercent" int4,
  "has401K" bool,
  "contributionDegree" text COLLATE "pg_catalog"."default",
  "hasSharingProfit" bool,
  "sharingDetail" text COLLATE "pg_catalog"."default",
  "isEquity" bool,
  "hasHealthMedical" bool,
  "hasHealthDental" bool,
  "hasHealthVision" bool,
  "additionDocumentUrl" text COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "_syncStatus" text COLLATE "pg_catalog"."default",
  "_state" text COLLATE "pg_catalog"."default",
  "_versionId" int4,
  "saleMethods" text[] COLLATE "pg_catalog"."default",
  "saleModels" text[] COLLATE "pg_catalog"."default",
  "_deleted" bool
)
;
ALTER TABLE "titanhouse_schema"."Jobs" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs_CompanyIndustries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Jobs_CompanyIndustries";
CREATE TABLE "titanhouse_schema"."Jobs_CompanyIndustries" (
  "jobId" int4 NOT NULL,
  "industryId" int4 NOT NULL,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Jobs_CompanyIndustries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs_CompanyMiniTags
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Jobs_CompanyMiniTags";
CREATE TABLE "titanhouse_schema"."Jobs_CompanyMiniTags" (
  "jobId" int4 NOT NULL,
  "miniTagId" int4 NOT NULL,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Jobs_CompanyMiniTags" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs_PositionDepartments
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Jobs_PositionDepartments";
CREATE TABLE "titanhouse_schema"."Jobs_PositionDepartments" (
  "jobId" int4 NOT NULL,
  "departmentId" int4 NOT NULL,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Jobs_PositionDepartments" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs__Versions
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Jobs__Versions";
CREATE TABLE "titanhouse_schema"."Jobs__Versions" (
  "id" int4 NOT NULL,
  "companyId" int4,
  "companyName" text COLLATE "pg_catalog"."default",
  "companyUrl" text COLLATE "pg_catalog"."default",
  "companyLocation" jsonb,
  "companyType" text COLLATE "pg_catalog"."default",
  "companyRevenue" int4,
  "companyRevenueGrowthPercent" int4,
  "companyEmployeeCount" int4,
  "companyEmployeeCountGrowthPercent" int4,
  "companyCulture" text COLLATE "pg_catalog"."default",
  "companyHasMentorship" bool,
  "companyMentorshipDesp" text COLLATE "pg_catalog"."default",
  "companyHasEducationReimbursement" bool,
  "companyHasReimbursementDesp" bool,
  "companyAdmiredCompanies" jsonb[],
  "positionTitle" text COLLATE "pg_catalog"."default",
  "positionRoleId" int4,
  "positionTravelPercent" int4,
  "positionSaleType" text COLLATE "pg_catalog"."default",
  "positionBase" int4,
  "positionOTE" int4,
  "positionQuotaTarget" int4,
  "positionClientType" text[] COLLATE "pg_catalog"."default",
  "positionProductFileUrl" text COLLATE "pg_catalog"."default",
  "positionOverview" text COLLATE "pg_catalog"."default",
  "teamSize" int4,
  "saleTools" text[] COLLATE "pg_catalog"."default",
  "career" text COLLATE "pg_catalog"."default",
  "training" text COLLATE "pg_catalog"."default",
  "teamVideoUrl" text COLLATE "pg_catalog"."default",
  "dealPercent" int4,
  "has401K" bool,
  "contributionDegree" text COLLATE "pg_catalog"."default",
  "hasSharingProfit" bool,
  "sharingDetail" text COLLATE "pg_catalog"."default",
  "isEquity" bool,
  "hasHealthMedical" bool,
  "hasHealthDental" bool,
  "hasHealthVision" bool,
  "additionDocumentUrl" text COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "_state" text COLLATE "pg_catalog"."default",
  "_previousVersionId" int4,
  "saleMethods" text[] COLLATE "pg_catalog"."default",
  "saleModels" text[] COLLATE "pg_catalog"."default",
  "_entityId" int4
)
;
ALTER TABLE "titanhouse_schema"."Jobs__Versions" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs__Versions_CompanyIndustries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Jobs__Versions_CompanyIndustries";
CREATE TABLE "titanhouse_schema"."Jobs__Versions_CompanyIndustries" (
  "jobVersionId" int4 NOT NULL,
  "industryId" int4 NOT NULL,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Jobs__Versions_CompanyIndustries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs__Versions_CompanyMiniTags
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Jobs__Versions_CompanyMiniTags";
CREATE TABLE "titanhouse_schema"."Jobs__Versions_CompanyMiniTags" (
  "jobVersionId" int4 NOT NULL,
  "miniTagId" int4 NOT NULL,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Jobs__Versions_CompanyMiniTags" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs__Versions_PositionDepartments
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Jobs__Versions_PositionDepartments";
CREATE TABLE "titanhouse_schema"."Jobs__Versions_PositionDepartments" (
  "jobVersionId" int4 NOT NULL,
  "departmentId" int4 NOT NULL,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Jobs__Versions_PositionDepartments" OWNER TO "postgres";

-- ----------------------------
-- Table structure for MiniTags
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."MiniTags";
CREATE TABLE "titanhouse_schema"."MiniTags" (
  "id" int4 NOT NULL,
  "title" text COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "_deleted" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "titanhouse_schema"."MiniTags" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Organizations
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Organizations";
CREATE TABLE "titanhouse_schema"."Organizations" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_schema"."Organizations_id_seq"'::regclass),
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "_syncStatus" text COLLATE "pg_catalog"."default" DEFAULT 'created'::character varying,
  "name" text COLLATE "pg_catalog"."default",
  "website" text COLLATE "pg_catalog"."default",
  "stockExchange" text COLLATE "pg_catalog"."default",
  "keyCompetitor" text COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "categories" text[] COLLATE "pg_catalog"."default",
  "organizationType" text COLLATE "pg_catalog"."default",
  "private" bool,
  "untracked" bool,
  "deleted" bool,
  "numberOfEmployees" int4,
  "companyRank" text COLLATE "pg_catalog"."default",
  "tickerSymbol" text COLLATE "pg_catalog"."default",
  "_state" text COLLATE "pg_catalog"."default",
  "_versionId" int4,
  "companyType" text COLLATE "pg_catalog"."default",
  "location" jsonb,
  "revenueHistory" jsonb[],
  "employeeCountHistory" jsonb[],
  "culture" text COLLATE "pg_catalog"."default",
  "hasMentorship" bool,
  "mentorshipDesp" bool,
  "hasEducationReimbursement" bool,
  "reimbursementDesp" bool,
  "admiredCompanies" jsonb[],
  "competitorCompanies" jsonb[],
  "similarCompanies" jsonb[],
  "keywords" text[] COLLATE "pg_catalog"."default",
  "_deleted" bool
)
;
ALTER TABLE "titanhouse_schema"."Organizations" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Organizations_Industries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Organizations_Industries";
CREATE TABLE "titanhouse_schema"."Organizations_Industries" (
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "organizationId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Organizations_Industries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Organizations_MiniTags
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Organizations_MiniTags";
CREATE TABLE "titanhouse_schema"."Organizations_MiniTags" (
  "miniTagId" int4 NOT NULL,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "organizationId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Organizations_MiniTags" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Organizations__Versions
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Organizations__Versions";
CREATE TABLE "titanhouse_schema"."Organizations__Versions" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_schema"."Organizations_id_seq"'::regclass),
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "name" text COLLATE "pg_catalog"."default",
  "website" text COLLATE "pg_catalog"."default",
  "stockExchange" text COLLATE "pg_catalog"."default",
  "keyCompetitor" text COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "categories" text[] COLLATE "pg_catalog"."default",
  "organizationType" text COLLATE "pg_catalog"."default",
  "private" bool,
  "untracked" bool,
  "deleted" bool,
  "numberOfEmployees" int4,
  "companyRank" text COLLATE "pg_catalog"."default",
  "tickerSymbol" text COLLATE "pg_catalog"."default",
  "_entityId" int4,
  "_previousVersionId" int4,
  "_state" text COLLATE "pg_catalog"."default",
  "companyType" text COLLATE "pg_catalog"."default",
  "location" jsonb,
  "revenueHistory" jsonb[],
  "employeeCountHistory" jsonb[],
  "culture" text COLLATE "pg_catalog"."default",
  "hasMentorship" bool,
  "mentorshipDesp" bool,
  "hasEducationReimbursement" bool,
  "reimbursementDesp" bool,
  "admiredCompanies" jsonb[],
  "competitorCompanies" jsonb[],
  "similarCompanies" jsonb[],
  "keywords" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "titanhouse_schema"."Organizations__Versions" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Organizations__Versions_Industries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Organizations__Versions_Industries";
CREATE TABLE "titanhouse_schema"."Organizations__Versions_Industries" (
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "organizationVersionId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Organizations__Versions_Industries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Organizations__Versions_MiniTags
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Organizations__Versions_MiniTags";
CREATE TABLE "titanhouse_schema"."Organizations__Versions_MiniTags" (
  "miniTagId" int4 NOT NULL,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "organizationVersionId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Organizations__Versions_MiniTags" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Roles
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Roles";
CREATE TABLE "titanhouse_schema"."Roles" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_schema"."Roles_id_seq"'::regclass),
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "name" text COLLATE "pg_catalog"."default",
  "level" int4,
  "parentId" int4,
  "_deleted" bool
)
;
ALTER TABLE "titanhouse_schema"."Roles" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Talents";
CREATE TABLE "titanhouse_schema"."Talents" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_schema"."Talents_id_seq"'::regclass),
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "_syncStatus" text COLLATE "pg_catalog"."default" DEFAULT 'created'::character varying,
  "firstName" text COLLATE "pg_catalog"."default",
  "lastName" text COLLATE "pg_catalog"."default",
  "middleName" text COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default",
  "phone" text COLLATE "pg_catalog"."default",
  "location" jsonb,
  "militarySrv" text COLLATE "pg_catalog"."default",
  "militaryBranch" text COLLATE "pg_catalog"."default",
  "bio" text COLLATE "pg_catalog"."default",
  "interestStage" text COLLATE "pg_catalog"."default",
  "interestBase" int4,
  "interestOte" int4,
  "interestRelocation" bool,
  "interestTravel" int4,
  "interestDesp" text COLLATE "pg_catalog"."default",
  "profileImg" text COLLATE "pg_catalog"."default",
  "interestLocs" jsonb[],
  "interestProducts" text[] COLLATE "pg_catalog"."default",
  "interestTargets" text[] COLLATE "pg_catalog"."default",
  "workMethods" text[] COLLATE "pg_catalog"."default",
  "workTools" text[] COLLATE "pg_catalog"."default",
  "_state" text COLLATE "pg_catalog"."default",
  "_versionId" int4,
  "_deleted" bool
)
;
ALTER TABLE "titanhouse_schema"."Talents" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_InterestIndustries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Talents_InterestIndustries";
CREATE TABLE "titanhouse_schema"."Talents_InterestIndustries" (
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "talentId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Talents_InterestIndustries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_InterestRoles
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Talents_InterestRoles";
CREATE TABLE "titanhouse_schema"."Talents_InterestRoles" (
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "roleId" int4 NOT NULL,
  "talentId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Talents_InterestRoles" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_WorkIndustries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Talents_WorkIndustries";
CREATE TABLE "titanhouse_schema"."Talents_WorkIndustries" (
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "talentId" int4 NOT NULL,
  "industryId" int4 NOT NULL,
  "years" int4
)
;
ALTER TABLE "titanhouse_schema"."Talents_WorkIndustries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_WorkRoles
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Talents_WorkRoles";
CREATE TABLE "titanhouse_schema"."Talents_WorkRoles" (
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "talentId" int4 NOT NULL,
  "roleId" int4 NOT NULL,
  "years" int4
)
;
ALTER TABLE "titanhouse_schema"."Talents_WorkRoles" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Talents__Versions";
CREATE TABLE "titanhouse_schema"."Talents__Versions" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_schema"."Talents_id_seq"'::regclass),
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "firstName" text COLLATE "pg_catalog"."default",
  "lastName" text COLLATE "pg_catalog"."default",
  "middleName" text COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default",
  "phone" text COLLATE "pg_catalog"."default",
  "location" jsonb,
  "militarySrv" text COLLATE "pg_catalog"."default",
  "militaryBranch" text COLLATE "pg_catalog"."default",
  "bio" text COLLATE "pg_catalog"."default",
  "interestStage" text COLLATE "pg_catalog"."default",
  "interestBase" int4,
  "interestOte" int4,
  "interestRelocation" bool,
  "interestTravel" int4,
  "interestDesp" text COLLATE "pg_catalog"."default",
  "profileImg" text COLLATE "pg_catalog"."default",
  "interestLocs" jsonb[],
  "interestProducts" text[] COLLATE "pg_catalog"."default",
  "interestTargets" text[] COLLATE "pg_catalog"."default",
  "workMethods" text[] COLLATE "pg_catalog"."default",
  "workTools" text[] COLLATE "pg_catalog"."default",
  "_entityId" int4,
  "_state" text COLLATE "pg_catalog"."default",
  "_previousVersionId" int4
)
;
ALTER TABLE "titanhouse_schema"."Talents__Versions" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_Experiences__Versions
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Talents__Versions_Experiences__Versions";
CREATE TABLE "titanhouse_schema"."Talents__Versions_Experiences__Versions" (
  "talentVersionId" int4 NOT NULL,
  "experienceVersionId" int4 NOT NULL,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Talents__Versions_Experiences__Versions" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_InterestIndustries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Talents__Versions_InterestIndustries";
CREATE TABLE "titanhouse_schema"."Talents__Versions_InterestIndustries" (
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "talentVersionId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Talents__Versions_InterestIndustries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_InterestRoles
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Talents__Versions_InterestRoles";
CREATE TABLE "titanhouse_schema"."Talents__Versions_InterestRoles" (
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "roleId" int4 NOT NULL,
  "talentVersionId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_schema"."Talents__Versions_InterestRoles" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_WorkIndustries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Talents__Versions_WorkIndustries";
CREATE TABLE "titanhouse_schema"."Talents__Versions_WorkIndustries" (
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "talentVersionId" int4 NOT NULL,
  "industryId" int4 NOT NULL,
  "years" int4
)
;
ALTER TABLE "titanhouse_schema"."Talents__Versions_WorkIndustries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_WorkRoles
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_schema"."Talents__Versions_WorkRoles";
CREATE TABLE "titanhouse_schema"."Talents__Versions_WorkRoles" (
  "createdAt" timestamptz(6) NOT NULL DEFAULT now(),
  "updatedAt" timestamptz(6) NOT NULL DEFAULT now(),
  "talentVersionId" int4 NOT NULL,
  "roleId" int4 NOT NULL,
  "years" int4
)
;
ALTER TABLE "titanhouse_schema"."Talents__Versions_WorkRoles" OWNER TO "postgres";

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "titanhouse_schema"."Experiences_id_seq"
OWNED BY "titanhouse_schema"."Experiences"."id";
SELECT setval('"titanhouse_schema"."Experiences_id_seq"', 3, false);
ALTER SEQUENCE "titanhouse_schema"."Industries_id_seq"
OWNED BY "titanhouse_schema"."Industries"."id";
SELECT setval('"titanhouse_schema"."Industries_id_seq"', 3, false);
ALTER SEQUENCE "titanhouse_schema"."Organizations_id_seq"
OWNED BY "titanhouse_schema"."Organizations"."id";
SELECT setval('"titanhouse_schema"."Organizations_id_seq"', 3, false);
ALTER SEQUENCE "titanhouse_schema"."Roles_id_seq"
OWNED BY "titanhouse_schema"."Roles"."id";
SELECT setval('"titanhouse_schema"."Roles_id_seq"', 3, false);
ALTER SEQUENCE "titanhouse_schema"."Talents_id_seq"
OWNED BY "titanhouse_schema"."Talents"."id";
SELECT setval('"titanhouse_schema"."Talents_id_seq"', 3, false);

-- ----------------------------
-- Primary Key structure for table Departments
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Departments" ADD CONSTRAINT "Departments_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Experiences
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Experiences" ADD CONSTRAINT "Experiences_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Experiences_Industries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Experiences_Industries" ADD CONSTRAINT "Experiences_Industries_pkey" PRIMARY KEY ("experienceId", "industryId");

-- ----------------------------
-- Primary Key structure for table Experiences__Versions
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Experiences__Versions" ADD CONSTRAINT "Experiences_copy1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Experiences__Versions_Industries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Experiences__Versions_Industries" ADD CONSTRAINT "Experiences_Industries_copy1_pkey" PRIMARY KEY ("experienceVersionId", "industryId");

-- ----------------------------
-- Primary Key structure for table Industries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Industries" ADD CONSTRAINT "Industries_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Jobs
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs" ADD CONSTRAINT "Jobs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Jobs_CompanyIndustries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs_CompanyIndustries" ADD CONSTRAINT "Jobs_CompanyIndustries_pkey" PRIMARY KEY ("jobId", "industryId");

-- ----------------------------
-- Primary Key structure for table Jobs_CompanyMiniTags
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs_CompanyMiniTags" ADD CONSTRAINT "Jobs_CompanyMiniTags_pkey" PRIMARY KEY ("jobId", "miniTagId");

-- ----------------------------
-- Primary Key structure for table Jobs_PositionDepartments
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs_PositionDepartments" ADD CONSTRAINT "Jobs_PositionDepartments_pkey" PRIMARY KEY ("jobId", "departmentId");

-- ----------------------------
-- Primary Key structure for table Jobs__Versions
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs__Versions" ADD CONSTRAINT "Jobs_copy1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Jobs__Versions_CompanyIndustries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs__Versions_CompanyIndustries" ADD CONSTRAINT "Jobs_CompanyIndustries_copy1_pkey" PRIMARY KEY ("jobVersionId", "industryId");

-- ----------------------------
-- Primary Key structure for table Jobs__Versions_CompanyMiniTags
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs__Versions_CompanyMiniTags" ADD CONSTRAINT "Jobs_CompanyMiniTags_copy1_pkey" PRIMARY KEY ("jobVersionId", "miniTagId");

-- ----------------------------
-- Primary Key structure for table Jobs__Versions_PositionDepartments
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs__Versions_PositionDepartments" ADD CONSTRAINT "Jobs_PositionDepartments_copy1_pkey" PRIMARY KEY ("jobVersionId", "departmentId");

-- ----------------------------
-- Primary Key structure for table MiniTags
-- ----------------------------
ALTER TABLE "titanhouse_schema"."MiniTags" ADD CONSTRAINT "MiniTags_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Organizations
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Organizations" ADD CONSTRAINT "Organizations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Organizations_Industries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Organizations_Industries" ADD CONSTRAINT "Organizations_Industries_pkey" PRIMARY KEY ("organizationId", "industryId");

-- ----------------------------
-- Primary Key structure for table Organizations_MiniTags
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Organizations_MiniTags" ADD CONSTRAINT "Organizations_MiniTags_pkey" PRIMARY KEY ("miniTagId", "organizationId");

-- ----------------------------
-- Primary Key structure for table Organizations__Versions
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Organizations__Versions" ADD CONSTRAINT "Organizations_copy1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Organizations__Versions_Industries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Organizations__Versions_Industries" ADD CONSTRAINT "Organizations_Industries_copy1_pkey" PRIMARY KEY ("organizationVersionId", "industryId");

-- ----------------------------
-- Primary Key structure for table Organizations__Versions_MiniTags
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Organizations__Versions_MiniTags" ADD CONSTRAINT "Organizations_MiniTags_copy1_pkey" PRIMARY KEY ("miniTagId", "organizationVersionId");

-- ----------------------------
-- Primary Key structure for table Roles
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Roles" ADD CONSTRAINT "Roles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Talents
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents" ADD CONSTRAINT "Talents_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Talents_InterestIndustries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents_InterestIndustries" ADD CONSTRAINT "Talents_Interest_Industries_pkey" PRIMARY KEY ("talentId", "industryId");

-- ----------------------------
-- Primary Key structure for table Talents_InterestRoles
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents_InterestRoles" ADD CONSTRAINT "Talents_Interest_Roles_pkey" PRIMARY KEY ("roleId", "talentId");

-- ----------------------------
-- Primary Key structure for table Talents_WorkIndustries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents_WorkIndustries" ADD CONSTRAINT "Talents_Work_Industries_pkey" PRIMARY KEY ("talentId", "industryId");

-- ----------------------------
-- Primary Key structure for table Talents_WorkRoles
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents_WorkRoles" ADD CONSTRAINT "Talents_Work_Roles_pkey" PRIMARY KEY ("talentId", "roleId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents__Versions" ADD CONSTRAINT "Talents_copy1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_Experiences__Versions
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents__Versions_Experiences__Versions" ADD CONSTRAINT "Talents_Experiences__Versions_pkey" PRIMARY KEY ("talentVersionId", "experienceVersionId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_InterestIndustries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents__Versions_InterestIndustries" ADD CONSTRAINT "Talents_Interest_Industries_copy1_pkey" PRIMARY KEY ("talentVersionId", "industryId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_InterestRoles
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents__Versions_InterestRoles" ADD CONSTRAINT "Talents_Interest_Roles_copy1_pkey" PRIMARY KEY ("roleId", "talentVersionId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_WorkIndustries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents__Versions_WorkIndustries" ADD CONSTRAINT "Talents_Work_Industries_copy1_pkey" PRIMARY KEY ("talentVersionId", "industryId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_WorkRoles
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents__Versions_WorkRoles" ADD CONSTRAINT "Talents_Work_Roles_copy1_pkey" PRIMARY KEY ("talentVersionId", "roleId");

-- ----------------------------
-- Foreign Keys structure for table Departments
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Departments" ADD CONSTRAINT "Departments_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "titanhouse_schema"."Departments" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Experiences
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Experiences" ADD CONSTRAINT "Experiences__versionId_fkey" FOREIGN KEY ("_versionId") REFERENCES "titanhouse_schema"."Experiences__Versions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Experiences" ADD CONSTRAINT "Experiences_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "titanhouse_schema"."Organizations" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Experiences" ADD CONSTRAINT "Experiences_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "titanhouse_schema"."Roles" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Experiences" ADD CONSTRAINT "Experiences_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_schema"."Talents" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Experiences_Industries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Experiences_Industries" ADD CONSTRAINT "Experiences_Industries_experienceId_fkey" FOREIGN KEY ("experienceId") REFERENCES "titanhouse_schema"."Experiences" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Experiences_Industries" ADD CONSTRAINT "Experiences_Industries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_schema"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Experiences__Versions
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions__entityId_fkey" FOREIGN KEY ("_entityId") REFERENCES "titanhouse_schema"."Experiences" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions__previousVersionId_fkey" FOREIGN KEY ("_previousVersionId") REFERENCES "titanhouse_schema"."Experiences__Versions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "titanhouse_schema"."Organizations" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "titanhouse_schema"."Roles" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_schema"."Talents" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Experiences__Versions_Industries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Experiences__Versions_Industries" ADD CONSTRAINT "Experiences__Versions_Industries_experienceVersionId_fkey" FOREIGN KEY ("experienceVersionId") REFERENCES "titanhouse_schema"."Experiences__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Experiences__Versions_Industries" ADD CONSTRAINT "Experiences__Versions_Industries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_schema"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Industries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Industries" ADD CONSTRAINT "Industries_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "titanhouse_schema"."Industries" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs" ADD CONSTRAINT "Jobs__versionId_fkey" FOREIGN KEY ("_versionId") REFERENCES "titanhouse_schema"."Jobs__Versions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Jobs" ADD CONSTRAINT "Jobs_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "titanhouse_schema"."Organizations" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Jobs" ADD CONSTRAINT "Jobs_positionRoleId_fkey" FOREIGN KEY ("positionRoleId") REFERENCES "titanhouse_schema"."Roles" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs_CompanyIndustries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs_CompanyIndustries" ADD CONSTRAINT "Jobs_CompanyIndustries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_schema"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Jobs_CompanyIndustries" ADD CONSTRAINT "Jobs_CompanyIndustries_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "titanhouse_schema"."Jobs" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs_CompanyMiniTags
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs_CompanyMiniTags" ADD CONSTRAINT "Jobs_CompanyMiniTags_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "titanhouse_schema"."Jobs" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Jobs_CompanyMiniTags" ADD CONSTRAINT "Jobs_CompanyMiniTags_miniTagId_fkey" FOREIGN KEY ("miniTagId") REFERENCES "titanhouse_schema"."MiniTags" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs_PositionDepartments
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs_PositionDepartments" ADD CONSTRAINT "Jobs_PositionDepartments_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "titanhouse_schema"."Departments" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Jobs_PositionDepartments" ADD CONSTRAINT "Jobs_PositionDepartments_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "titanhouse_schema"."Jobs" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs__Versions
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs__Versions" ADD CONSTRAINT "Jobs__Versions__entityId_fkey" FOREIGN KEY ("_entityId") REFERENCES "titanhouse_schema"."Jobs" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Jobs__Versions" ADD CONSTRAINT "Jobs__Versions__previousVersionId_fkey" FOREIGN KEY ("_previousVersionId") REFERENCES "titanhouse_schema"."Jobs__Versions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Jobs__Versions" ADD CONSTRAINT "Jobs__Versions_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "titanhouse_schema"."Organizations" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Jobs__Versions" ADD CONSTRAINT "Jobs__Versions_positionRoleId_fkey" FOREIGN KEY ("positionRoleId") REFERENCES "titanhouse_schema"."Roles" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs__Versions_CompanyIndustries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs__Versions_CompanyIndustries" ADD CONSTRAINT "Jobs__Versions_CompanyIndustries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_schema"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Jobs__Versions_CompanyIndustries" ADD CONSTRAINT "Jobs__Versions_CompanyIndustries_jobVersionId_fkey" FOREIGN KEY ("jobVersionId") REFERENCES "titanhouse_schema"."Jobs__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs__Versions_CompanyMiniTags
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs__Versions_CompanyMiniTags" ADD CONSTRAINT "Jobs__Versions_CompanyMiniTags_jobVersionId_fkey" FOREIGN KEY ("jobVersionId") REFERENCES "titanhouse_schema"."Jobs__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Jobs__Versions_CompanyMiniTags" ADD CONSTRAINT "Jobs__Versions_CompanyMiniTags_miniTagId_fkey" FOREIGN KEY ("miniTagId") REFERENCES "titanhouse_schema"."MiniTags" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs__Versions_PositionDepartments
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Jobs__Versions_PositionDepartments" ADD CONSTRAINT "Jobs__Versions_PositionDepartments_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "titanhouse_schema"."Departments" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Jobs__Versions_PositionDepartments" ADD CONSTRAINT "Jobs__Versions_PositionDepartments_jobVersionId_fkey" FOREIGN KEY ("jobVersionId") REFERENCES "titanhouse_schema"."Jobs__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Organizations
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Organizations" ADD CONSTRAINT "Organizations__versionId_fkey" FOREIGN KEY ("_versionId") REFERENCES "titanhouse_schema"."Organizations__Versions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Organizations_Industries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Organizations_Industries" ADD CONSTRAINT "Organizations_Industries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_schema"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Organizations_Industries" ADD CONSTRAINT "Organizations_Industries_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "titanhouse_schema"."Organizations" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Organizations_MiniTags
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Organizations_MiniTags" ADD CONSTRAINT "Organizations_MiniTags_miniTagId_fkey" FOREIGN KEY ("miniTagId") REFERENCES "titanhouse_schema"."MiniTags" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Organizations_MiniTags" ADD CONSTRAINT "Organizations_MiniTags_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "titanhouse_schema"."Organizations" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Organizations__Versions
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Organizations__Versions" ADD CONSTRAINT "Organizations__Versions__entityId_fkey" FOREIGN KEY ("_entityId") REFERENCES "titanhouse_schema"."Organizations" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Organizations__Versions" ADD CONSTRAINT "Organizations__Versions__previousVersionId_fkey" FOREIGN KEY ("_previousVersionId") REFERENCES "titanhouse_schema"."Organizations__Versions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Organizations__Versions_Industries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Organizations__Versions_Industries" ADD CONSTRAINT "Organizations__Versions_Industries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_schema"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Organizations__Versions_Industries" ADD CONSTRAINT "Organizations__Versions_Industries_organizationVerionId_fkey" FOREIGN KEY ("organizationVersionId") REFERENCES "titanhouse_schema"."Organizations__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Organizations__Versions_MiniTags
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Organizations__Versions_MiniTags" ADD CONSTRAINT "Organizations__Versions_MiniTags_miniTagId_fkey" FOREIGN KEY ("miniTagId") REFERENCES "titanhouse_schema"."MiniTags" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Organizations__Versions_MiniTags" ADD CONSTRAINT "Organizations__Versions_MiniTags_organizationVersionId_fkey" FOREIGN KEY ("organizationVersionId") REFERENCES "titanhouse_schema"."Organizations__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Roles
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Roles" ADD CONSTRAINT "Roles_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "titanhouse_schema"."Roles" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents" ADD CONSTRAINT "Talents__versionId_fkey" FOREIGN KEY ("_versionId") REFERENCES "titanhouse_schema"."Talents__Versions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_InterestIndustries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents_InterestIndustries" ADD CONSTRAINT "Talents_InterestIndustries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_schema"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Talents_InterestIndustries" ADD CONSTRAINT "Talents_InterestIndustries_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_schema"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_InterestRoles
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents_InterestRoles" ADD CONSTRAINT "Talents_InterestRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "titanhouse_schema"."Roles" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Talents_InterestRoles" ADD CONSTRAINT "Talents_InterestRoles_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_schema"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_WorkIndustries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents_WorkIndustries" ADD CONSTRAINT "Talents_WorkIndustries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_schema"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Talents_WorkIndustries" ADD CONSTRAINT "Talents_WorkIndustries_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_schema"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_WorkRoles
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents_WorkRoles" ADD CONSTRAINT "Talents_WorkRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "titanhouse_schema"."Roles" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Talents_WorkRoles" ADD CONSTRAINT "Talents_WorkRoles_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_schema"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents__Versions" ADD CONSTRAINT "Talents__Versions__entityId_fkey" FOREIGN KEY ("_entityId") REFERENCES "titanhouse_schema"."Talents" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Talents__Versions" ADD CONSTRAINT "Talents__Versions__previousVersionId_fkey" FOREIGN KEY ("_previousVersionId") REFERENCES "titanhouse_schema"."Talents__Versions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_Experiences__Versions
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents__Versions_Experiences__Versions" ADD CONSTRAINT "Talents__Versions_Experiences__Versions_experienceVersionId_fke" FOREIGN KEY ("experienceVersionId") REFERENCES "titanhouse_schema"."Experiences__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Talents__Versions_Experiences__Versions" ADD CONSTRAINT "Talents__Versions_Experiences__Versions_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_schema"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_InterestIndustries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents__Versions_InterestIndustries" ADD CONSTRAINT "Talents__Versions_InterestIndustries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_schema"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Talents__Versions_InterestIndustries" ADD CONSTRAINT "Talents__Versions_InterestIndustries_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_schema"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_InterestRoles
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents__Versions_InterestRoles" ADD CONSTRAINT "Talents__Versions_InterestRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "titanhouse_schema"."Roles" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Talents__Versions_InterestRoles" ADD CONSTRAINT "Talents__Versions_InterestRoles_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_schema"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_WorkIndustries
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents__Versions_WorkIndustries" ADD CONSTRAINT "Talents__Versions_WorkIndustries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_schema"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Talents__Versions_WorkIndustries" ADD CONSTRAINT "Talents__Versions_WorkIndustries_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_schema"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_WorkRoles
-- ----------------------------
ALTER TABLE "titanhouse_schema"."Talents__Versions_WorkRoles" ADD CONSTRAINT "Talents__Versions_WorkRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "titanhouse_schema"."Roles" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_schema"."Talents__Versions_WorkRoles" ADD CONSTRAINT "Talents__Versions_WorkRoles_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_schema"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
