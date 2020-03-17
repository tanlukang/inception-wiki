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
  Talents,
  Talents__Versions
} = require('./talents');
const {
  Organizations
} = require('./organizations');

const {
  TEXT,
  JSONB,
  INTEGER,
  BOOLEAN,
  TIME,
  DATE,
  ARRAY,
} = DataTypes;

let mainFields = {
  expCurrent: BOOLEAN,
  expTitle: TEXT,
  expStart: DATE,
  expEnd: DATE,
  expBase: INTEGER,
  expOte: INTEGER,
  expProducts: ARRAY(TEXT),
  expTerritories: ARRAY(TEXT),
  expRevenue: INTEGER,
  expSize: INTEGER,
  expQuotas: ARRAY(JSONB),
  expAwards: ARRAY(JSONB),
  otherSkills: ARRAY(TEXT),
  references: ARRAY(JSONB),

  _state: TEXT,
};

const Experiences = model.Experiences = orm.define('Experiences', {
  ...mainFields,

  _deleted: BOOLEAN,
  _syncStatus: TEXT
}, {
  schema
});

const Experiences__Versions = model.Experiences__Versions = orm.define('Experiences__Versions', {
  ...mainFields
}, {
  schema
});


Experiences.hasMany(Experiences__Versions, {
  foreignKey: '_entityId',
  // constraints: false
});

Experiences__Versions.hasMany(Experiences, {
  foreignKey: '_versionId',
  constraints: false
});

// Experiences.belongsTo(Experiences__Versions, {
//   foreignKey: '_versionId',
//   constraints: false
// });

Experiences__Versions.hasMany(Experiences__Versions, {
  foreignKey: '_previousVersionId',
  // constraints: false
});


Experiences.belongsTo(Values, {
  foreignKey: 'expTypeId'
});

Experiences__Versions.belongsTo(Values, {
  foreignKey: 'expTypeId'
});

Experiences.belongsTo(Talents, {
  foreignKey: 'talentId'
});

Experiences__Versions.belongsTo(Talents, {
  foreignKey: 'talentId'
});

Experiences.belongsTo(Organizations, {
  foreignKey: 'organizationId'
});

Experiences__Versions.belongsTo(Organizations, {
  foreignKey: 'organizationId'
});

Experiences.belongsTo(Values, {
  foreignKey: 'roleId'
});

Experiences__Versions.belongsTo(Values, {
  foreignKey: 'roleId'
});

Experiences.belongsTo(Values, {
  foreignKey: 'expSalesTypeId'
});

Experiences__Versions.belongsTo(Values, {
  foreignKey: 'expSalesTypeId'
});

const Experiences_Industries = model.Experiences_Industries = orm.define('Experiences_Industries', {}, {
  schema
});

Experiences.belongsToMany(Industries, {
  through: Experiences_Industries,
  foreignKey: 'experienceId'
});

Industries.belongsToMany(Experiences, {
  through: Experiences_Industries,
  foreignKey: 'industryId'
});

const Experiences__Versions_Industries = model.Experiences__Versions_Industries = orm.define('Experiences__Versions_Industries', {}, {
  schema
});

Experiences__Versions.belongsToMany(Industries, {
  through: Experiences__Versions_Industries,
  foreignKey: 'experienceVersionId'
});

Industries.belongsToMany(Experiences__Versions, {
  through: Experiences__Versions_Industries,
  foreignKey: 'industryId'
});

const Talents__Versions_Experiences__Versions = model.Talents__Versions_Experiences__Versions = orm.define('Talents__Versions_Experiences__Versions', {}, {
  schema
});

Experiences__Versions.belongsToMany(Talents__Versions, {
  through: Talents__Versions_Experiences__Versions,
  foreignKey: 'experienceVersionId'
});

Talents__Versions.belongsToMany(Experiences__Versions, {
  through: Talents__Versions_Experiences__Versions,
  foreignKey: 'talentVersionId'
});