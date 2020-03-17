/*
 Navicat Premium Data Transfer

 Source Server         : local-pg
 Source Server Type    : PostgreSQL
 Source Server Version : 110003
 Source Host           : localhost:5432
 Source Catalog        : gig
 Source Schema         : titanhouse_gig_versioning

 Target Server Type    : PostgreSQL
 Target Server Version : 110003
 File Encoding         : 65001

 Date: 06/03/2020 12:29:46
*/


-- ----------------------------
-- Sequence structure for Experiences__Versions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_gig_versioning"."Experiences__Versions_id_seq";
CREATE SEQUENCE "titanhouse_gig_versioning"."Experiences__Versions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_gig_versioning"."Experiences__Versions_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Experiences_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_gig_versioning"."Experiences_id_seq";
CREATE SEQUENCE "titanhouse_gig_versioning"."Experiences_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_gig_versioning"."Experiences_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Industries_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_gig_versioning"."Industries_id_seq";
CREATE SEQUENCE "titanhouse_gig_versioning"."Industries_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_gig_versioning"."Industries_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Jobs__Versions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_gig_versioning"."Jobs__Versions_id_seq";
CREATE SEQUENCE "titanhouse_gig_versioning"."Jobs__Versions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_gig_versioning"."Jobs__Versions_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Jobs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_gig_versioning"."Jobs_id_seq";
CREATE SEQUENCE "titanhouse_gig_versioning"."Jobs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_gig_versioning"."Jobs_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Organizations__Versions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_gig_versioning"."Organizations__Versions_id_seq";
CREATE SEQUENCE "titanhouse_gig_versioning"."Organizations__Versions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_gig_versioning"."Organizations__Versions_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Organizations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_gig_versioning"."Organizations_id_seq";
CREATE SEQUENCE "titanhouse_gig_versioning"."Organizations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_gig_versioning"."Organizations_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Talents__Versions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_gig_versioning"."Talents__Versions_id_seq";
CREATE SEQUENCE "titanhouse_gig_versioning"."Talents__Versions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_gig_versioning"."Talents__Versions_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Talents_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_gig_versioning"."Talents_id_seq";
CREATE SEQUENCE "titanhouse_gig_versioning"."Talents_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_gig_versioning"."Talents_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for Values_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "titanhouse_gig_versioning"."Values_id_seq";
CREATE SEQUENCE "titanhouse_gig_versioning"."Values_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "titanhouse_gig_versioning"."Values_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Experiences
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Experiences";
CREATE TABLE "titanhouse_gig_versioning"."Experiences" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_gig_versioning"."Experiences_id_seq"'::regclass),
  "expCurrent" bool,
  "expTitle" text COLLATE "pg_catalog"."default",
  "expStart" timestamptz(6),
  "expEnd" timestamptz(6),
  "expBase" int4,
  "expOte" int4,
  "expProducts" text[] COLLATE "pg_catalog"."default",
  "expTerritories" text[] COLLATE "pg_catalog"."default",
  "expRevenue" int4,
  "expSize" int4,
  "expQuotas" jsonb[],
  "expAwards" jsonb[],
  "otherSkills" text[] COLLATE "pg_catalog"."default",
  "references" jsonb[],
  "_state" text COLLATE "pg_catalog"."default",
  "_deleted" bool,
  "_syncStatus" text COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "_versionId" int4,
  "expTypeId" int4,
  "talentId" int4,
  "organizationId" int4,
  "roleId" int4,
  "expSalesTypeId" int4
)
;
ALTER TABLE "titanhouse_gig_versioning"."Experiences" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Experiences_Industries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Experiences_Industries";
CREATE TABLE "titanhouse_gig_versioning"."Experiences_Industries" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "experienceId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Experiences_Industries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Experiences__Versions
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Experiences__Versions";
CREATE TABLE "titanhouse_gig_versioning"."Experiences__Versions" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_gig_versioning"."Experiences__Versions_id_seq"'::regclass),
  "expCurrent" bool,
  "expTitle" text COLLATE "pg_catalog"."default",
  "expStart" timestamptz(6),
  "expEnd" timestamptz(6),
  "expBase" int4,
  "expOte" int4,
  "expProducts" text[] COLLATE "pg_catalog"."default",
  "expTerritories" text[] COLLATE "pg_catalog"."default",
  "expRevenue" int4,
  "expSize" int4,
  "expQuotas" jsonb[],
  "expAwards" jsonb[],
  "otherSkills" text[] COLLATE "pg_catalog"."default",
  "references" jsonb[],
  "_state" text COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "_entityId" int4,
  "_previousVersionId" int4,
  "expTypeId" int4,
  "talentId" int4,
  "organizationId" int4,
  "roleId" int4,
  "expSalesTypeId" int4
)
;
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Experiences__Versions_Industries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Experiences__Versions_Industries";
CREATE TABLE "titanhouse_gig_versioning"."Experiences__Versions_Industries" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "experienceVersionId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions_Industries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Industries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Industries";
CREATE TABLE "titanhouse_gig_versioning"."Industries" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_gig_versioning"."Industries_id_seq"'::regclass),
  "name" text COLLATE "pg_catalog"."default",
  "order" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "parentId" int4
)
;
ALTER TABLE "titanhouse_gig_versioning"."Industries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Jobs";
CREATE TABLE "titanhouse_gig_versioning"."Jobs" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_gig_versioning"."Jobs_id_seq"'::regclass),
  "companyName" text COLLATE "pg_catalog"."default",
  "companyUrl" text COLLATE "pg_catalog"."default",
  "companyLocation" jsonb,
  "companyRevenue" int4,
  "companyRevenueGrowthPercent" int4,
  "companyEmployeeCount" int4,
  "companyEmployeeCountGrowthPercent" int4,
  "companyDescription" text COLLATE "pg_catalog"."default",
  "companyCulture" text COLLATE "pg_catalog"."default",
  "companyHasMentorship" bool,
  "companyMentorshipDesc" text COLLATE "pg_catalog"."default",
  "companyHasEducationReimbursement" bool,
  "companyHasReimbursementDesc" bool,
  "companyAdmiredCompanies" jsonb[],
  "startDate" time(6),
  "positionTitle" text COLLATE "pg_catalog"."default",
  "positionTravelPercent" int4,
  "productSoldTypes" text[] COLLATE "pg_catalog"."default",
  "positionBaseMin" int4,
  "positionBaseMax" int4,
  "positionOTEMin" int4,
  "positionOTEMax" int4,
  "positionQuotaTargetMin" int4,
  "positionQuotaTargetMax" int4,
  "positionProductFileUrl" text COLLATE "pg_catalog"."default",
  "positionSalesCycleMin" int4,
  "positionSalesCycleMax" int4,
  "fieldInside" text COLLATE "pg_catalog"."default",
  "positionOverview" text COLLATE "pg_catalog"."default",
  "dealPercent" int4,
  "teamReportingTo" text COLLATE "pg_catalog"."default",
  "teamLinkedin" text COLLATE "pg_catalog"."default",
  "teamSize" int4,
  "teamSizeMin" int4,
  "teamSizeMax" int4,
  "saleTools" text[] COLLATE "pg_catalog"."default",
  "saleModels" text[] COLLATE "pg_catalog"."default",
  "saleMethods" text[] COLLATE "pg_catalog"."default",
  "career" text COLLATE "pg_catalog"."default",
  "training" text COLLATE "pg_catalog"."default",
  "isBDRSDRSupport" bool,
  "newSalesHireLastYear" int4,
  "teamVideoUrl" text COLLATE "pg_catalog"."default",
  "has401K" bool,
  "contributionDegree" text COLLATE "pg_catalog"."default",
  "hasSharingProfit" bool,
  "sharingDetail" text COLLATE "pg_catalog"."default",
  "isEquity" bool,
  "hasHealthMedical" bool,
  "hasHealthDental" bool,
  "hasHealthVision" bool,
  "otherBenefits" text COLLATE "pg_catalog"."default",
  "additionDocumentUrl" text COLLATE "pg_catalog"."default",
  "awards" text[] COLLATE "pg_catalog"."default",
  "_state" text COLLATE "pg_catalog"."default",
  "_deleted" bool,
  "_syncStatus" text COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "_versionId" int4,
  "orgId" int4,
  "companyTypeId" int4,
  "positionRoleTypeId" int4,
  "positionSalesTypeId" int4,
  "positionRoleId" int4
)
;
ALTER TABLE "titanhouse_gig_versioning"."Jobs" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs_CompanyIndustries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Jobs_CompanyIndustries";
CREATE TABLE "titanhouse_gig_versioning"."Jobs_CompanyIndustries" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "jobId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Jobs_CompanyIndustries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs_CompanyMiniTags
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Jobs_CompanyMiniTags";
CREATE TABLE "titanhouse_gig_versioning"."Jobs_CompanyMiniTags" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "jobId" int4 NOT NULL,
  "miniTagId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Jobs_CompanyMiniTags" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs_PositionClientTypes
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Jobs_PositionClientTypes";
CREATE TABLE "titanhouse_gig_versioning"."Jobs_PositionClientTypes" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "jobId" int4 NOT NULL,
  "clientTypeId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Jobs_PositionClientTypes" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs_PositionDepartments
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Jobs_PositionDepartments";
CREATE TABLE "titanhouse_gig_versioning"."Jobs_PositionDepartments" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "jobId" int4 NOT NULL,
  "departmentId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Jobs_PositionDepartments" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs__Versions
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Jobs__Versions";
CREATE TABLE "titanhouse_gig_versioning"."Jobs__Versions" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_gig_versioning"."Jobs__Versions_id_seq"'::regclass),
  "companyName" text COLLATE "pg_catalog"."default",
  "companyUrl" text COLLATE "pg_catalog"."default",
  "companyLocation" jsonb,
  "companyRevenue" int4,
  "companyRevenueGrowthPercent" int4,
  "companyEmployeeCount" int4,
  "companyEmployeeCountGrowthPercent" int4,
  "companyDescription" text COLLATE "pg_catalog"."default",
  "companyCulture" text COLLATE "pg_catalog"."default",
  "companyHasMentorship" bool,
  "companyMentorshipDesc" text COLLATE "pg_catalog"."default",
  "companyHasEducationReimbursement" bool,
  "companyHasReimbursementDesc" bool,
  "companyAdmiredCompanies" jsonb[],
  "startDate" time(6),
  "positionTitle" text COLLATE "pg_catalog"."default",
  "positionTravelPercent" int4,
  "productSoldTypes" text[] COLLATE "pg_catalog"."default",
  "positionBaseMin" int4,
  "positionBaseMax" int4,
  "positionOTEMin" int4,
  "positionOTEMax" int4,
  "positionQuotaTargetMin" int4,
  "positionQuotaTargetMax" int4,
  "positionProductFileUrl" text COLLATE "pg_catalog"."default",
  "positionSalesCycleMin" int4,
  "positionSalesCycleMax" int4,
  "fieldInside" text COLLATE "pg_catalog"."default",
  "positionOverview" text COLLATE "pg_catalog"."default",
  "dealPercent" int4,
  "teamReportingTo" text COLLATE "pg_catalog"."default",
  "teamLinkedin" text COLLATE "pg_catalog"."default",
  "teamSize" int4,
  "teamSizeMin" int4,
  "teamSizeMax" int4,
  "saleTools" text[] COLLATE "pg_catalog"."default",
  "saleModels" text[] COLLATE "pg_catalog"."default",
  "saleMethods" text[] COLLATE "pg_catalog"."default",
  "career" text COLLATE "pg_catalog"."default",
  "training" text COLLATE "pg_catalog"."default",
  "isBDRSDRSupport" bool,
  "newSalesHireLastYear" int4,
  "teamVideoUrl" text COLLATE "pg_catalog"."default",
  "has401K" bool,
  "contributionDegree" text COLLATE "pg_catalog"."default",
  "hasSharingProfit" bool,
  "sharingDetail" text COLLATE "pg_catalog"."default",
  "isEquity" bool,
  "hasHealthMedical" bool,
  "hasHealthDental" bool,
  "hasHealthVision" bool,
  "otherBenefits" text COLLATE "pg_catalog"."default",
  "additionDocumentUrl" text COLLATE "pg_catalog"."default",
  "awards" text[] COLLATE "pg_catalog"."default",
  "_state" text COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "_entityId" int4,
  "_previousVersionId" int4,
  "orgId" int4,
  "companyTypeId" int4,
  "positionRoleTypeId" int4,
  "positionSalesTypeId" int4,
  "positionRoleId" int4
)
;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs__Versions_CompanyIndustries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Jobs__Versions_CompanyIndustries";
CREATE TABLE "titanhouse_gig_versioning"."Jobs__Versions_CompanyIndustries" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "jobVersionId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_CompanyIndustries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs__Versions_CompanyMiniTags
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Jobs__Versions_CompanyMiniTags";
CREATE TABLE "titanhouse_gig_versioning"."Jobs__Versions_CompanyMiniTags" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "jobVersionId" int4 NOT NULL,
  "miniTagId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_CompanyMiniTags" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs__Versions_PositionClientTypes
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Jobs__Versions_PositionClientTypes";
CREATE TABLE "titanhouse_gig_versioning"."Jobs__Versions_PositionClientTypes" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "jobVersionId" int4 NOT NULL,
  "clientTypeId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_PositionClientTypes" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Jobs__Versions_PositionDepartments
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Jobs__Versions_PositionDepartments";
CREATE TABLE "titanhouse_gig_versioning"."Jobs__Versions_PositionDepartments" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "jobVersionId" int4 NOT NULL,
  "departmentId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_PositionDepartments" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Organizations
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Organizations";
CREATE TABLE "titanhouse_gig_versioning"."Organizations" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_gig_versioning"."Organizations_id_seq"'::regclass),
  "name" text COLLATE "pg_catalog"."default",
  "url" text COLLATE "pg_catalog"."default",
  "location" jsonb,
  "revenueHistory" jsonb[],
  "employeeCountHistory" jsonb[],
  "culture" text COLLATE "pg_catalog"."default",
  "hasMentorship" bool,
  "mentorshipDesc" text COLLATE "pg_catalog"."default",
  "hasEducationReimbursement" bool,
  "reimbursementDesc" text COLLATE "pg_catalog"."default",
  "admiredCompanies" bool[],
  "competitorCompanies" bool[],
  "similarCompanies" bool[],
  "stockExchange" text COLLATE "pg_catalog"."default",
  "tickerSymbol" text COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "keywords" text[] COLLATE "pg_catalog"."default",
  "publicPrivate" text COLLATE "pg_catalog"."default",
  "salesCulture" text COLLATE "pg_catalog"."default",
  "salesLeadershipOverview" text COLLATE "pg_catalog"."default",
  "salesTrainingProvided" text COLLATE "pg_catalog"."default",
  "salesToolsUsed" text[] COLLATE "pg_catalog"."default",
  "salesTeamVideo" text COLLATE "pg_catalog"."default",
  "_state" text COLLATE "pg_catalog"."default",
  "_deleted" bool,
  "_syncStatus" text COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "_versionId" int4,
  "organizationTypeId" int4,
  "companyTypeId" int4
)
;
ALTER TABLE "titanhouse_gig_versioning"."Organizations" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Organizations_Industries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Organizations_Industries";
CREATE TABLE "titanhouse_gig_versioning"."Organizations_Industries" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "organizationId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Organizations_Industries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Organizations_MiniTags
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Organizations_MiniTags";
CREATE TABLE "titanhouse_gig_versioning"."Organizations_MiniTags" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "organizationId" int4 NOT NULL,
  "miniTagId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Organizations_MiniTags" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Organizations__Versions
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Organizations__Versions";
CREATE TABLE "titanhouse_gig_versioning"."Organizations__Versions" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_gig_versioning"."Organizations__Versions_id_seq"'::regclass),
  "name" text COLLATE "pg_catalog"."default",
  "url" text COLLATE "pg_catalog"."default",
  "location" jsonb,
  "revenueHistory" jsonb[],
  "employeeCountHistory" jsonb[],
  "culture" text COLLATE "pg_catalog"."default",
  "hasMentorship" bool,
  "mentorshipDesc" text COLLATE "pg_catalog"."default",
  "hasEducationReimbursement" bool,
  "reimbursementDesc" text COLLATE "pg_catalog"."default",
  "admiredCompanies" bool[],
  "competitorCompanies" bool[],
  "similarCompanies" bool[],
  "stockExchange" text COLLATE "pg_catalog"."default",
  "tickerSymbol" text COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "keywords" text[] COLLATE "pg_catalog"."default",
  "publicPrivate" text COLLATE "pg_catalog"."default",
  "salesCulture" text COLLATE "pg_catalog"."default",
  "salesLeadershipOverview" text COLLATE "pg_catalog"."default",
  "salesTrainingProvided" text COLLATE "pg_catalog"."default",
  "salesToolsUsed" text[] COLLATE "pg_catalog"."default",
  "salesTeamVideo" text COLLATE "pg_catalog"."default",
  "_state" text COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "_entityId" int4,
  "_previousVersionId" int4,
  "organizationTypeId" int4,
  "companyTypeId" int4
)
;
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Organizations__Versions_Industries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Organizations__Versions_Industries";
CREATE TABLE "titanhouse_gig_versioning"."Organizations__Versions_Industries" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "organizationVersionId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions_Industries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Organizations__Versions_MiniTags
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Organizations__Versions_MiniTags";
CREATE TABLE "titanhouse_gig_versioning"."Organizations__Versions_MiniTags" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "organizationVersionId" int4 NOT NULL,
  "miniTagId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions_MiniTags" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents";
CREATE TABLE "titanhouse_gig_versioning"."Talents" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_gig_versioning"."Talents_id_seq"'::regclass),
  "firstName" text COLLATE "pg_catalog"."default",
  "lastName" text COLLATE "pg_catalog"."default",
  "middleName" text COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default",
  "phone" text COLLATE "pg_catalog"."default",
  "location" jsonb,
  "socialLink" jsonb,
  "profileImg" text COLLATE "pg_catalog"."default",
  "militaryBranch" text COLLATE "pg_catalog"."default",
  "bio" text COLLATE "pg_catalog"."default",
  "resumeLink" text COLLATE "pg_catalog"."default",
  "interestBaseMin" int4,
  "interestBaseMax" int4,
  "interestOteMin" int4,
  "interestOteMax" int4,
  "interestLocs" jsonb[],
  "interestRelocation" bool,
  "interestRemote" bool,
  "productAndService" text[] COLLATE "pg_catalog"."default",
  "interestProducts" text[] COLLATE "pg_catalog"."default",
  "interestTravel" int4,
  "interestDesc" text COLLATE "pg_catalog"."default",
  "interestEquity" bool,
  "interestSalesCycleMin" int4,
  "interestSalesCycleMax" int4,
  "workSalesYears" int4,
  "workTools" text[] COLLATE "pg_catalog"."default",
  "workMethods" text[] COLLATE "pg_catalog"."default",
  "workInternational" bool,
  "workInternationalList" jsonb[],
  "workProductService" jsonb[],
  "workDealSize" jsonb[],
  "workSalesCycle" jsonb[],
  "_state" text COLLATE "pg_catalog"."default",
  "_deleted" bool,
  "_syncStatus" text COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "_versionId" int4,
  "militarySrvId" int4,
  "interestStageId" int4,
  "preferredRoleLevelId" int4
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_InterestClientTypes
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents_InterestClientTypes";
CREATE TABLE "titanhouse_gig_versioning"."Talents_InterestClientTypes" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentId" int4 NOT NULL,
  "clientTypeId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestClientTypes" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_InterestIndustries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents_InterestIndustries";
CREATE TABLE "titanhouse_gig_versioning"."Talents_InterestIndustries" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestIndustries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_InterestRoles
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents_InterestRoles";
CREATE TABLE "titanhouse_gig_versioning"."Talents_InterestRoles" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentId" int4 NOT NULL,
  "roleId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestRoles" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_InterestSalesTypes
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents_InterestSalesTypes";
CREATE TABLE "titanhouse_gig_versioning"."Talents_InterestSalesTypes" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentId" int4 NOT NULL,
  "salesTypeId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestSalesTypes" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_WorkClientTypes
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents_WorkClientTypes";
CREATE TABLE "titanhouse_gig_versioning"."Talents_WorkClientTypes" (
  "years" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentId" int4 NOT NULL,
  "clientTypeId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkClientTypes" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_WorkIndustries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents_WorkIndustries";
CREATE TABLE "titanhouse_gig_versioning"."Talents_WorkIndustries" (
  "years" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkIndustries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_WorkRoleLevels
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents_WorkRoleLevels";
CREATE TABLE "titanhouse_gig_versioning"."Talents_WorkRoleLevels" (
  "years" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentId" int4 NOT NULL,
  "roleLevelId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkRoleLevels" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_WorkRoles
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents_WorkRoles";
CREATE TABLE "titanhouse_gig_versioning"."Talents_WorkRoles" (
  "years" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentId" int4 NOT NULL,
  "roleId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkRoles" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents_WorkSalesTypes
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents_WorkSalesTypes";
CREATE TABLE "titanhouse_gig_versioning"."Talents_WorkSalesTypes" (
  "years" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentId" int4 NOT NULL,
  "salesTypeId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkSalesTypes" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents__Versions";
CREATE TABLE "titanhouse_gig_versioning"."Talents__Versions" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_gig_versioning"."Talents__Versions_id_seq"'::regclass),
  "firstName" text COLLATE "pg_catalog"."default",
  "lastName" text COLLATE "pg_catalog"."default",
  "middleName" text COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default",
  "phone" text COLLATE "pg_catalog"."default",
  "location" jsonb,
  "socialLink" jsonb,
  "profileImg" text COLLATE "pg_catalog"."default",
  "militaryBranch" text COLLATE "pg_catalog"."default",
  "bio" text COLLATE "pg_catalog"."default",
  "resumeLink" text COLLATE "pg_catalog"."default",
  "interestBaseMin" int4,
  "interestBaseMax" int4,
  "interestOteMin" int4,
  "interestOteMax" int4,
  "interestLocs" jsonb[],
  "interestRelocation" bool,
  "interestRemote" bool,
  "productAndService" text[] COLLATE "pg_catalog"."default",
  "interestProducts" text[] COLLATE "pg_catalog"."default",
  "interestTravel" int4,
  "interestDesc" text COLLATE "pg_catalog"."default",
  "interestEquity" bool,
  "interestSalesCycleMin" int4,
  "interestSalesCycleMax" int4,
  "workSalesYears" int4,
  "workTools" text[] COLLATE "pg_catalog"."default",
  "workMethods" text[] COLLATE "pg_catalog"."default",
  "workInternational" bool,
  "workInternationalList" jsonb[],
  "workProductService" jsonb[],
  "workDealSize" jsonb[],
  "workSalesCycle" jsonb[],
  "_state" text COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "_entityId" int4,
  "_previousVersionId" int4,
  "militarySrvId" int4,
  "interestStageId" int4,
  "preferredRoleLevelId" int4
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_Experiences__Versions
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents__Versions_Experiences__Versions";
CREATE TABLE "titanhouse_gig_versioning"."Talents__Versions_Experiences__Versions" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "experienceVersionId" int4 NOT NULL,
  "talentVersionId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_Experiences__Versions" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_InterestClientTypes
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents__Versions_InterestClientTypes";
CREATE TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestClientTypes" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentVersionId" int4 NOT NULL,
  "clientTypeId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestClientTypes" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_InterestIndustries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents__Versions_InterestIndustries";
CREATE TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestIndustries" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentVersionId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestIndustries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_InterestRoles
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents__Versions_InterestRoles";
CREATE TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestRoles" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentVersionId" int4 NOT NULL,
  "roleId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestRoles" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_InterestSalesTypes
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents__Versions_InterestSalesTypes";
CREATE TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestSalesTypes" (
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentVersionId" int4 NOT NULL,
  "salesTypeId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestSalesTypes" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_WorkClientTypes
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents__Versions_WorkClientTypes";
CREATE TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkClientTypes" (
  "years" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentVersionId" int4 NOT NULL,
  "clientTypeId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkClientTypes" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_WorkIndustries
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents__Versions_WorkIndustries";
CREATE TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkIndustries" (
  "years" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentVersionId" int4 NOT NULL,
  "industryId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkIndustries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_WorkRoleLevels
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents__Versions_WorkRoleLevels";
CREATE TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkRoleLevels" (
  "years" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentVersionId" int4 NOT NULL,
  "roleLevelId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkRoleLevels" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_WorkRoles
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents__Versions_WorkRoles";
CREATE TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkRoles" (
  "years" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentVersionId" int4 NOT NULL,
  "roleId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkRoles" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Talents__Versions_WorkSalesTypes
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Talents__Versions_WorkSalesTypes";
CREATE TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkSalesTypes" (
  "years" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "talentVersionId" int4 NOT NULL,
  "salesTypeId" int4 NOT NULL
)
;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkSalesTypes" OWNER TO "postgres";

-- ----------------------------
-- Table structure for Values
-- ----------------------------
DROP TABLE IF EXISTS "titanhouse_gig_versioning"."Values";
CREATE TABLE "titanhouse_gig_versioning"."Values" (
  "id" int4 NOT NULL DEFAULT nextval('"titanhouse_gig_versioning"."Values_id_seq"'::regclass),
  "name" text COLLATE "pg_catalog"."default",
  "category" text COLLATE "pg_catalog"."default",
  "order" int4,
  "createdAt" timestamptz(6) NOT NULL,
  "updatedAt" timestamptz(6) NOT NULL,
  "parentId" int4
)
;
ALTER TABLE "titanhouse_gig_versioning"."Values" OWNER TO "postgres";

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "titanhouse_gig_versioning"."Experiences__Versions_id_seq"
OWNED BY "titanhouse_gig_versioning"."Experiences__Versions"."id";
SELECT setval('"titanhouse_gig_versioning"."Experiences__Versions_id_seq"', 2, false);
ALTER SEQUENCE "titanhouse_gig_versioning"."Experiences_id_seq"
OWNED BY "titanhouse_gig_versioning"."Experiences"."id";
SELECT setval('"titanhouse_gig_versioning"."Experiences_id_seq"', 2, false);
ALTER SEQUENCE "titanhouse_gig_versioning"."Industries_id_seq"
OWNED BY "titanhouse_gig_versioning"."Industries"."id";
SELECT setval('"titanhouse_gig_versioning"."Industries_id_seq"', 2, false);
ALTER SEQUENCE "titanhouse_gig_versioning"."Jobs__Versions_id_seq"
OWNED BY "titanhouse_gig_versioning"."Jobs__Versions"."id";
SELECT setval('"titanhouse_gig_versioning"."Jobs__Versions_id_seq"', 2, false);
ALTER SEQUENCE "titanhouse_gig_versioning"."Jobs_id_seq"
OWNED BY "titanhouse_gig_versioning"."Jobs"."id";
SELECT setval('"titanhouse_gig_versioning"."Jobs_id_seq"', 2, false);
ALTER SEQUENCE "titanhouse_gig_versioning"."Organizations__Versions_id_seq"
OWNED BY "titanhouse_gig_versioning"."Organizations__Versions"."id";
SELECT setval('"titanhouse_gig_versioning"."Organizations__Versions_id_seq"', 2, false);
ALTER SEQUENCE "titanhouse_gig_versioning"."Organizations_id_seq"
OWNED BY "titanhouse_gig_versioning"."Organizations"."id";
SELECT setval('"titanhouse_gig_versioning"."Organizations_id_seq"', 2, false);
ALTER SEQUENCE "titanhouse_gig_versioning"."Talents__Versions_id_seq"
OWNED BY "titanhouse_gig_versioning"."Talents__Versions"."id";
SELECT setval('"titanhouse_gig_versioning"."Talents__Versions_id_seq"', 2, false);
ALTER SEQUENCE "titanhouse_gig_versioning"."Talents_id_seq"
OWNED BY "titanhouse_gig_versioning"."Talents"."id";
SELECT setval('"titanhouse_gig_versioning"."Talents_id_seq"', 2, false);
ALTER SEQUENCE "titanhouse_gig_versioning"."Values_id_seq"
OWNED BY "titanhouse_gig_versioning"."Values"."id";
SELECT setval('"titanhouse_gig_versioning"."Values_id_seq"', 2, false);

-- ----------------------------
-- Primary Key structure for table Experiences
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Experiences" ADD CONSTRAINT "Experiences_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Experiences_Industries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Experiences_Industries" ADD CONSTRAINT "Experiences_Industries_pkey" PRIMARY KEY ("experienceId", "industryId");

-- ----------------------------
-- Primary Key structure for table Experiences__Versions
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Experiences__Versions_Industries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions_Industries" ADD CONSTRAINT "Experiences__Versions_Industries_pkey" PRIMARY KEY ("experienceVersionId", "industryId");

-- ----------------------------
-- Primary Key structure for table Industries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Industries" ADD CONSTRAINT "Industries_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Jobs
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs" ADD CONSTRAINT "Jobs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Jobs_CompanyIndustries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs_CompanyIndustries" ADD CONSTRAINT "Jobs_CompanyIndustries_pkey" PRIMARY KEY ("jobId", "industryId");

-- ----------------------------
-- Primary Key structure for table Jobs_CompanyMiniTags
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs_CompanyMiniTags" ADD CONSTRAINT "Jobs_CompanyMiniTags_pkey" PRIMARY KEY ("jobId", "miniTagId");

-- ----------------------------
-- Primary Key structure for table Jobs_PositionClientTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs_PositionClientTypes" ADD CONSTRAINT "Jobs_PositionClientTypes_pkey" PRIMARY KEY ("jobId", "clientTypeId");

-- ----------------------------
-- Primary Key structure for table Jobs_PositionDepartments
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs_PositionDepartments" ADD CONSTRAINT "Jobs_PositionDepartments_pkey" PRIMARY KEY ("jobId", "departmentId");

-- ----------------------------
-- Primary Key structure for table Jobs__Versions
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions" ADD CONSTRAINT "Jobs__Versions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Jobs__Versions_CompanyIndustries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_CompanyIndustries" ADD CONSTRAINT "Jobs__Versions_CompanyIndustries_pkey" PRIMARY KEY ("jobVersionId", "industryId");

-- ----------------------------
-- Primary Key structure for table Jobs__Versions_CompanyMiniTags
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_CompanyMiniTags" ADD CONSTRAINT "Jobs__Versions_CompanyMiniTags_pkey" PRIMARY KEY ("jobVersionId", "miniTagId");

-- ----------------------------
-- Primary Key structure for table Jobs__Versions_PositionClientTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_PositionClientTypes" ADD CONSTRAINT "Jobs__Versions_PositionClientTypes_pkey" PRIMARY KEY ("jobVersionId", "clientTypeId");

-- ----------------------------
-- Primary Key structure for table Jobs__Versions_PositionDepartments
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_PositionDepartments" ADD CONSTRAINT "Jobs__Versions_PositionDepartments_pkey" PRIMARY KEY ("jobVersionId", "departmentId");

-- ----------------------------
-- Primary Key structure for table Organizations
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Organizations" ADD CONSTRAINT "Organizations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Organizations_Industries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Organizations_Industries" ADD CONSTRAINT "Organizations_Industries_pkey" PRIMARY KEY ("organizationId", "industryId");

-- ----------------------------
-- Primary Key structure for table Organizations_MiniTags
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Organizations_MiniTags" ADD CONSTRAINT "Organizations_MiniTags_pkey" PRIMARY KEY ("organizationId", "miniTagId");

-- ----------------------------
-- Primary Key structure for table Organizations__Versions
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions" ADD CONSTRAINT "Organizations__Versions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Organizations__Versions_Industries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions_Industries" ADD CONSTRAINT "Organizations__Versions_Industries_pkey" PRIMARY KEY ("organizationVersionId", "industryId");

-- ----------------------------
-- Primary Key structure for table Organizations__Versions_MiniTags
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions_MiniTags" ADD CONSTRAINT "Organizations__Versions_MiniTags_pkey" PRIMARY KEY ("organizationVersionId", "miniTagId");

-- ----------------------------
-- Primary Key structure for table Talents
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents" ADD CONSTRAINT "Talents_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Talents_InterestClientTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestClientTypes" ADD CONSTRAINT "Talents_InterestClientTypes_pkey" PRIMARY KEY ("talentId", "clientTypeId");

-- ----------------------------
-- Primary Key structure for table Talents_InterestIndustries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestIndustries" ADD CONSTRAINT "Talents_InterestIndustries_pkey" PRIMARY KEY ("talentId", "industryId");

-- ----------------------------
-- Primary Key structure for table Talents_InterestRoles
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestRoles" ADD CONSTRAINT "Talents_InterestRoles_pkey" PRIMARY KEY ("talentId", "roleId");

-- ----------------------------
-- Primary Key structure for table Talents_InterestSalesTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestSalesTypes" ADD CONSTRAINT "Talents_InterestSalesTypes_pkey" PRIMARY KEY ("talentId", "salesTypeId");

-- ----------------------------
-- Primary Key structure for table Talents_WorkClientTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkClientTypes" ADD CONSTRAINT "Talents_WorkClientTypes_pkey" PRIMARY KEY ("talentId", "clientTypeId");

-- ----------------------------
-- Primary Key structure for table Talents_WorkIndustries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkIndustries" ADD CONSTRAINT "Talents_WorkIndustries_pkey" PRIMARY KEY ("talentId", "industryId");

-- ----------------------------
-- Primary Key structure for table Talents_WorkRoleLevels
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkRoleLevels" ADD CONSTRAINT "Talents_WorkRoleLevels_pkey" PRIMARY KEY ("talentId", "roleLevelId");

-- ----------------------------
-- Primary Key structure for table Talents_WorkRoles
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkRoles" ADD CONSTRAINT "Talents_WorkRoles_pkey" PRIMARY KEY ("talentId", "roleId");

-- ----------------------------
-- Primary Key structure for table Talents_WorkSalesTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkSalesTypes" ADD CONSTRAINT "Talents_WorkSalesTypes_pkey" PRIMARY KEY ("talentId", "salesTypeId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions" ADD CONSTRAINT "Talents__Versions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_Experiences__Versions
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_Experiences__Versions" ADD CONSTRAINT "Talents__Versions_Experiences__Versions_pkey" PRIMARY KEY ("experienceVersionId", "talentVersionId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_InterestClientTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestClientTypes" ADD CONSTRAINT "Talents__Versions_InterestClientTypes_pkey" PRIMARY KEY ("talentVersionId", "clientTypeId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_InterestIndustries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestIndustries" ADD CONSTRAINT "Talents__Versions_InterestIndustries_pkey" PRIMARY KEY ("talentVersionId", "industryId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_InterestRoles
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestRoles" ADD CONSTRAINT "Talents__Versions_InterestRoles_pkey" PRIMARY KEY ("talentVersionId", "roleId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_InterestSalesTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestSalesTypes" ADD CONSTRAINT "Talents__Versions_InterestSalesTypes_pkey" PRIMARY KEY ("talentVersionId", "salesTypeId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_WorkClientTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkClientTypes" ADD CONSTRAINT "Talents__Versions_WorkClientTypes_pkey" PRIMARY KEY ("talentVersionId", "clientTypeId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_WorkIndustries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkIndustries" ADD CONSTRAINT "Talents__Versions_WorkIndustries_pkey" PRIMARY KEY ("talentVersionId", "industryId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_WorkRoleLevels
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkRoleLevels" ADD CONSTRAINT "Talents__Versions_WorkRoleLevels_pkey" PRIMARY KEY ("talentVersionId", "roleLevelId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_WorkRoles
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkRoles" ADD CONSTRAINT "Talents__Versions_WorkRoles_pkey" PRIMARY KEY ("talentVersionId", "roleId");

-- ----------------------------
-- Primary Key structure for table Talents__Versions_WorkSalesTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkSalesTypes" ADD CONSTRAINT "Talents__Versions_WorkSalesTypes_pkey" PRIMARY KEY ("talentVersionId", "salesTypeId");

-- ----------------------------
-- Primary Key structure for table Values
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Values" ADD CONSTRAINT "Values_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table Experiences
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Experiences" ADD CONSTRAINT "Experiences_expSalesTypeId_fkey" FOREIGN KEY ("expSalesTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Experiences" ADD CONSTRAINT "Experiences_expTypeId_fkey" FOREIGN KEY ("expTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Experiences" ADD CONSTRAINT "Experiences_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "titanhouse_gig_versioning"."Organizations" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Experiences" ADD CONSTRAINT "Experiences_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Experiences" ADD CONSTRAINT "Experiences_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_gig_versioning"."Talents" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Experiences_Industries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Experiences_Industries" ADD CONSTRAINT "Experiences_Industries_experienceId_fkey" FOREIGN KEY ("experienceId") REFERENCES "titanhouse_gig_versioning"."Experiences" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Experiences_Industries" ADD CONSTRAINT "Experiences_Industries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_gig_versioning"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Experiences__Versions
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions__entityId_fkey" FOREIGN KEY ("_entityId") REFERENCES "titanhouse_gig_versioning"."Experiences" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions__previousVersionId_fkey" FOREIGN KEY ("_previousVersionId") REFERENCES "titanhouse_gig_versioning"."Experiences__Versions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions_expSalesTypeId_fkey" FOREIGN KEY ("expSalesTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions_expTypeId_fkey" FOREIGN KEY ("expTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "titanhouse_gig_versioning"."Organizations" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions" ADD CONSTRAINT "Experiences__Versions_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_gig_versioning"."Talents" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Experiences__Versions_Industries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions_Industries" ADD CONSTRAINT "Experiences__Versions_Industries_experienceVersionId_fkey" FOREIGN KEY ("experienceVersionId") REFERENCES "titanhouse_gig_versioning"."Experiences__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Experiences__Versions_Industries" ADD CONSTRAINT "Experiences__Versions_Industries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_gig_versioning"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Industries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Industries" ADD CONSTRAINT "Industries_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "titanhouse_gig_versioning"."Industries" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs" ADD CONSTRAINT "Jobs_companyTypeId_fkey" FOREIGN KEY ("companyTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs" ADD CONSTRAINT "Jobs_orgId_fkey" FOREIGN KEY ("orgId") REFERENCES "titanhouse_gig_versioning"."Organizations" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs" ADD CONSTRAINT "Jobs_positionRoleId_fkey" FOREIGN KEY ("positionRoleId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs" ADD CONSTRAINT "Jobs_positionRoleTypeId_fkey" FOREIGN KEY ("positionRoleTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs" ADD CONSTRAINT "Jobs_positionSalesTypeId_fkey" FOREIGN KEY ("positionSalesTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs_CompanyIndustries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs_CompanyIndustries" ADD CONSTRAINT "Jobs_CompanyIndustries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_gig_versioning"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs_CompanyIndustries" ADD CONSTRAINT "Jobs_CompanyIndustries_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "titanhouse_gig_versioning"."Jobs" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs_CompanyMiniTags
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs_CompanyMiniTags" ADD CONSTRAINT "Jobs_CompanyMiniTags_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "titanhouse_gig_versioning"."Jobs" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs_CompanyMiniTags" ADD CONSTRAINT "Jobs_CompanyMiniTags_miniTagId_fkey" FOREIGN KEY ("miniTagId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs_PositionClientTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs_PositionClientTypes" ADD CONSTRAINT "Jobs_PositionClientTypes_clientTypeId_fkey" FOREIGN KEY ("clientTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs_PositionClientTypes" ADD CONSTRAINT "Jobs_PositionClientTypes_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "titanhouse_gig_versioning"."Jobs" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs_PositionDepartments
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs_PositionDepartments" ADD CONSTRAINT "Jobs_PositionDepartments_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs_PositionDepartments" ADD CONSTRAINT "Jobs_PositionDepartments_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "titanhouse_gig_versioning"."Jobs" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs__Versions
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions" ADD CONSTRAINT "Jobs__Versions__entityId_fkey" FOREIGN KEY ("_entityId") REFERENCES "titanhouse_gig_versioning"."Jobs" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions" ADD CONSTRAINT "Jobs__Versions__previousVersionId_fkey" FOREIGN KEY ("_previousVersionId") REFERENCES "titanhouse_gig_versioning"."Jobs__Versions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions" ADD CONSTRAINT "Jobs__Versions_companyTypeId_fkey" FOREIGN KEY ("companyTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions" ADD CONSTRAINT "Jobs__Versions_orgId_fkey" FOREIGN KEY ("orgId") REFERENCES "titanhouse_gig_versioning"."Organizations" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions" ADD CONSTRAINT "Jobs__Versions_positionRoleId_fkey" FOREIGN KEY ("positionRoleId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions" ADD CONSTRAINT "Jobs__Versions_positionRoleTypeId_fkey" FOREIGN KEY ("positionRoleTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions" ADD CONSTRAINT "Jobs__Versions_positionSalesTypeId_fkey" FOREIGN KEY ("positionSalesTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs__Versions_CompanyIndustries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_CompanyIndustries" ADD CONSTRAINT "Jobs__Versions_CompanyIndustries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_gig_versioning"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_CompanyIndustries" ADD CONSTRAINT "Jobs__Versions_CompanyIndustries_jobVersionId_fkey" FOREIGN KEY ("jobVersionId") REFERENCES "titanhouse_gig_versioning"."Jobs__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs__Versions_CompanyMiniTags
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_CompanyMiniTags" ADD CONSTRAINT "Jobs__Versions_CompanyMiniTags_jobVersionId_fkey" FOREIGN KEY ("jobVersionId") REFERENCES "titanhouse_gig_versioning"."Jobs__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_CompanyMiniTags" ADD CONSTRAINT "Jobs__Versions_CompanyMiniTags_miniTagId_fkey" FOREIGN KEY ("miniTagId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs__Versions_PositionClientTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_PositionClientTypes" ADD CONSTRAINT "Jobs__Versions_PositionClientTypes_clientTypeId_fkey" FOREIGN KEY ("clientTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_PositionClientTypes" ADD CONSTRAINT "Jobs__Versions_PositionClientTypes_jobVersionId_fkey" FOREIGN KEY ("jobVersionId") REFERENCES "titanhouse_gig_versioning"."Jobs__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Jobs__Versions_PositionDepartments
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_PositionDepartments" ADD CONSTRAINT "Jobs__Versions_PositionDepartments_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Jobs__Versions_PositionDepartments" ADD CONSTRAINT "Jobs__Versions_PositionDepartments_jobVersionId_fkey" FOREIGN KEY ("jobVersionId") REFERENCES "titanhouse_gig_versioning"."Jobs__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Organizations
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Organizations" ADD CONSTRAINT "Organizations_companyTypeId_fkey" FOREIGN KEY ("companyTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Organizations" ADD CONSTRAINT "Organizations_organizationTypeId_fkey" FOREIGN KEY ("organizationTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Organizations_Industries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Organizations_Industries" ADD CONSTRAINT "Organizations_Industries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_gig_versioning"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Organizations_Industries" ADD CONSTRAINT "Organizations_Industries_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "titanhouse_gig_versioning"."Organizations" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Organizations_MiniTags
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Organizations_MiniTags" ADD CONSTRAINT "Organizations_MiniTags_miniTagId_fkey" FOREIGN KEY ("miniTagId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Organizations_MiniTags" ADD CONSTRAINT "Organizations_MiniTags_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "titanhouse_gig_versioning"."Organizations" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Organizations__Versions
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions" ADD CONSTRAINT "Organizations__Versions__entityId_fkey" FOREIGN KEY ("_entityId") REFERENCES "titanhouse_gig_versioning"."Organizations" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions" ADD CONSTRAINT "Organizations__Versions__previousVersionId_fkey" FOREIGN KEY ("_previousVersionId") REFERENCES "titanhouse_gig_versioning"."Organizations__Versions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions" ADD CONSTRAINT "Organizations__Versions_companyTypeId_fkey" FOREIGN KEY ("companyTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions" ADD CONSTRAINT "Organizations__Versions_organizationTypeId_fkey" FOREIGN KEY ("organizationTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Organizations__Versions_Industries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions_Industries" ADD CONSTRAINT "Organizations__Versions_Industries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_gig_versioning"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions_Industries" ADD CONSTRAINT "Organizations__Versions_Industries_organizationVersionId_fkey" FOREIGN KEY ("organizationVersionId") REFERENCES "titanhouse_gig_versioning"."Organizations__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Organizations__Versions_MiniTags
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions_MiniTags" ADD CONSTRAINT "Organizations__Versions_MiniTags_miniTagId_fkey" FOREIGN KEY ("miniTagId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Organizations__Versions_MiniTags" ADD CONSTRAINT "Organizations__Versions_MiniTags_organizationVersionId_fkey" FOREIGN KEY ("organizationVersionId") REFERENCES "titanhouse_gig_versioning"."Organizations__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents" ADD CONSTRAINT "Talents_interestStageId_fkey" FOREIGN KEY ("interestStageId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents" ADD CONSTRAINT "Talents_militarySrvId_fkey" FOREIGN KEY ("militarySrvId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents" ADD CONSTRAINT "Talents_preferredRoleLevelId_fkey" FOREIGN KEY ("preferredRoleLevelId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_InterestClientTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestClientTypes" ADD CONSTRAINT "Talents_InterestClientTypes_clientTypeId_fkey" FOREIGN KEY ("clientTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestClientTypes" ADD CONSTRAINT "Talents_InterestClientTypes_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_gig_versioning"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_InterestIndustries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestIndustries" ADD CONSTRAINT "Talents_InterestIndustries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_gig_versioning"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestIndustries" ADD CONSTRAINT "Talents_InterestIndustries_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_gig_versioning"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_InterestRoles
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestRoles" ADD CONSTRAINT "Talents_InterestRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestRoles" ADD CONSTRAINT "Talents_InterestRoles_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_gig_versioning"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_InterestSalesTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestSalesTypes" ADD CONSTRAINT "Talents_InterestSalesTypes_salesTypeId_fkey" FOREIGN KEY ("salesTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents_InterestSalesTypes" ADD CONSTRAINT "Talents_InterestSalesTypes_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_gig_versioning"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_WorkClientTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkClientTypes" ADD CONSTRAINT "Talents_WorkClientTypes_clientTypeId_fkey" FOREIGN KEY ("clientTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkClientTypes" ADD CONSTRAINT "Talents_WorkClientTypes_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_gig_versioning"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_WorkIndustries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkIndustries" ADD CONSTRAINT "Talents_WorkIndustries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_gig_versioning"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkIndustries" ADD CONSTRAINT "Talents_WorkIndustries_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_gig_versioning"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_WorkRoleLevels
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkRoleLevels" ADD CONSTRAINT "Talents_WorkRoleLevels_roleLevelId_fkey" FOREIGN KEY ("roleLevelId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkRoleLevels" ADD CONSTRAINT "Talents_WorkRoleLevels_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_gig_versioning"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_WorkRoles
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkRoles" ADD CONSTRAINT "Talents_WorkRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkRoles" ADD CONSTRAINT "Talents_WorkRoles_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_gig_versioning"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents_WorkSalesTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkSalesTypes" ADD CONSTRAINT "Talents_WorkSalesTypes_salesTypeId_fkey" FOREIGN KEY ("salesTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents_WorkSalesTypes" ADD CONSTRAINT "Talents_WorkSalesTypes_talentId_fkey" FOREIGN KEY ("talentId") REFERENCES "titanhouse_gig_versioning"."Talents" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions" ADD CONSTRAINT "Talents__Versions__entityId_fkey" FOREIGN KEY ("_entityId") REFERENCES "titanhouse_gig_versioning"."Talents" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions" ADD CONSTRAINT "Talents__Versions__previousVersionId_fkey" FOREIGN KEY ("_previousVersionId") REFERENCES "titanhouse_gig_versioning"."Talents__Versions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions" ADD CONSTRAINT "Talents__Versions_interestStageId_fkey" FOREIGN KEY ("interestStageId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions" ADD CONSTRAINT "Talents__Versions_militarySrvId_fkey" FOREIGN KEY ("militarySrvId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions" ADD CONSTRAINT "Talents__Versions_preferredRoleLevelId_fkey" FOREIGN KEY ("preferredRoleLevelId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_Experiences__Versions
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_Experiences__Versions" ADD CONSTRAINT "Talents__Versions_Experiences__Version_experienceVersionId_fkey" FOREIGN KEY ("experienceVersionId") REFERENCES "titanhouse_gig_versioning"."Experiences__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_Experiences__Versions" ADD CONSTRAINT "Talents__Versions_Experiences__Versions_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_gig_versioning"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_InterestClientTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestClientTypes" ADD CONSTRAINT "Talents__Versions_InterestClientTypes_clientTypeId_fkey" FOREIGN KEY ("clientTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestClientTypes" ADD CONSTRAINT "Talents__Versions_InterestClientTypes_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_gig_versioning"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_InterestIndustries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestIndustries" ADD CONSTRAINT "Talents__Versions_InterestIndustries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_gig_versioning"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestIndustries" ADD CONSTRAINT "Talents__Versions_InterestIndustries_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_gig_versioning"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_InterestRoles
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestRoles" ADD CONSTRAINT "Talents__Versions_InterestRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestRoles" ADD CONSTRAINT "Talents__Versions_InterestRoles_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_gig_versioning"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_InterestSalesTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestSalesTypes" ADD CONSTRAINT "Talents__Versions_InterestSalesTypes_salesTypeId_fkey" FOREIGN KEY ("salesTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_InterestSalesTypes" ADD CONSTRAINT "Talents__Versions_InterestSalesTypes_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_gig_versioning"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_WorkClientTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkClientTypes" ADD CONSTRAINT "Talents__Versions_WorkClientTypes_clientTypeId_fkey" FOREIGN KEY ("clientTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkClientTypes" ADD CONSTRAINT "Talents__Versions_WorkClientTypes_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_gig_versioning"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_WorkIndustries
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkIndustries" ADD CONSTRAINT "Talents__Versions_WorkIndustries_industryId_fkey" FOREIGN KEY ("industryId") REFERENCES "titanhouse_gig_versioning"."Industries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkIndustries" ADD CONSTRAINT "Talents__Versions_WorkIndustries_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_gig_versioning"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_WorkRoleLevels
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkRoleLevels" ADD CONSTRAINT "Talents__Versions_WorkRoleLevels_roleLevelId_fkey" FOREIGN KEY ("roleLevelId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkRoleLevels" ADD CONSTRAINT "Talents__Versions_WorkRoleLevels_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_gig_versioning"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_WorkRoles
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkRoles" ADD CONSTRAINT "Talents__Versions_WorkRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkRoles" ADD CONSTRAINT "Talents__Versions_WorkRoles_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_gig_versioning"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Talents__Versions_WorkSalesTypes
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkSalesTypes" ADD CONSTRAINT "Talents__Versions_WorkSalesTypes_salesTypeId_fkey" FOREIGN KEY ("salesTypeId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "titanhouse_gig_versioning"."Talents__Versions_WorkSalesTypes" ADD CONSTRAINT "Talents__Versions_WorkSalesTypes_talentVersionId_fkey" FOREIGN KEY ("talentVersionId") REFERENCES "titanhouse_gig_versioning"."Talents__Versions" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Values
-- ----------------------------
ALTER TABLE "titanhouse_gig_versioning"."Values" ADD CONSTRAINT "Values_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "titanhouse_gig_versioning"."Values" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
