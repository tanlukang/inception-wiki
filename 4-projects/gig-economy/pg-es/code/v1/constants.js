/*
  models
    Talents = 1
    Values = 2
    Industries = 3
    Experiences = 4
    Organizations = 5
    Jobs = 6
*/

const allRelations = require('./allRelations.json');

const allMappings = {};

allMappings[1] = {
    id: {
        type: 'integer'
    },
    firstName: {
        type: 'text'
    },
    lastName: {
        type: 'text'
    }
};

allMappings[2] = {
    id: {
        type: 'integer'
    },
    name: {
        type: 'text'
    },
    order: {
        type: 'integer'
    },
};

allMappings[3] = {
    id: {
        type: 'integer'
    },
    name: {
        type: 'text'
    },
    order: {
        type: 'integer'
    },
};

allMappings[4] = {
    id: {
        type: 'integer'
    },
    expTitle: {
        type: 'text'
    },
    expCurrent: {
        type: 'boolean'
    }
};

allMappings[5] = {
    id: {
        type: 'integer'
    },
    name: {
        type: 'text'
    },
    url: {
        type: 'text'
    }
};

allMappings[6] = {
    id: {
        type: 'integer'
    },
    positionTitle: {
        type: 'text'
    }
};

module.exports = {
    allRelations,
    allMappings
};