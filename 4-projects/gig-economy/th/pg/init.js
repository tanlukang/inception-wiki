const {
  Sequelize,
  DataTypes
} = require('sequelize');

const orm = new Sequelize('gig', 'postgres', 'postgres', {
  host: 'localhost',
  port: '5432',
  dialect: 'postgres',
  define: {
    // freezeTableName: true
  },
});

module.exports = orm;