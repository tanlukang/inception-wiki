const {
  Sequelize,
  DataTypes
} = require('sequelize');
const orm = require('./init');
const gConfig = require('./config');
const modelTalents = require('./talents');
const modelExperiences = require('./experiences');
const modelOrganizations = require('./organizations');
const modelJobs = require('./jobs');
const {
  Values,
} = require('./values');
const {
  Industries,
} = require('./industries');

(async () => {
  await connect();
  await sync();
})()

async function connect() {
  try {
    await orm.authenticate();
    console.log('Connection has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
}

async function sync() {
  let syncConfig = {
    force: true
  };
  let pList1 = [
    Values.sync(syncConfig),
    Industries.sync(syncConfig)
  ];
  await Promise.all(pList1);

  let pList2 = [
    modelTalents.Talents.sync(syncConfig),
    modelOrganizations.Organizations.sync(syncConfig)
  ];
  await Promise.all(pList2);

  await modelJobs.Jobs.sync(syncConfig);

  if (gConfig.isVersioning) {
    let pList3 = [
      modelTalents.Talents__Versions.sync(syncConfig),
      modelOrganizations.Organizations__Versions.sync(syncConfig),
      modelJobs.Jobs__Versions.sync(syncConfig),
    ];
    await Promise.all(pList3);
  }

  await modelExperiences.Experiences.sync(syncConfig);
  if (gConfig.isVersioning) {
    await modelExperiences.Experiences__Versions.sync(syncConfig);
  }

  let talentsRelationList = [];
  Object.keys(modelTalents).forEach(it => {
    if (!~['Talents', 'Talents__Versions'].indexOf(it)) {
      if (gConfig.isVersioning || !~it.indexOf('__Versions')) {
        talentsRelationList.push(modelTalents[it].sync(syncConfig));
      }
    }
  });

  let experiencesRelationList = [];
  Object.keys(modelExperiences).forEach(it => {
    if (!~['Experiences', 'Experiences__Versions'].indexOf(it)) {
      if (gConfig.isVersioning || !~it.indexOf('__Versions')) {
        experiencesRelationList.push(modelExperiences[it].sync(syncConfig));
      }
    }
  });

  let organizationsRelationList = [];
  Object.keys(modelOrganizations).forEach(it => {
    if (!~['Organizations', 'Organizations__Versions'].indexOf(it)) {
      if (gConfig.isVersioning || !~it.indexOf('__Versions')) {
        organizationsRelationList.push(modelOrganizations[it].sync(syncConfig));
      }
    }
  });

  let jobsRelationList = [];
  Object.keys(modelJobs).forEach(it => {
    if (!~['Jobs', 'Jobs__Versions'].indexOf(it)) {
      if (gConfig.isVersioning || !~it.indexOf('__Versions')) {
        jobsRelationList.push(modelJobs[it].sync(syncConfig));
      }
    }
  });

  let pList4 = [].concat(talentsRelationList, experiencesRelationList, organizationsRelationList, jobsRelationList);
  await Promise.all(pList4);
}