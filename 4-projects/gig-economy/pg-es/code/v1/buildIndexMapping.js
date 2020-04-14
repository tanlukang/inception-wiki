const constants = require('./constants');
const helpers = require('./helpers');
const fs = require('fs');

(async () => {
    const allRelations = constants.allRelations;

    [1, 5, 6].forEach(async (contentModelId) => {
        let relationTree = {
            contentModelId,
            isRoot: true,
            childrenNodes: []
        };
        helpers.buildRelationTree({
            allRelations,
            contentModelId,
            node: relationTree,
            childrenNodes: relationTree.childrenNodes
        });
        let mapping = helpers.buildMapping({
            allMappings: constants.allMappings,
            node: relationTree
        });
        // console.log(mapping);
        fs.writeFileSync(`./result/indexMappings-model-${contentModelId}.json`, JSON.stringify(mapping, null, '\t'));
    });
})();