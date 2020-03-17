const model = {};
module.exports = model;

const {
  Sequelize,
  DataTypes
} = require('sequelize');
const orm = require('./init');
const {
  schema
} = require('./config');

const {
  Values,
} = require('./values');
const {
  Industries,
} = require('./industries');
const {
  Organizations,
} = require('./organizations');

const {
  TEXT,
  JSONB,
  INTEGER,
  BOOLEAN,
  TIME,
  ARRAY,
} = DataTypes;

let mainFields = {
  companyName: TEXT,
  companyUrl: TEXT,
  companyLocation: JSONB,
  companyRevenue: INTEGER,
  companyRevenueGrowthPercent: INTEGER,
  companyEmployeeCount: INTEGER,
  companyEmployeeCountGrowthPercent: INTEGER,
  companyDescription: TEXT,
  companyCulture: TEXT,
  companyHasMentorship: BOOLEAN,
  companyMentorshipDesc: TEXT,
  companyHasEducationReimbursement: BOOLEAN,
  companyHasReimbursementDesc: BOOLEAN,
  companyAdmiredCompanies: ARRAY(JSONB),
  startDate: TIME,
  positionTitle: TEXT,
  positionTravelPercent: INTEGER,
  productSoldTypes: ARRAY(TEXT),
  positionBaseMin: INTEGER,
  positionBaseMax: INTEGER,
  positionOTEMin: INTEGER,
  positionOTEMax: INTEGER,
  positionQuotaTargetMin: INTEGER,
  positionQuotaTargetMax: INTEGER,
  positionProductFileUrl: TEXT,
  positionSalesCycleMin: INTEGER,
  positionSalesCycleMax: INTEGER,
  fieldInside: TEXT,
  positionOverview: TEXT,
  dealPercent: INTEGER,
  teamReportingTo: TEXT,
  teamLinkedin: TEXT,
  teamSize: INTEGER,
  teamSizeMin: INTEGER,
  teamSizeMax: INTEGER,
  saleTools: ARRAY(TEXT),
  saleModels: ARRAY(TEXT),
  saleMethods: ARRAY(TEXT),
  career: TEXT,
  training: TEXT,
  isBDRSDRSupport: BOOLEAN,
  newSalesHireLastYear: INTEGER,
  teamVideoUrl: TEXT,
  has401K: BOOLEAN,
  contributionDegree: TEXT,
  hasSharingProfit: BOOLEAN,
  sharingDetail: TEXT,
  isEquity: BOOLEAN,
  hasHealthMedical: BOOLEAN,
  hasHealthDental: BOOLEAN,
  hasHealthVision: BOOLEAN,
  otherBenefits: TEXT,
  additionDocumentUrl: TEXT,
  awards: ARRAY(TEXT),

  _state: TEXT,
};

const Jobs = model.Jobs = orm.define('Jobs', {
  ...mainFields,

  _deleted: BOOLEAN,
  _syncStatus: TEXT
}, {
  schema
});

const Jobs__Versions = model.Jobs__Versions = orm.define('Jobs__Versions', {
  ...mainFields
}, {
  schema
});


Jobs.hasMany(Jobs__Versions, {
  foreignKey: '_entityId',
  // constraints: false
});

Jobs__Versions.hasMany(Jobs, {
  foreignKey: '_versionId',
  constraints: false
});

// Jobs.belongsTo(Jobs__Versions, {
//   foreignKey: '_versionId',
//   constraints: false
// });

Jobs__Versions.hasMany(Jobs__Versions, {
  foreignKey: '_previousVersionId',
  // constraints: false
});


Jobs.belongsTo(Organizations, {
  foreignKey: 'orgId'
});

Jobs__Versions.belongsTo(Organizations, {
  foreignKey: 'orgId'
});

Jobs.belongsTo(Values, {
  foreignKey: 'companyTypeId'
});

Jobs__Versions.belongsTo(Values, {
  foreignKey: 'companyTypeId'
});

const Jobs_CompanyIndustries = model.Jobs_CompanyIndustries = orm.define('Jobs_CompanyIndustries', {}, {
  schema
});

Jobs.belongsToMany(Industries, {
  through: Jobs_CompanyIndustries,
  foreignKey: 'jobId'
});

Industries.belongsToMany(Jobs, {
  through: Jobs_CompanyIndustries,
  foreignKey: 'industryId'
});

const Jobs__Versions_CompanyIndustries = model.Jobs__Versions_CompanyIndustries = orm.define('Jobs__Versions_CompanyIndustries', {}, {
  schema
});

Jobs__Versions.belongsToMany(Industries, {
  through: Jobs__Versions_CompanyIndustries,
  foreignKey: 'jobVersionId'
});

Industries.belongsToMany(Jobs__Versions, {
  through: Jobs__Versions_CompanyIndustries,
  foreignKey: 'industryId'
});

const Jobs_CompanyMiniTags = model.Jobs_CompanyMiniTags = orm.define('Jobs_CompanyMiniTags', {}, {
  schema
});

Jobs.belongsToMany(Values, {
  through: Jobs_CompanyMiniTags,
  foreignKey: 'jobId'
});

Values.belongsToMany(Jobs, {
  through: Jobs_CompanyMiniTags,
  foreignKey: 'miniTagId'
});

const Jobs__Versions_CompanyMiniTags = model.Jobs__Versions_CompanyMiniTags = orm.define('Jobs__Versions_CompanyMiniTags', {}, {
  schema
});

Jobs__Versions.belongsToMany(Values, {
  through: Jobs__Versions_CompanyMiniTags,
  foreignKey: 'jobVersionId'
});

Values.belongsToMany(Jobs__Versions, {
  through: Jobs__Versions_CompanyMiniTags,
  foreignKey: 'miniTagId'
});

Jobs.belongsTo(Values, {
  foreignKey: 'positionRoleTypeId'
});

Jobs__Versions.belongsTo(Values, {
  foreignKey: 'positionRoleTypeId'
});

Jobs.belongsTo(Values, {
  foreignKey: 'positionSalesTypeId'
});

Jobs__Versions.belongsTo(Values, {
  foreignKey: 'positionSalesTypeId'
});

Jobs.belongsTo(Values, {
  foreignKey: 'positionRoleId'
});

Jobs__Versions.belongsTo(Values, {
  foreignKey: 'positionRoleId'
});

const Jobs_PositionClientTypes = model.Jobs_PositionClientTypes = orm.define('Jobs_PositionClientTypes', {}, {
  schema
});

Jobs.belongsToMany(Values, {
  through: Jobs_PositionClientTypes,
  foreignKey: 'jobId'
});

Values.belongsToMany(Jobs, {
  through: Jobs_PositionClientTypes,
  foreignKey: 'clientTypeId'
});

const Jobs__Versions_PositionClientTypes = model.Jobs__Versions_PositionClientTypes = orm.define('Jobs__Versions_PositionClientTypes', {}, {
  schema
});

Jobs__Versions.belongsToMany(Values, {
  through: Jobs__Versions_PositionClientTypes,
  foreignKey: 'jobVersionId'
});

Values.belongsToMany(Jobs__Versions, {
  through: Jobs__Versions_PositionClientTypes,
  foreignKey: 'clientTypeId'
});

const Jobs_PositionDepartments = model.Jobs_PositionDepartments = orm.define('Jobs_PositionDepartments', {}, {
  schema
});

Jobs.belongsToMany(Values, {
  through: Jobs_PositionDepartments,
  foreignKey: 'jobId'
});

Values.belongsToMany(Jobs, {
  through: Jobs_PositionDepartments,
  foreignKey: 'departmentId'
});

const Jobs__Versions_PositionDepartments = model.Jobs__Versions_PositionDepartments = orm.define('Jobs__Versions_PositionDepartments', {}, {
  schema
});

Jobs__Versions.belongsToMany(Values, {
  through: Jobs__Versions_PositionDepartments,
  foreignKey: 'jobVersionId'
});

Values.belongsToMany(Jobs__Versions, {
  through: Jobs__Versions_PositionDepartments,
  foreignKey: 'departmentId'
});