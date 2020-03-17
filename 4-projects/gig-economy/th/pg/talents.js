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
  firstName: TEXT,
  lastName: TEXT,
  middleName: TEXT,
  email: TEXT,
  phone: TEXT,
  location: JSONB,
  socialLink: JSONB,
  profileImg: TEXT,
  militaryBranch: TEXT,
  bio: TEXT,
  resumeLink: TEXT,
  interestBaseMin: INTEGER,
  interestBaseMax: INTEGER,
  interestOteMin: INTEGER,
  interestOteMax: INTEGER,
  interestLocs: ARRAY(JSONB),
  interestRelocation: BOOLEAN,
  interestRemote: BOOLEAN,
  productAndService: ARRAY(TEXT),
  interestProducts: ARRAY(TEXT),
  interestTravel: INTEGER,
  interestDesc: TEXT,
  interestEquity: BOOLEAN,
  interestSalesCycleMin: INTEGER,
  interestSalesCycleMax: INTEGER,
  workSalesYears: INTEGER,
  workTools: ARRAY(TEXT),
  workMethods: ARRAY(TEXT),
  workInternational: BOOLEAN,
  workInternationalList: ARRAY(JSONB),
  workProductService: ARRAY(JSONB),
  workDealSize: ARRAY(JSONB),
  workSalesCycle: ARRAY(JSONB),

  _state: TEXT,
};

const Talents = model.Talents = orm.define('Talents', {
  ...mainFields,

  _deleted: BOOLEAN,
  _syncStatus: TEXT
}, {
  schema
});

const Talents__Versions = model.Talents__Versions = orm.define('Talents__Versions', {
  ...mainFields
}, {
  schema
});


Talents.hasMany(Talents__Versions, {
  foreignKey: '_entityId',
  // constraints: false
});

Talents__Versions.hasMany(Talents, {
  foreignKey: '_versionId',
  constraints: false
});

// Talents.belongsTo(Talents__Versions, {
//   foreignKey: '_versionId',
//   constraints: false
// });

Talents__Versions.hasMany(Talents__Versions, {
  foreignKey: '_previousVersionId',
  // constraints: false
});


Talents.belongsTo(Values, {
  foreignKey: 'militarySrvId'
});

Talents__Versions.belongsTo(Values, {
  foreignKey: 'militarySrvId'
});

Talents.belongsTo(Values, {
  foreignKey: 'interestStageId'
});

Talents__Versions.belongsTo(Values, {
  foreignKey: 'interestStageId'
});

Talents.belongsTo(Values, {
  foreignKey: 'preferredRoleLevelId'
});

Talents__Versions.belongsTo(Values, {
  foreignKey: 'preferredRoleLevelId'
});

const Talents_InterestRoles = model.Talents_InterestRoles = orm.define('Talents_InterestRoles', {}, {
  schema
});

Talents.belongsToMany(Values, {
  through: Talents_InterestRoles,
  foreignKey: 'talentId'
});

Values.belongsToMany(Talents, {
  through: Talents_InterestRoles,
  foreignKey: 'roleId'
});

const Talents__Versions_InterestRoles = model.Talents__Versions_InterestRoles = orm.define('Talents__Versions_InterestRoles', {}, {
  schema
});

Talents__Versions.belongsToMany(Values, {
  through: Talents__Versions_InterestRoles,
  foreignKey: 'talentVersionId'
});

Values.belongsToMany(Talents__Versions, {
  through: Talents__Versions_InterestRoles,
  foreignKey: 'roleId'
});

const Talents_InterestIndustries = model.Talents_InterestIndustries = orm.define('Talents_InterestIndustries', {}, {
  schema
});

Talents.belongsToMany(Industries, {
  through: Talents_InterestIndustries,
  foreignKey: 'talentId'
});

Industries.belongsToMany(Talents, {
  through: Talents_InterestIndustries,
  foreignKey: 'industryId'
});

const Talents__Versions_InterestIndustries = model.Talents__Versions_InterestIndustries = orm.define('Talents__Versions_InterestIndustries', {}, {
  schema
});

Talents__Versions.belongsToMany(Industries, {
  through: Talents__Versions_InterestIndustries,
  foreignKey: 'talentVersionId'
});

Industries.belongsToMany(Talents__Versions, {
  through: Talents__Versions_InterestIndustries,
  foreignKey: 'industryId'
});

const Talents_InterestClientTypes = model.Talents_InterestClientTypes = orm.define('Talents_InterestClientTypes', {}, {
  schema
});

Talents.belongsToMany(Values, {
  through: Talents_InterestClientTypes,
  foreignKey: 'talentId'
});

Values.belongsToMany(Talents, {
  through: Talents_InterestClientTypes,
  foreignKey: 'clientTypeId'
});

const Talents__Versions_InterestClientTypes = model.Talents__Versions_InterestClientTypes = orm.define('Talents__Versions_InterestClientTypes', {}, {
  schema
});

Talents__Versions.belongsToMany(Values, {
  through: Talents__Versions_InterestClientTypes,
  foreignKey: 'talentVersionId'
});

Values.belongsToMany(Talents__Versions, {
  through: Talents__Versions_InterestClientTypes,
  foreignKey: 'clientTypeId'
});

const Talents_InterestSalesTypes = model.Talents_InterestSalesTypes = orm.define('Talents_InterestSalesTypes', {}, {
  schema
});

Talents.belongsToMany(Values, {
  through: Talents_InterestSalesTypes,
  foreignKey: 'talentId'
});

Values.belongsToMany(Talents, {
  through: Talents_InterestSalesTypes,
  foreignKey: 'salesTypeId'
});

const Talents__Versions_InterestSalesTypes = model.Talents__Versions_InterestSalesTypes = orm.define('Talents__Versions_InterestSalesTypes', {}, {
  schema
});

Talents__Versions.belongsToMany(Values, {
  through: Talents__Versions_InterestSalesTypes,
  foreignKey: 'talentVersionId'
});

Values.belongsToMany(Talents__Versions, {
  through: Talents__Versions_InterestSalesTypes,
  foreignKey: 'salesTypeId'
});

const Talents_WorkIndustries = model.Talents_WorkIndustries = orm.define('Talents_WorkIndustries', {
  years: INTEGER
}, {
  schema
});

Talents.belongsToMany(Industries, {
  through: Talents_WorkIndustries,
  foreignKey: 'talentId'
});

Industries.belongsToMany(Talents, {
  through: Talents_WorkIndustries,
  foreignKey: 'industryId'
});

const Talents__Versions_WorkIndustries = model.Talents__Versions_WorkIndustries = orm.define('Talents__Versions_WorkIndustries', {
  years: INTEGER
}, {
  schema
});

Talents__Versions.belongsToMany(Industries, {
  through: Talents__Versions_WorkIndustries,
  foreignKey: 'talentVersionId'
});

Industries.belongsToMany(Talents__Versions, {
  through: Talents__Versions_WorkIndustries,
  foreignKey: 'industryId'
});

const Talents_WorkRoles = model.Talents_WorkRoles = orm.define('Talents_WorkRoles', {
  years: INTEGER
}, {
  schema
});

Talents.belongsToMany(Values, {
  through: Talents_WorkRoles,
  foreignKey: 'talentId'
});

Values.belongsToMany(Talents, {
  through: Talents_WorkRoles,
  foreignKey: 'roleId'
});

const Talents__Versions_WorkRoles = model.Talents__Versions_WorkRoles = orm.define('Talents__Versions_WorkRoles', {
  years: INTEGER
}, {
  schema
});

Talents__Versions.belongsToMany(Values, {
  through: Talents__Versions_WorkRoles,
  foreignKey: 'talentVersionId'
});

Values.belongsToMany(Talents__Versions, {
  through: Talents__Versions_WorkRoles,
  foreignKey: 'roleId'
});

const Talents_WorkRoleLevels = model.Talents_WorkRoleLevels = orm.define('Talents_WorkRoleLevels', {
  years: INTEGER
}, {
  schema
});

Talents.belongsToMany(Values, {
  through: Talents_WorkRoleLevels,
  foreignKey: 'talentId'
});

Values.belongsToMany(Talents, {
  through: Talents_WorkRoleLevels,
  foreignKey: 'roleLevelId'
});

const Talents__Versions_WorkRoleLevels = model.Talents__Versions_WorkRoleLevels = orm.define('Talents__Versions_WorkRoleLevels', {
  years: INTEGER
}, {
  schema
});

Talents__Versions.belongsToMany(Values, {
  through: Talents__Versions_WorkRoleLevels,
  foreignKey: 'talentVersionId'
});

Values.belongsToMany(Talents__Versions, {
  through: Talents__Versions_WorkRoleLevels,
  foreignKey: 'roleLevelId'
});

const Talents_WorkSalesType = model.Talents_WorkSalesType = orm.define('Talents_WorkSalesType', {
  years: INTEGER
}, {
  schema
});

Talents.belongsToMany(Values, {
  through: Talents_WorkSalesType,
  foreignKey: 'talentId'
});

Values.belongsToMany(Talents, {
  through: Talents_WorkSalesType,
  foreignKey: 'salesTypeId'
});

const Talents__Versions_WorkSalesType = model.Talents__Versions_WorkSalesType = orm.define('Talents__Versions_WorkSalesType', {
  years: INTEGER
}, {
  schema
});

Talents__Versions.belongsToMany(Values, {
  through: Talents__Versions_WorkSalesType,
  foreignKey: 'talentVersionId'
});

Values.belongsToMany(Talents__Versions, {
  through: Talents__Versions_WorkSalesType,
  foreignKey: 'salesTypeId'
});

const Talents_WorkClientType = model.Talents_WorkClientType = orm.define('Talents_WorkClientType', {
  years: INTEGER
}, {
  schema
});

Talents.belongsToMany(Values, {
  through: Talents_WorkClientType,
  foreignKey: 'talentId'
});

Values.belongsToMany(Talents, {
  through: Talents_WorkClientType,
  foreignKey: 'clientTypeId'
});

const Talents__Versions_WorkClientType = model.Talents__Versions_WorkClientType = orm.define('Talents__Versions_WorkClientType', {
  years: INTEGER
}, {
  schema
});

Talents__Versions.belongsToMany(Values, {
  through: Talents__Versions_WorkClientType,
  foreignKey: 'talentVersionId'
});

Values.belongsToMany(Talents__Versions, {
  through: Talents__Versions_WorkClientType,
  foreignKey: 'clientTypeId'
});