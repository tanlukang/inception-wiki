const constants = require('./constants');
const helpers = require('./helpers');
const fs = require('fs');

(async () => {
    const allRelations = constants.allRelations;

    [1, 5, 6].forEach(async (contentModelId) => {
        let relationTree = helpers.buildRelationTree({
            allRelations,
            contentModelId
        });
        let mapping = helpers.buildIndexMappingByTreeList({
            allMappings: constants.allMappings,
            treeList: relationTree.treeList,
            index: 0
        });
        // let mapping = helpers.buildIndexMappingByTree({
        //     allMappings: constants.allMappings,
        //     node: relationTree.tree
        // });
        // console.log(mapping);
        fs.writeFileSync(`./result/indexMappings-model-${contentModelId}.json`, JSON.stringify(mapping, null, '\t'));
    });
})();