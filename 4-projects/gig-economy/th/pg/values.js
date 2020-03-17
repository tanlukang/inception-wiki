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
  TEXT,
  JSONB,
  INTEGER,
  BOOLEAN,
  ARRAY
} = DataTypes;

let mainFields = {
  name: TEXT,
  category: TEXT,
  order: INTEGER,

  // _state: TEXT,
};

const Values = model.Values = orm.define('Values', {
  ...mainFields,

  // _deleted: BOOLEAN,
  // _syncStatus: TEXT
}, {
  schema
});

Values.hasMany(Values, {
  foreignKey: 'parentId',
  // constraints: false
});