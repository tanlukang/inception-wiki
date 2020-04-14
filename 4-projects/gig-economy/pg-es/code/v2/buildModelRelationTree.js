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
        // console.log(relationTree);
        fs.writeFileSync(`./result/relationTree-model-${contentModelId}.json`, JSON.stringify(relationTree, null, '\t'));
        // helpers.travelRelationByTreeList({
        //     treeList: relationTree.treeList,
        //     index: 0,
        //     config: {
        //         cbBefore: (node) => {
        //             console.log(node.index);
        //         }
        //     }
        // });
        // helpers.travelRelationByTree({
        //     node: relationTree.tree,
        //     config: {
        //         cbBefore: (node) => {
        //             console.log(node.index);
        //         }
        //     }
        // });
    });
})();