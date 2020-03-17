const model = {};
module.exports = model;

const {
  Sequelize,
  DataTypes
} = require('sequelize');
const orm = require('./init');
const { schema } = require('./config');

const {
  TEXT,
  JSONB,
  INTEGER,
  BOOLEAN,
  ARRAY
} = DataTypes;

let mainFields = {
  name: TEXT,
  order: INTEGER,

  // _state: TEXT,
};

const Industries = model.Industries = orm.define('Industries', {
  ...mainFields,

  // _deleted: BOOLEAN,
  // _syncStatus: TEXT
}, {
  schema
});

Industries.hasMany(Industries, {
  foreignKey: 'parentId',
  // constraints: false
});