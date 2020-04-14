const constants = require('./constants');
const helpers = require('./helpers');
const fs = require('fs');

(async () => {
    // let allRelations = require('./relations.json');
    // let fixRelations = [];
    // allRelations.forEach(it => {
    //     it.description.forEach(subIt => {
    //         if (subIt.contentModelId === 2 || subIt.contentModelId === 3) {
    //             subIt.alias.willReturn = false;
    //         }
    //     });
    //     if (it.id === 66) {
    //         it.description[0].alias.willReturn = false;
    //     }
    //     if (it.id === 67) {
    //         it.description[1].alias.willReturn = false;
    //     }
    //     if (it.id === 63) {
    //         it.description[0].alias.willReturn = false;
    //         it.description[1].alias.willReturn = false;
    //     }
    //     fixRelations.push(it);
    // });
    // fs.writeFileSync(`./result/allRelations.json`, JSON.stringify(fixRelations, null, '\t'));

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

        // delete parentNode for print tree
        await helpers.travelRelationTree({
            node: relationTree,
            config: {
                cbAfter: (node) => {
                    delete node.parentNode
                }
            }
        });
        // console.log(relationTree);
        fs.writeFileSync(`./result/relationTree-model-${contentModelId}.json`, JSON.stringify(relationTree, null, '\t'));
    });
})();