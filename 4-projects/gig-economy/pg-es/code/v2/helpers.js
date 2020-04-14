function buildRelationTree({
    allRelations,
    contentModelId
}) {
    let treeList = [{
        nodeId: getRandomString(),
        index: 0,
        contentModelId,
        isRoot: true,
        childrenNodesIndexes: []
    }];
    let root = treeList[0];
    buildRelationTreeList({
        allRelations,
        contentModelId: root.contentModelId,
        treeList,
        node: root,
        childrenNodesIndexes: root.childrenNodesIndexes
    });

    let tree = Object.assign({
        childrenNodes: []
    }, root);
    convertTreeListToTree({
        treeList,
        node: tree,
        childrenNodesIndexes: tree.childrenNodesIndexes,
        childrenNodes: tree.childrenNodes
    });

    let dependencies = [];
    calDependenciesByTreeList({
        treeList,
        index: 0,
        dependencies
    });

    return {
        treeList,
        tree,
        dependencies,
        dependents: []
    };
}

function buildRelationTreeList({
    allRelations,
    contentModelId,
    treeList,
    node,
    childrenNodesIndexes
}) {
    allRelations.forEach(relation => {
        let descriptionList = relation.description.filter(descIt => descIt.contentModelId === contentModelId);
        descriptionList.forEach(description => {
            let isRelationWillReturn = description && description.alias && description.alias.willReturn;
            if (isRelationWillReturn && !isRelationDuplicate({
                    treeList,
                    relation,
                    node
                })) {
                let childNode = {
                    nodeId: getRandomString(),
                    index: treeList.length,
                    id: relation.id,
                    type: relation.type,
                    description: relation.description,
                    relationTable: relation.relationTable,
                    relationTableName: relation.relationTableName,
                    isAliasFieldArray: (relation.type === 'manyToMany' && !description.aliases) || (relation.type === 'oneToMany' && !!description.foreignKey),
                    parentNodeIndex: node.index,
                    parentNodeId: node.nodeId
                };
                treeList.push(childNode);
                childrenNodesIndexes.push(childNode.index);
                if (description.alias) {
                    childNode.alias = Object.assign({
                        childrenNodesIndexes: []
                    }, description.alias);
                }
                if (childNode.alias) {
                    buildRelationTreeList({
                        allRelations,
                        contentModelId: childNode.alias.contentModelId,
                        treeList,
                        node: childNode,
                        childrenNodesIndexes: childNode.alias.childrenNodesIndexes
                    });
                }
            }
        });
    });
}

function isRelationDuplicate({
    treeList,
    relation,
    node
}) {
    if (!relation || !node) return;
    let isCurrentDuplicate = !node.isRoot && relation.id === node.id;
    let isAncestorDuplicate = !node.isRoot && node.parentNodeIndex !== undefined && isRelationDuplicate({
        treeList,
        relation,
        node: treeList[node.parentNodeIndex]
    });
    return isCurrentDuplicate || isAncestorDuplicate;
}

function getRandomString(length) {
    let text = '';
    let possible = 'abcdefghijklmnopqrstuvwxyz0123456789';
    length = length || 10;
    for (let i = 0; i < length; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    return text;
}

// will refactor by travel function
function convertTreeListToTree({
    treeList,
    node,
    childrenNodesIndexes,
    childrenNodes
}) {
    (childrenNodesIndexes || []).forEach(index => {
        if (treeList[index]) {
            let childNode = Object.assign({}, treeList[index]);
            childrenNodes.push(childNode);
            // childNode.parentNode = node;
            if (childNode.alias) {
                childNode.alias.childrenNodes = [];
                convertTreeListToTree({
                    treeList,
                    node: childNode,
                    childrenNodesIndexes: childNode.alias.childrenNodesIndexes,
                    childrenNodes: childNode.alias.childrenNodes
                });
            }
        }
    });
}

// will refactor by travel function
function calDependenciesByTreeList({
    treeList,
    index,
    dependencies
}) {
    let node = treeList[index];
    if (!node) return;

    let childrenNodesIndexes;
    if (node.isRoot) {
        childrenNodesIndexes = node.childrenNodesIndexes;
    } else if (node.alias) {
        childrenNodesIndexes = node.alias.childrenNodesIndexes;
        if (!~dependencies.indexOf(node.alias.contentModelId)) {
            dependencies.push(node.alias.contentModelId);
        }
    }

    (childrenNodesIndexes || []).forEach(index => {
        calDependenciesByTreeList({
            treeList,
            index,
            dependencies
        });
    });
}

async function travelRelationByTreeList({
    treeList,
    index,
    config
}) {
    let node = treeList[index];
    if (!node) return;

    let isContinue;
    if (config.cbBefore) {
        isContinue = await config.cbBefore(node);
    }
    if (isContinue === false) return;

    let pList = [];
    let childrenNodesIndexes;
    if (node.isRoot) {
        childrenNodesIndexes = node.childrenNodesIndexes;
    } else if (node.alias) {
        childrenNodesIndexes = node.alias.childrenNodesIndexes;
    }
    (childrenNodesIndexes || []).forEach(index => {
        pList.push(travelRelationByTreeList({
            treeList,
            index,
            config
        }));
    });

    await Promise.all(pList);
    if (config.cbAfter) {
        await config.cbAfter(node);
    }
}

async function travelRelationByTree({
    node,
    config
}) {
    if (!node) return;
    let isContinue;
    if (config.cbBefore) {
        isContinue = await config.cbBefore(node);
    }
    if (isContinue === false) return;

    let pList = [];
    let childrenNodes;
    if (node.isRoot) {
        childrenNodes = node.childrenNodes;
    } else if (node.alias) {
        childrenNodes = node.alias.childrenNodes
    }
    (childrenNodes || []).forEach(childNode => {
        pList.push(travelRelationByTree({
            node: childNode,
            config
        }));
    });
    await Promise.all(pList);

    if (config.cbAfter) {
        await config.cbAfter(node);
    }
}

// will refactor by travel function
function buildIndexMappingByTreeList({
    allMappings,
    treeList,
    index
}) {
    let node = treeList[index];
    if (!node) return;
    let mapping = {};
    if (node.isRoot) {
        mapping.properties = Object.assign({}, allMappings[node.contentModelId]);
        (node.childrenNodesIndexes || []).forEach(index => {
            let subMapping = buildIndexMappingByTreeList({
                allMappings,
                treeList,
                index
            });
            Object.assign(mapping.properties, subMapping);
        });
    } else if (node.alias) {
        let currentMapping = Object.assign({}, allMappings[node.alias.contentModelId]);
        (node.alias.childrenNodesIndexes || []).forEach(index => {
            let subMapping = buildIndexMappingByTreeList({
                allMappings,
                treeList,
                index
            });
            Object.assign(currentMapping, subMapping);
        });
        mapping[node.alias.contentModelAlias] = {};
        if (node.isAliasFieldArray) {
            mapping[node.alias.contentModelAlias].type = 'nested';
        }
        mapping[node.alias.contentModelAlias].properties = currentMapping;
    }
    return mapping;
}

// will refactor by travel function
function buildIndexMappingByTree({
    allMappings,
    node
}) {
    if (!node) return;
    let mapping = {};
    if (node.isRoot) {
        mapping.properties = Object.assign({}, allMappings[node.contentModelId]);
        (node.childrenNodes || []).forEach(childNode => {
            let subMapping = buildIndexMappingByTree({
                allMappings,
                node: childNode
            });
            Object.assign(mapping.properties, subMapping);
        });
    } else if (node.alias) {
        let currentMapping = Object.assign({}, allMappings[node.alias.contentModelId]);
        (node.alias.childrenNodes || []).forEach(childNode => {
            let subMapping = buildIndexMappingByTree({
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
    return mapping;
}

module.exports = {
    buildRelationTree,
    travelRelationByTreeList,
    travelRelationByTree,
    buildIndexMappingByTreeList,
    buildIndexMappingByTree,
};