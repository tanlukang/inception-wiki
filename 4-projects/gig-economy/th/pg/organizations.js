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
  TEXT,
  JSONB,
  INTEGER,
  BOOLEAN,
  TIME,
  ARRAY,
} = DataTypes;

let mainFields = {
  name: TEXT,
  url: TEXT,
  location: JSONB,
  revenueHistory: ARRAY(JSONB),
  employeeCountHistory: ARRAY(JSONB),
  culture: TEXT,
  hasMentorship: BOOLEAN,
  mentorshipDesc: TEXT,
  hasEducationReimbursement: BOOLEAN,
  reimbursementDesc: TEXT,
  admiredCompanies: ARRAY(BOOLEAN),
  competitorCompanies: ARRAY(BOOLEAN),
  similarCompanies: ARRAY(BOOLEAN),
  stockExchange: TEXT,
  tickerSymbol: TEXT,
  description: TEXT,
  keywords: ARRAY(TEXT),
  publicPrivate: TEXT,
  salesCulture: TEXT,
  salesLeadershipOverview: TEXT,
  salesTrainingProvided: TEXT,
  salesToolsUsed: ARRAY(TEXT),
  salesTeamVideo: TEXT,

  _state: TEXT,
};

const Organizations = model.Organizations = orm.define('Organizations', {
  ...mainFields,

  _deleted: BOOLEAN,
  _syncStatus: TEXT
}, {
  schema
});

const Organizations__Versions = model.Organizations__Versions = orm.define('Organizations__Versions', {
  ...mainFields
}, {
  schema
});


Organizations.hasMany(Organizations__Versions, {
  foreignKey: '_entityId',
  // constraints: false
});

Organizations__Versions.hasMany(Organizations, {
  foreignKey: '_versionId',
  constraints: false
});

// Organizations.belongsTo(Organizations__Versions, {
//   foreignKey: '_versionId',
//   constraints: false
// });

Organizations__Versions.hasMany(Organizations__Versions, {
  foreignKey: '_previousVersionId',
  // constraints: false
});


Organizations.belongsTo(Values, {
  foreignKey: 'organizationTypeId'
});

Organizations__Versions.belongsTo(Values, {
  foreignKey: 'organizationTypeId'
});

const Organizations_Industries = model.Organizations_Industries = orm.define('Organizations_Industries', {}, {
  schema
});

Organizations.belongsToMany(Industries, {
  through: Organizations_Industries,
  foreignKey: 'organizationId'
});

Industries.belongsToMany(Organizations, {
  through: Organizations_Industries,
  foreignKey: 'industryId'
});

const Organizations__Versions_Industries = model.Organizations__Versions_Industries = orm.define('Organizations__Versions_Industries', {}, {
  schema
});

Organizations__Versions.belongsToMany(Industries, {
  through: Organizations__Versions_Industries,
  foreignKey: 'organizationVersionId'
});

Industries.belongsToMany(Organizations__Versions, {
  through: Organizations__Versions_Industries,
  foreignKey: 'industryId'
});

Organizations.belongsTo(Values, {
  foreignKey: 'companyTypeId'
});

Organizations__Versions.belongsTo(Values, {
  foreignKey: 'companyTypeId'
});

const Organizations_MiniTags = model.Organizations_MiniTags = orm.define('Organizations_MiniTags', {}, {
  schema
});

Organizations.belongsToMany(Values, {
  through: Organizations_MiniTags,
  foreignKey: 'organizationId'
});

Values.belongsToMany(Organizations, {
  through: Organizations_MiniTags,
  foreignKey: 'miniTagId'
});

const Organizations__Versions_MiniTags = model.Organizations__Versions_MiniTags = orm.define('Organizations__Versions_MiniTags', {}, {
  schema
});

Organizations__Versions.belongsToMany(Values, {
  through: Organizations__Versions_MiniTags,
  foreignKey: 'organizationVersionId'
});

Values.belongsToMany(Organizations__Versions, {
  through: Organizations__Versions_MiniTags,
  foreignKey: 'miniTagId'
});