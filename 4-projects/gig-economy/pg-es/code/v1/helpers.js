function buildRelationTree({
    allRelations,
    contentModelId,
    node,
    childrenNodes
}) {
    allRelations.forEach(relation => {
        let descriptionList = relation.description.filter(descIt => descIt.contentModelId === contentModelId);
        descriptionList.forEach(description => {
            let isRelationWillReturn = description && description.alias && description.alias.willReturn;
            if (isRelationWillReturn && !isRelationDuplicate(relation, node)) {
                let childNode = {
                    id: relation.id,
                    type: relation.type,
                    relationTable: relation.relationTable,
                    relationTableName: relation.relationTableName,
                    isAliasFieldArray: (relation.type === 'manyToMany' && !description.aliases) || (relation.type === 'oneToMany' && !!description.foreignKey),
                    parentNode: node,
                    alias: Object.assign({
                        childrenNodes: []
                    }, description.alias),

                    // 给3个以上model的多对多关系预留
                    // aliases: description.aliases.reduce((prev, cur) => {
                    //     if (cur.willReturn) {
                    //         prev.push(Object.assign({
                    //             childrenNodes: []
                    //         }, cur));
                    //     }
                    //     return prev;
                    // }, []),
                    // relationAlias: description.relationAlias,
                };
                childrenNodes.push(childNode);
                if (childNode.alias) {
                    buildRelationTree({
                        allRelations,
                        contentModelId: childNode.alias.contentModelId,
                        node: childNode,
                        childrenNodes: childNode.alias.childrenNodes
                    });
                }

                // 给3个以上model的多对多关系预留
                // if (childNode.aliases) {
                //     childNode.aliases.forEach(it => {
                //         buildRelationTree({
                //             allRelations,
                //             contentModelId: it.contentModelId,
                //             node: childNode,
                //             childrenNodes: it.childrenNodes
                //         });
                //     });
                // }
            }
        });
    });
}

function isRelationDuplicate(relation, node) {
    // if (!relation || !node) return;
    let isCurrentDuplicate = !node.isRoot && relation.id === node.id;
    let isAncestorDuplicate = !node.isRoot && node.parentNode && isRelationDuplicate(relation, node.parentNode);
    return isCurrentDuplicate || isAncestorDuplicate;
}

async function travelRelationTree({
    node,
    config
}) {
    let isContinue;
    if (config.cbBefore) {
        isContinue = await config.cbBefore(node);
    }
    if (isContinue === false) return;
    let pList = [];
    if (node.isRoot) {
        node.childrenNodes.forEach(childNode => {
            pList.push(travelRelationTree({
                node: childNode,
                config
            }));
        });
    } else {
        if (node.alias) {
            node.alias.childrenNodes.forEach(childNode => {
                pList.push(travelRelationTree({
                    node: childNode,
                    config
                }));
            });
        }

        // 给3个以上model的多对多关系预留
        // if (node.aliases) {
        //     node.aliases.forEach(alias => {
        //         alias.childrenNodes.forEach(childNode => {
        //             pList.push(travelRelationTree({
        //                 node: childNode,
        //                 config
        //             }));
        //         });
        //     });
        // }
    }
    await Promise.all(pList);
    if (config.cbAfter) {
        await config.cbAfter(node);
    }
}

function buildMapping({
    allMappings,
    node
}) {
    let mapping = {};
    if (node.isRoot) {
        mapping.properties = Object.assign({}, allMappings[node.contentModelId]);
        node.childrenNodes.forEach(childNode => {
            let subMapping = buildMapping({
                allMappings,
                node: childNode
            });
            Object.assign(mapping.properties, subMapping);
        });
    } else {
        if (node.alias) {
            let currentMapping = Object.assign({}, allMappings[node.alias.contentModelId]);
            node.alias.childrenNodes.forEach(childNode => {
                let subMapping = buildMapping({
                    allMappings,
                    node: childNode
                });
                Object.assign(currentMapping, subMapping);
            });
            mapping[node.alias.contentModelAlias] = {};
            if (node.isAliasFieldArray) {
                mapping[node.alias.contentModelAlias].type = 'nested';
            }
            mapping[node.alias.contentModelAlias].properties = currentMapping;
        }

        // 给3个以上model的多对多关系预留
        // if (node.aliases) {
        // }
    }
    return mapping;
}

function getRandomString(length) {
    let text = '';
    let possible = 'abcdefghijklmnopqrstuvwxyz0123456789';
    length = length || 10;
    for (let i = 0; i < length; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    return text;
}

module.exports = {
    buildRelationTree,
    travelRelationTree,
    buildMapping
};