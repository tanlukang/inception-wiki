const {
    Client
} = require('@elastic/elasticsearch');
const faker = require('faker');
const fs = require('fs');

const client = new Client({
    node: 'http://localhost:9200',
    // node: 'https://search-th-sales-staging-t54k4myj3hyg344obv2ozj5vo4.us-east-1.es.amazonaws.com/'
});

const index = {
    talents: 'th-talents-20200221',
    experiences: 'th-experiences-20200221',
    organizations: 'th-organizations-20200221',

    // talents: 'th-talents',
    // experiences: 'th-experiences',
    // organizations: 'th-organizations'
};

(async () => {
    await Promise.all([
        // createTalentsIndex(),
        // createExperiencesIndex(),
        // createOrganizationsIndex()
    ]);

    await Promise.all([
        // deleteTalentsIndex(),
        // deleteExperiencesIndex(),
        // deleteOrganizationsIndex()
    ]);

    await Promise.all([
        getTalentsIndex(),
        getExperiencesIndex(),
        getOrganizationsIndex()
    ]);

    await Promise.all([
        // insertTalentsIndex(),
        // insertExperiencesIndex(),
        // insertOrganizationsIndex()
    ]);

    await Promise.all([
        // searchTalentsIndex(),
        // searchExperiencesIndex(),
        // searchOrganizationsIndex()
    ]);

    await Promise.all([
        // clearTalentsIndex(),
        // clearExperiencesIndex(),
        // clearOrganizationsIndex()
    ]);
})();

async function createTalentsIndex() {
    // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_indices_create
    let field = getTalentsAllField();
    fs.writeFileSync(`./thes/field-talents.json`, JSON.stringify(field, null, '\t'));
    let result = await client.indices.create({
        index: index.talents,
        body: {
            aliases: {
                'th-talents': {},
            },
            settings: getIndexSetting(),
            mappings: {
                properties: field
            }
        }
    });
    console.log('createTalentsIndex', JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/createTalentsIndex.json`, JSON.stringify(result.body, null, '\t'));
}

async function createExperiencesIndex() {
    let field = getExperiencesAllField();
    fs.writeFileSync(`./thes/field-experiences.json`, JSON.stringify(field, null, '\t'));
    let result = await client.indices.create({
        index: index.experiences,
        body: {
            aliases: {
                'th-experiences': {},
            },
            settings: getIndexSetting(),
            mappings: {
                properties: field
            }
        }
    });
    console.log('createExperiencesIndex', JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/createExperiencesIndex.json`, JSON.stringify(result.body, null, '\t'));
}

async function createOrganizationsIndex() {
    let field = getOrganizationsAllField();
    fs.writeFileSync(`./thes/field-organizations.json`, JSON.stringify(field, null, '\t'));
    let result = await client.indices.create({
        index: index.organizations,
        body: {
            aliases: {
                'th-organizations': {},
            },
            settings: getIndexSetting(),
            mappings: {
                properties: field
            }
        }
    });
    console.log('createOrganizationsIndex', JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/createOrganizationsIndex.json`, JSON.stringify(result.body, null, '\t'));
}

function getIndexSetting() {
    return {
        "number_of_shards": 1,
        "analysis": {
            "analyzer": {
                "ngram_analyzer": {
                    "filter": ["lowercase", "asciifolding", "ngram_filter"],
                    "tokenizer": "standard",
                    "type": "custom"
                }
            },
            "filter": {
                "ngram_filter": {
                    "max_gram": "9",
                    "min_gram": "2",
                    "token_chars": ["letter", "digit", "punctuation", "symbol"],
                    "type": "ngram"
                }
            }
        },
        "max_ngram_diff": "8",
        "max_shingle_diff": "8"
    };
}

function getTextMapping() {
    return {
        "analyzer": "standard",
        "fields": {
            "completion": {
                "type": "completion"
            },
            "english": {
                "analyzer": "english",
                "type": "text"
            },
            "ngram": {
                "analyzer": "ngram_analyzer",
                "type": "text"
            },
            "raw": {
                "type": "keyword"
            }
        },
        "type": "text"
    };
}

function getTalentsField() {
    return {
        firstName: getTextMapping(),
        lastName: getTextMapping(),
        middleName: getTextMapping(),
        email: getTextMapping(),
        phone: getTextMapping(),
        location: {
            properties: {}
        },
        profileImg: getTextMapping(),
        militarySrv: getTextMapping(),
        militaryBranch: getTextMapping(),
        bio: getTextMapping(),
        interestStage: getTextMapping(),
        interestBase: {
            type: 'integer'
        },
        interestOte: {
            type: 'integer'
        },
        interestLocs: {
            type: 'nested',
            properties: {}
        },
        interestRelocation: {
            type: 'boolean'
        },
        interestProducts: getTextMapping(),
        interestTargets: getTextMapping(),
        interestTravel: {
            type: 'integer'
        },
        interestDesp: getTextMapping(),
        workSalesYears: {
            type: 'integer'
        },
        workTools: getTextMapping(),
        workMethods: getTextMapping(),

        // system generated fields
        id: {
            type: 'integer'
        },
        createdAt: {
            type: 'date'
        },
        updatedAt: {
            type: 'date'
        },
    };
}

function getTalentsAllField(config = {}) {
    let field = {
        ...getTalentsField(),

        // relation fields
        interestRoles: {
            type: 'nested',
            properties: {
                ...getRolesField()
            }
        },
        interestIndustries: {
            type: 'nested',
            properties: {
                ...getIndustriesField()
            }
        },
        workRoles: {
            type: 'nested',
            properties: {
                ...getRolesField(),
                years: {
                    type: 'integer'
                }
            }
        },
        workIndustries: {
            type: 'nested',
            properties: {
                ...getIndustriesField(),
                years: {
                    type: 'integer'
                }
            }
        }
    };
    if (!config.withoutExperiences) {
        field.experiences = {
            type: 'nested',
            properties: {
                ...getExperiencesAllField({
                    withoutTalents: true,
                })
            }
        };
    }
    return field;
}

function getRolesField() {
    return {
        name: getTextMapping(),
        level: {
            type: 'integer'
        },
        parentId: {
            type: 'integer'
        },

        // system generated fields
        id: {
            type: 'integer'
        },
        createdAt: {
            type: 'date'
        },
        updatedAt: {
            type: 'date'
        }
    };
}

function getIndustriesField() {
    return {
        name: getTextMapping(),
        level: {
            type: 'integer'
        },
        parentId: {
            type: 'integer'
        },
        deleted: {
            type: 'boolean'
        },

        // system generated fields
        id: {
            type: 'integer'
        },
        createdAt: {
            type: 'date'
        },
        updatedAt: {
            type: 'date'
        }
    };
}

function getExperiencesField() {
    return {
        expCurrent: {
            type: 'boolean'
        },
        expType: getTextMapping(),
        expTitle: getTextMapping(),
        expStart: {
            type: 'date'
        },
        expEnd: {
            type: 'date'
        },
        expBase: {
            type: 'integer'
        },
        expOte: {
            type: 'integer'
        },
        expProducts: getTextMapping(),
        expTerritories: getTextMapping(),
        expRevenue: {
            type: 'integer'
        },
        expSize: {
            type: 'integer'
        },
        expQuotas: {
            type: 'nested',
            properties: {}
        },
        expAwards: {
            type: 'nested',
            properties: {}
        },
        otherSkills: getTextMapping(),
        references: {
            type: 'nested',
            properties: {}
        },

        // system generated fields
        id: {
            type: 'integer'
        },
        createdAt: {
            type: 'date'
        },
        updatedAt: {
            type: 'date'
        },
    };
}

function getExperiencesAllField(config = {}) {
    let field = {
        ...getExperiencesField(),

        // relation fields
        role: {
            properties: {
                ...getRolesField()
            }
        },
        industries: {
            type: 'nested',
            properties: {
                ...getIndustriesField()
            }
        },
    };
    if (!config.withoutTalents) {
        field.talent = {
            properties: {
                ...getTalentsAllField({
                    withoutExperiences: true
                })
            }
        };
    }
    if (!config.withoutOrganizations) {
        field.organization = {
            properties: {
                ...getOrganizationsAllField({
                    withoutExperiences: true
                })
            }
        }
    }
    return field;
}

function getOrganizationsField() {
    return {
        name: getTextMapping(),
        website: getTextMapping(),
        private: {
            type: 'boolean'
        },
        stockExchange: getTextMapping(),
        tickerSymbol: getTextMapping(),
        numberOfEmployees: {
            type: 'integer'
        },
        keyCompetitor: getTextMapping(),
        companyRank: {
            type: 'integer'
        },
        untracked: {
            type: 'boolean'
        },
        description: getTextMapping(),
        deleted: {
            type: 'boolean'
        },
        categories: getTextMapping(),
        organizationType: getTextMapping(),

        // system generated fields
        id: {
            type: 'integer'
        },
        createdAt: {
            type: 'date'
        },
        updatedAt: {
            type: 'date'
        },
    };
}

function getOrganizationsAllField(config = {}) {
    let field = {
        ...getOrganizationsField(),

        // relation fields
        industries: {
            type: 'nested',
            properties: {
                ...getIndustriesField()
            }
        },
    };
    if (!config.withoutExperiences) {
        field.experiences = {
            type: 'nested',
            properties: {
                ...getExperiencesAllField({
                    withoutOrganizations: true
                })
            }
        };
    }
    return field;
}

async function deleteTalentsIndex() {
    // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_indices_delete
    let result = await client.indices.delete({
        index: index.talents
    });
    console.log('deleteTalentsIndex', JSON.stringify(result.body, null, '\t'));
}

async function deleteExperiencesIndex() {
    let result = await client.indices.delete({
        index: index.experiences
    });
    console.log('deleteExperiencesIndex', JSON.stringify(result.body, null, '\t'));
}

async function deleteOrganizationsIndex() {
    let result = await client.indices.delete({
        index: index.organizations
    });
    console.log('deleteOrganizationsIndex', JSON.stringify(result.body, null, '\t'));
}

async function getTalentsIndex() {
    let result = await client.indices.get({
        index: index.talents
    });
    console.log('getTalentsIndex', JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/getTalentsIndex.json`, JSON.stringify(result.body, null, '\t'));
}

async function getExperiencesIndex() {
    let result = await client.indices.get({
        index: index.experiences
    });
    console.log('getTalentsIndex', JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/getExperiencesIndex.json`, JSON.stringify(result.body, null, '\t'));
}

async function getOrganizationsIndex() {
    let result = await client.indices.get({
        index: index.organizations
    });
    console.log('getTalentsIndex', JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/getOrganizationsIndex.json`, JSON.stringify(result.body, null, '\t'));
}

async function insertTalentsIndex() {
    let bulkBody = ``;
    let list = getList(10);
    let jsonList = [];
    bulkBody = list.map((item) => {
        let json = getMockTalent(item);
        jsonList.push(json);
        let obj = {
            'action': {
                'create': {
                    '_index': index.talents,
                    '_id': `${item}`
                }
            },
            'value': json
        };
        return JSON.stringify(obj.action) + '\n' + JSON.stringify(obj.value);
    }).join('\n') + '\n';
    // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_bulk
    let result = await client.bulk({
        index: index.talents,
        body: bulkBody
    });
    console.log(JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync('./thes/insertTalentsIndex.json', JSON.stringify(jsonList, null, '\t'));
}

async function insertExperiencesIndex() {
    let bulkBody = ``;
    let list = getList(10);
    let jsonList = [];
    bulkBody = list.map((item) => {
        let json = getMockExperience(item);
        jsonList.push(json);
        let obj = {
            'action': {
                'create': {
                    '_index': index.experiences,
                    '_id': `${item}`
                }
            },
            'value': json
        };
        return JSON.stringify(obj.action) + '\n' + JSON.stringify(obj.value);
    }).join('\n') + '\n';
    let result = await client.bulk({
        index: index.experiences,
        body: bulkBody
    });
    console.log(JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync('./thes/insertExperiencesIndex.json', JSON.stringify(jsonList, null, '\t'));
}

async function insertOrganizationsIndex() {
    let bulkBody = ``;
    let list = getList(10);
    let jsonList = [];
    bulkBody = list.map((item) => {
        let json = getMockOrganization(item);
        jsonList.push(json);
        let obj = {
            'action': {
                'create': {
                    '_index': index.organizations,
                    '_id': `${item}`
                }
            },
            'value': json
        };
        return JSON.stringify(obj.action) + '\n' + JSON.stringify(obj.value);
    }).join('\n') + '\n';
    let result = await client.bulk({
        index: index.organizations,
        body: bulkBody
    });
    console.log(JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync('./thes/insertOrganizationsIndex.json', JSON.stringify(jsonList, null, '\t'));
}

function getList(count) {
    let list = [];
    for (let i = 0; i < count; i++) {
        list.push(i + 1);
    }
    return list;
}

function getMockTalent(config = {}) {
    let data = {
        firstName: faker.name.firstName(),
        lastName: faker.name.lastName(),
        middleName: faker.name.lastName(),
        email: faker.internet.email(),
        phone: `${faker.phone.phoneNumber()}`,
        location: {
            state: faker.address.state(),
            city: faker.address.city(),
            zipCode: faker.address.zipCode(),
            streetName: faker.address.streetName()
        },
        profileImg: faker.image.imageUrl(),
        militarySrv: getRandomInList(['Active', 'Veteran', 'None']),
        militaryBranch: faker.random.word(),
        bio: faker.lorem.paragraphs(),
        interestStage: getRandomInList(['Active', 'Keeping an eye out', 'Not looking']),
        interestBase: faker.random.number(),
        interestOte: faker.random.number(),
        interestLocs: [{
                state: faker.address.state(),
                city: faker.address.city(),
                zipCode: faker.address.zipCode(),
                streetName: faker.address.streetName()
            },
            {
                state: faker.address.state(),
                city: faker.address.city(),
                zipCode: faker.address.zipCode(),
                streetName: faker.address.streetName()
            }
        ],
        interestRelocation: faker.random.boolean(),
        interestProducts: [
            faker.commerce.productName(),
            faker.commerce.productName(),
            faker.commerce.productName(),
        ],
        interestTargets: [
            getRandomInList(['Enterprise', 'Mid-market', 'SMB', 'Startup', 'Consumer']),
            getRandomInList(['Enterprise', 'Mid-market', 'SMB', 'Startup', 'Consumer'])
        ],
        interestTravel: faker.random.number(),
        interestDesp: faker.lorem.sentences(),
        workSalesYears: getRandomNumber(30),
        workTools: [
            faker.random.words(), faker.random.words(), faker.random.words()
        ],
        workMethods: [
            faker.random.words(), faker.random.words(), faker.random.words()
        ],
        id: config.id || faker.random.number(),
        createdAt: faker.date.past(),
        updatedAt: faker.date.past(),
        interestRoles: [
            getMockRole(),
            getMockRole(),
        ],
        interestIndustries: [
            getMockIndustry(),
            getMockIndustry()
        ],
        workRoles: [
            getMockRole({
                years: getRandomNumber(10)
            }),
            getMockRole({
                years: getRandomNumber(10)
            }),
        ],
        workIndustries: [
            getMockIndustry({
                years: getRandomNumber(10)
            }),
            getMockIndustry({
                years: getRandomNumber(10)
            })
        ]
    };
    if (!config.withoutExperiences) {
        data.experiences = [
            getMockExperience({
                withoutTalents: true,
                expCurrent: true
            }),
            getMockExperience({
                withoutTalents: true,
            }),
            getMockExperience({
                withoutTalents: true,
            }),
            getMockExperience({
                withoutTalents: true,
            })
        ];
    }
    return data;
}

function getMockRole(config = {}) {
    let list = [
        'VP of Sales', 'Director of Sales', 'Account Executive', 'Biz Dev Executive',
        'Sales Manager', 'CSM / AM Manager',
        'CSM / AM', 'Lead-gen', 'Inside Sales', 'Field Sales', 'sales operations', 'other'
    ];
    let data = list.map((name, index) => {
        return {
            id: index,
            name,
            level: 1,
            parentId: 0,
            createdAt: '2019-12-08T21:26:37.727Z',
            updatedAt: '2019-12-08T21:26:37.727Z',
            years: config.years
        };
    });
    return getRandomInList(data);
}

function getMockIndustry(config = {}) {
    let list = [
        'Auto Parts & Equipment', '	Airlines', 'Homebuilding', 'Casinos & Gaming',
        'Drug Retail', 'Health Care Supplies', 'Oil & Gas Drilling', 'Commodity Chemicals', 'Aluminum',
        'Commercial Printing', 'Department Stores'
    ];
    let data = list.map((name, index) => {
        return {
            id: index,
            name,
            level: 1,
            parentId: 0,
            createdAt: '2019-12-08T21:26:37.727Z',
            updatedAt: '2019-12-08T21:26:37.727Z',
            years: config.years
        };
    });
    return getRandomInList(data);
}

function getMockExperience(config) {
    let data = {
        expCurrent: config.expCurrent || false,
        expType: getRandomInList(['work', 'education', 'certificate']),
        expTitle: faker.name.jobTitle(),
        expStart: faker.date.past(),
        expEnd: faker.date.past(),
        expBase: faker.random.number(),
        expOte: faker.random.number(),
        expProducts: [
            faker.commerce.productName(),
            faker.commerce.productName(),
            faker.commerce.productName(),
        ],
        expTerritories: [
            getRandomInList(['NE', 'SE', 'SW', 'Midwest', 'Pacific']),
            getRandomInList(['NE', 'SE', 'SW', 'Midwest', 'Pacific']),
        ],
        expRevenue: faker.random.number(),
        expSize: faker.random.number(),
        expQuotas: [{
            total_sales: faker.random.number(),
            deal_size: faker.random.number(),
            cycle: faker.random.number(),
            new_biz: faker.random.number(),
            self_source: faker.random.number(),
            quota_reached: faker.random.number(),
            accounts: faker.random.number(),
            value: faker.random.number(),
            in_field: faker.random.number(),
            desp: faker.lorem.paragraph(),
        }, {
            total_sales: faker.random.number(),
            deal_size: faker.random.number(),
            cycle: faker.random.number(),
            new_biz: faker.random.number(),
            self_source: faker.random.number(),
            quota_reached: faker.random.number(),
            accounts: faker.random.number(),
            value: faker.random.number(),
            in_field: faker.random.number(),
            desp: faker.lorem.paragraph(),
        }],
        expAwards: [{
            title: faker.random.words(),
            description: faker.lorem.paragraph()
        }, {
            title: faker.random.words(),
            description: faker.lorem.paragraph()
        }],
        otherSkills: [
            faker.random.words(),
            faker.random.words(),
            faker.random.words()
        ],
        references: [{
            title: faker.random.words(),
            email: faker.internet.email(),
            desp: faker.lorem.paragraph()
        }, {
            title: faker.random.words(),
            email: faker.internet.email(),
            desp: faker.lorem.paragraph()
        }, {
            title: faker.random.words(),
            email: faker.internet.email(),
            desp: faker.lorem.paragraph()
        }],
        id: config.id || faker.random.number(),
        createdAt: faker.date.past(),
        updatedAt: faker.date.past(),
        role: getMockRole(),
        industries: [
            getMockIndustry(),
            getMockIndustry(),
            getMockIndustry(),
        ]
    };
    if (!config.withoutTalents) {
        data.talent = getMockTalent({
            withoutExperiences: true
        });
    }
    if (!config.withoutOrganizations) {
        data.organization = getMockOrganization({
            withoutExperiences: true
        });
    }
    return data;
}

function getMockOrganization(config) {
    let data = {
        name: faker.company.companyName(),
        website: faker.internet.url(),
        private: faker.random.boolean(),
        stockExchange: faker.random.words(),
        tickerSymbol: faker.random.word(),
        numberOfEmployees: faker.random.number(),
        keyCompetitor: faker.company.companyName(),
        companyRank: faker.random.number(),
        untracked: faker.random.boolean(),
        description: faker.lorem.paragraph(),
        categories: [
            faker.random.word(),
            faker.random.word(),
            faker.random.word(),
        ],
        organizationType: faker.random.word(),
        id: config.id || faker.random.number(),
        createdAt: faker.date.past(),
        updatedAt: faker.date.past(),
        industries: [
            getMockIndustry(),
            getMockIndustry(),
            getMockIndustry(),
        ]
    };
    if (!config.withoutExperiences) {
        data.experiences = [
            getMockExperience({
                withoutOrganizations: true,
                expCurrent: true
            }),
            getMockExperience({
                withoutOrganizations: true,
            }),
            getMockExperience({
                withoutOrganizations: true,
            }),
            getMockExperience({
                withoutOrganizations: true,
            }),
            getMockExperience({
                withoutOrganizations: true,
            })
        ];
    }
    return data;
}

function getRandomInList(list) {
    let item = list[getRandomNumber(list.length)];
    return item;
}

function getRandomNumber(max) {
    return Math.floor(Math.random() * max);
}

async function searchTalentsIndex() {
    let result = await client.search({
        index: index.talents,
        body: {
            query: {
                match_all: {}
            }
        }
    });
    console.log('searchTalentsIndex', JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/searchTalentsIndex.json`, JSON.stringify(result.body, null, '\t'));
}
async function searchExperiencesIndex() {
    let result = await client.search({
        index: index.experiences,
        body: {
            query: {
                match_all: {}
            }
        }
    });
    console.log('searchExperiencesIndex', JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/searchExperiencesIndex.json`, JSON.stringify(result.body, null, '\t'));
}
async function searchOrganizationsIndex() {
    let result = await client.search({
        index: index.organizations,
        body: {
            query: {
                match_all: {}
            }
        }
    });
    console.log('searchOrganizationsIndex', JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/searchOrganizationsIndex.json`, JSON.stringify(result.body, null, '\t'));
}

async function clearTalentsIndex() {
    // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_deletebyquery
    let result = await client.deleteByQuery({
        index: index.talents,
        refresh: true,
        body: {
            query: {
                match_all: {}
            }
        }
    });
    console.log('clearTalentsIndex', JSON.stringify(result.body, null, '\t'));
}

async function clearExperiencesIndex() {
    let result = await client.deleteByQuery({
        index: index.experiences,
        refresh: true,
        body: {
            query: {
                match_all: {}
            }
        }
    });
    console.log('clearExperiencesIndex', JSON.stringify(result.body, null, '\t'));
}

async function clearOrganizationsIndex() {
    let result = await client.deleteByQuery({
        index: index.organizations,
        refresh: true,
        body: {
            query: {
                match_all: {}
            }
        }
    });
    console.log('clearOrganizationsIndex', JSON.stringify(result.body, null, '\t'));
}