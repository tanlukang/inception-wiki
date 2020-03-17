const {
    Client
} = require('@elastic/elasticsearch');
const faker = require('faker');
const fs = require('fs');

const client = new Client({
    // node: 'http://localhost:9200',
    node: 'https://search-th-sales-staging-t54k4myj3hyg344obv2ozj5vo4.us-east-1.es.amazonaws.com/'
});

const index = {
    talents: 'th-talents-20200221',
    experiences: 'th-experiences-20200221',
    organizations: 'th-organizations-20200221',
    jobs: 'th-jobs-20200303'
};

const alias = {
    talents: 'th-talents',
    experiences: 'th-experiences',
    organizations: 'th-organizations',
    jobs: 'th-jobs'
};

(async () => {
    await Promise.all([
        // createIndex({
        //     index: index.talents,
        //     alias: alias.talents,
        //     field: getTalentsAllField()
        // }),
        // // createIndex({
        // //     index: index.experiences,
        // //     alias: alias.experiences,
        // //     field: getExperiencesAllField()
        // // }),
        // createIndex({
        //     index: index.organizations,
        //     alias: alias.organizations,
        //     field: getOrganizationsAllField()
        // }),
        // createIndex({
        //     index: index.jobs,
        //     alias: alias.jobs,
        //     field: getJobsAllField()
        // }),
    ]);

    await Promise.all([
        // deleteIndex({
        //     index: index.talents
        // }),
        // deleteIndex({
        //     index: index.experiences
        // }),
        // deleteIndex({
        //     index: index.organizations
        // }),
        // deleteIndex({
        //     index: index.jobs
        // }),
    ]);

    await Promise.all([
        // getIndex({
        //     index: index.talents
        // }),
        // // getIndex({
        // //     index: index.experiences
        // // }),
        // getIndex({
        //     index: index.organizations
        // }),
        // getIndex({
        //     index: index.jobs
        // }),
    ]);

    await Promise.all([
        insertIndex({
            index: index.talents,
            mockFunc: getMockTalent
        }),
        // // insertIndex({
        // //     index: index.experiences,
        // //     mockFunc: getMockExperience
        // // }),
        // insertIndex({
        //     index: index.organizations,
        //     mockFunc: getMockOrganization
        // }),
        // insertIndex({
        //     index: index.jobs,
        //     mockFunc: getMockJob
        // }),
    ]);

    await Promise.all([
        // searchIndex({
        //     index: index.talents,
        // }),
        // // searchIndex({
        // //     index: index.experiences,
        // // }),
        // searchIndex({
        //     index: index.organizations,
        // }),
        // searchIndex({
        //     index: index.jobs,
        // }),
    ]);

    await Promise.all([
        // clearIndex({
        //     index: index.talents,
        // }),
        // clearIndex({
        //     index: index.experiences,
        // }),
        // clearIndex({
        //     index: index.organizations,
        // }),
        // clearIndex({
        //     index: index.jobs,
        // })
    ]);
})();

async function createIndex({
    index,
    alias,
    field
}) {
    // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_indices_create
    fs.writeFileSync(`./thes/field-${index}.json`, JSON.stringify(field, null, '\t'));
    let result = await client.indices.create({
        index,
        body: {
            aliases: {
                [alias]: {},
            },
            settings: getIndexSetting(),
            mappings: {
                properties: field
            }
        }
    });
    console.log(`createIndex-${index}`, JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/createIndex-${index}.json`, JSON.stringify(result.body, null, '\t'));
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
        socialLink: {
            properties: {}
        },
        profileImg: getTextMapping(),
        militarySrvId: {
            type: 'integer'
        },
        militarySrv: {
            properties: {
                ...getValuesField()
            }
        },
        militaryBranch: getTextMapping(),
        bio: getTextMapping(),
        resumeLink: getTextMapping(),
        interestStageId: {
            type: 'integer'
        },
        interestStage: {
            properties: {
                ...getValuesField()
            }
        },
        interestBaseMin: {
            type: 'integer'
        },
        interestBaseMax: {
            type: 'integer'
        },
        interestOteMin: {
            type: 'integer'
        },
        interestOteMax: {
            type: 'integer'
        },
        preferredRoleLevelId: {
            type: 'integer'
        },
        preferredRoleLevel: {
            properties: {
                ...getValuesField()
            }
        },
        interestRoles: {
            type: 'nested',
            properties: {
                ...getValuesField()
            }
        },
        interestLocs: {
            type: 'nested',
            properties: {}
        },
        interestRelocation: {
            type: 'boolean'
        },
        interestRemote: {
            type: 'boolean'
        },
        interestIndustries: {
            type: 'nested',
            properties: {
                ...getIndustriesField()
            }
        },
        productAndService: getTextMapping(),
        interestProducts: getTextMapping(),
        interestClientTypes: {
            type: 'nested',
            properties: {
                ...getValuesField()
            }
        },
        interestTravel: {
            type: 'integer'
        },
        interestDesp: getTextMapping(),
        interestEquity: {
            type: 'boolean'
        },
        interestSalesCycleMin: {
            type: 'integer'
        },
        interestSalesCycleMax: {
            type: 'integer'
        },
        interestSalesTypes: {
            type: 'nested',
            properties: {
                ...getValuesField()
            }
        },
        workSalesYears: {
            type: 'integer'
        },
        workIndustries: {
            type: 'nested',
            properties: {
                ...getIndustriesField(),
                years: {
                    type: 'integer'
                }
            }
        },
        workRoles: {
            type: 'nested',
            properties: {
                ...getValuesField(),
                years: {
                    type: 'integer'
                }
            }
        },
        workRoleLevels: {
            type: 'nested',
            properties: {
                ...getValuesField(),
                years: {
                    type: 'integer'
                }
            }
        },
        workTools: getTextMapping(),
        workMethods: getTextMapping(),
        workInternational: {
            type: 'boolean'
        },
        workInternationalList: {
            type: 'nested',
            properties: {}
        },
        workSalesTypes: {
            type: 'nested',
            properties: {
                ...getValuesField(),
                years: {
                    type: 'integer'
                }
            }
        },
        workProductService: {
            type: 'nested',
            properties: {}
        },
        workClientTypes: {
            type: 'nested',
            properties: {
                ...getValuesField(),
                years: {
                    type: 'integer'
                }
            }
        },
        workDealSize: {
            type: 'nested',
            properties: {}
        },
        workSalesCycle: {
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
        _deleted: {
            type: 'boolean'
        },
        _state: getTextMapping()
    };
}

function getTalentsAllField(config = {}) {
    let field = {
        ...getTalentsField(),
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

function getValuesField() {
    return {
        name: getTextMapping(),
        category: getTextMapping(),
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
        },
        _deleted: {
            type: 'boolean'
        },
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
        _deleted: {
            type: 'boolean'
        },
    };
}

function getExperiencesField() {
    return {
        expCurrent: {
            type: 'boolean'
        },
        expTypeId: {
            type: 'integer'
        },
        expType: {
            properties: {
                ...getValuesField()
            }
        },
        expTitle: getTextMapping(),
        talentId: {
            type: 'integer'
        },
        organizationId: {
            type: 'integer'
        },
        roleId: {
            type: 'integer'
        },
        role: {
            properties: {
                ...getValuesField()
            }
        },
        expSalesTypeId: {
            type: 'integer'
        },
        expSalesType: {
            properties: {
                ...getValuesField()
            }
        },
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
        industries: {
            type: 'nested',
            properties: {
                ...getIndustriesField()
            }
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
        _deleted: {
            type: 'boolean'
        },
        _state: getTextMapping()
    };
}

function getExperiencesAllField(config = {}) {
    let field = {
        ...getExperiencesField(),
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
        url: getTextMapping(),
        organizationTypeId: {
            type: 'integer'
        },
        organizationType: {
            properties: {
                ...getValuesField()
            }
        },
        industries: {
            type: 'nested',
            properties: {
                ...getIndustriesField()
            }
        },
        location: {
            properties: {}
        },
        companyTypeId: {
            type: 'integer'
        },
        companyType: {
            properties: {
                ...getValuesField()
            }
        },
        revenueHistory: {
            type: 'nested',
            properties: {}
        },
        employeeCountHistory: {
            type: 'nested',
            properties: {}
        },
        miniTags: {
            type: 'nested',
            properties: {
                ...getValuesField()
            }
        },
        culture: getTextMapping(),
        hasMentorship: {
            type: 'boolean'
        },
        mentorshipDesp: getTextMapping(),
        hasEducationReimbursement: {
            type: 'boolean'
        },
        reimbursementDesp: getTextMapping(),
        admiredCompanies: {
            type: 'nested',
            properties: {}
        },
        competitorCompanies: {
            type: 'nested',
            properties: {}
        },
        similarCompanies: {
            type: 'nested',
            properties: {}
        },
        stockExchange: getTextMapping(),
        tickerSymbol: getTextMapping(),
        description: getTextMapping(),
        keywords: getTextMapping(),
        publicPrivate: getTextMapping(),
        salesCulture: getTextMapping(),
        salesLeadershipOverview: getTextMapping(),
        salesTrainingProvided: getTextMapping(),
        salesToolsUsed: getTextMapping(),
        salesTeamVideo: getTextMapping(),

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
        _deleted: {
            type: 'boolean'
        },
        _state: getTextMapping()
    };
}

function getOrganizationsAllField(config = {}) {
    let field = {
        ...getOrganizationsField(),
    };
    // if (!config.withoutExperiences) {
    //     field.experiences = {
    //         type: 'nested',
    //         properties: {
    //             ...getExperiencesAllField({
    //                 withoutOrganizations: true
    //             })
    //         }
    //     };
    // }
    // if (!config.withoutJobs) {
    //     field.jobs = {
    //         type: 'nested',
    //         properties: {
    //             ...getJobsAllField({
    //                 withoutOrganizations: true
    //             })
    //         }
    //     };
    // }
    return field;
}

function getJobsField() {
    return {
        // company
        companyName: getTextMapping(),
        companyUrl: getTextMapping(),
        orgId: {
            type: 'integer'
        },
        companyLocation: {
            properties: {}
        },
        companyTypeId: {
            type: 'integer'
        },
        companyType: {
            properties: {
                ...getValuesField()
            }
        },
        companyIndustries: {
            type: 'nested',
            properties: {
                ...getIndustriesField()
            }
        },
        companyRevenue: {
            type: 'integer'
        },
        companyRevenueGrowthPercent: {
            type: 'integer'
        },
        companyEmployeeCount: {
            type: 'integer'
        },
        companyEmployeeCountGrowthPercent: {
            type: 'integer'
        },
        companyMiniTags: {
            type: 'nested',
            properties: {
                ...getValuesField()
            }
        },
        companyDescription: getTextMapping(),
        companyCulture: getTextMapping(),
        companyHasMentorship: {
            type: 'boolean'
        },
        companyMentorshipDesp: getTextMapping(),
        companyHasEducationReimbursement: {
            type: 'boolean'
        },
        companyHasReimbursementDesp: {
            type: 'boolean'
        },
        companyAdmiredCompanies: {
            type: 'nested',
            properties: {}
        },
        startDate: {
            type: 'date'
        },

        // job
        positionTitle: getTextMapping(),
        positionRoleTypeId: {
            type: 'integer'
        },
        positionRoleType: {
            properties: {
                ...getValuesField()
            }
        },
        positionSalesTypeId: {
            type: 'integer'
        },
        positionSalesType: {
            properties: {
                ...getValuesField()
            }
        },
        positionRoleId: {
            type: 'integer'
        },
        positionRole: {
            properties: {
                ...getValuesField()
            }
        },
        positionTravelPercent: {
            type: 'integer'
        },
        productSoldTypes: getTextMapping(),
        positionBaseMin: {
            type: 'integer'
        },
        positionBaseMax: {
            type: 'integer'
        },
        positionOTEMin: {
            type: 'integer'
        },
        positionOTEMax: {
            type: 'integer'
        },
        positionQuotaTargetMin: {
            type: 'integer'
        },
        positionQuotaTargetMax: {
            type: 'integer'
        },
        positionClientTypes: {
            type: 'nested',
            properties: {
                ...getValuesField()
            }
        },
        positionDepartments: {
            type: 'nested',
            properties: {
                ...getValuesField()
            }
        },
        positionProductFileUrl: getTextMapping(),
        positionSalesCycleMin: {
            type: 'integer'
        },
        positionSalesCycleMax: {
            type: 'integer'
        },
        fieldInside: getTextMapping(),
        positionOverview: getTextMapping(),
        dealPercent: {
            type: 'integer'
        },
        teamReportingTo: getTextMapping(),
        teamLinkedin: getTextMapping(),
        teamSize: {
            type: 'integer'
        },
        saleTools: getTextMapping(),
        saleModels: getTextMapping(),
        saleMethods: getTextMapping(),
        career: getTextMapping(),
        training: getTextMapping(),
        isBDRSDRSupport: {
            type: 'boolean'
        },
        newSalesHireLastYear: {
            type: 'integer'
        },
        teamVideoUrl: getTextMapping(),
        has401K: {
            type: 'boolean'
        },
        contributionDegree: getTextMapping(),
        hasSharingProfit: {
            type: 'boolean'
        },
        sharingDetail: getTextMapping(),
        isEquity: {
            type: 'boolean'
        },
        hasHealthMedical: {
            type: 'boolean'
        },
        hasHealthDental: {
            type: 'boolean'
        },
        hasHealthVision: {
            type: 'boolean'
        },
        otherBenefits: getTextMapping(),
        additionDocumentUrl: getTextMapping(),
        awards: getTextMapping(),

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
        _deleted: {
            type: 'boolean'
        },
        _state: getTextMapping()
    };
}

function getJobsAllField(config = {}) {
    let field = {
        ...getJobsField(),
    };
    // if (!config.withoutOrganizations) {
    //     field.company = {
    //         properties: {
    //             ...getOrganizationsAllField({
    //                 withoutExperiences: true,
    //                 withoutJobs: true
    //             })
    //         }
    //     };
    // }
    return field;
}

async function deleteIndex({
    index
}) {
    // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_indices_delete
    let result = await client.indices.delete({
        index
    });
    console.log(`deleteIndex-${index}`, JSON.stringify(result.body, null, '\t'));
}

async function getIndex({
    index
}) {
    let result = await client.indices.get({
        index
    });
    console.log(`getIndex-${index}`, JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/getIndex-${index}.json`, JSON.stringify(result.body, null, '\t'));
}

async function insertIndex({
    index,
    mockFunc
}) {
    let bulkBody = ``;
    let list = getList(10);
    let jsonList = [];
    bulkBody = list.map((item) => {
        let json = mockFunc(item);
        jsonList.push(json);
        let obj = {
            'action': {
                'create': {
                    '_index': index,
                    '_id': `${item}`
                }
            },
            'value': json
        };
        return JSON.stringify(obj.action) + '\n' + JSON.stringify(obj.value);
    }).join('\n') + '\n';
    // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_bulk
    let result = await client.bulk({
        index,
        body: bulkBody
    });
    console.log(JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/insertIndex-${index}.json`, JSON.stringify(jsonList, null, '\t'));
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
        location: getMockLocation(),
        profileImg: faker.image.imageUrl(),
        militarySrv: getMockMilitarySrv(),
        militaryBranch: faker.random.word(),
        bio: faker.lorem.paragraphs(),
        resumeLink: faker.image.imageUrl(),
        interestStage: getMockInterestStage(),
        interestBaseMin: faker.random.number(),
        interestBaseMax: faker.random.number(),
        interestOteMin: faker.random.number(),
        interestOteMax: faker.random.number(),
        preferredRoleLevel: getMockRoleLevel(),
        interestRoles: [
            getMockRole(),
            getMockRole(),
        ],
        interestLocs: [
            getMockLocation(),
            getMockLocation(),
        ],
        interestRelocation: faker.random.boolean(),
        interestRemote: faker.random.boolean(),
        interestIndustries: [
            getMockIndustry(),
            getMockIndustry(),
        ],
        productAndService: [
            faker.commerce.productName(),
            faker.commerce.productName()
        ],
        interestProducts: [
            faker.commerce.productName(),
            faker.commerce.productName()
        ],
        interestClientTypes: [
            getMockClientType(),
            getMockClientType()
        ],
        interestTravel: faker.random.number(),
        interestDesp: faker.lorem.sentences(),
        interestEquity: faker.random.boolean(),
        interestSalesCycleMin: faker.random.number(),
        interestSalesCycleMax: faker.random.number(),
        interestSalesTypes: [
            getMockSalesType(),
            getMockSalesType(),
        ],
        workSalesYears: getRandomNumber(30),
        workIndustries: [
            getMockIndustry({
                years: getRandomNumber(10)
            }),
            getMockIndustry({
                years: getRandomNumber(10)
            })
        ],
        workRoles: [
            getMockRole({
                years: getRandomNumber(10)
            }),
            getMockRole({
                years: getRandomNumber(10)
            }),
        ],
        workRoleLevels: [
            getMockRoleLevel({
                years: getRandomNumber(10)
            }),
            getMockRoleLevel({
                years: getRandomNumber(10)
            }),
        ],
        workTools: [
            faker.random.words(), faker.random.words(), faker.random.words()
        ],
        workMethods: [
            faker.random.words(), faker.random.words(), faker.random.words()
        ],
        workInternational: faker.random.boolean(),
        workInternationalList: [],
        workSalesTypes: [
            getMockSalesType({
                years: getRandomNumber(10)
            }),
            getMockSalesType({
                years: getRandomNumber(10)
            }),
        ],
        workProductService: [],
        workClientTypes: [
            getMockClientType({
                years: getRandomNumber(10)
            }),
            getMockClientType({
                years: getRandomNumber(10)
            }),
        ],
        workDealSize: [],
        workSalesCycle: [],

        id: config.id || faker.random.number(),
        createdAt: faker.date.past(),
        updatedAt: faker.date.past(),
        _state: 'published',
        _delete: false,
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

function getMockLocation() {
    return {
        state: faker.address.state(),
        city: faker.address.city(),
        zipCode: faker.address.zipCode(),
        streetName: faker.address.streetName()
    };
}

function getMockMilitarySrv(config = {}) {
    let list = [
        'Active', 'Veteran', 'None'
    ];
    let data = list.map((name, index) => {
        return {
            id: index,
            name,
            years: config.years
        };
    });
    return getRandomInList(data);
}

function getMockInterestStage(config = {}) {
    let list = [
        'Actively looking', 'Passively Looking', 'Not Looking at this time'
    ];
    let data = list.map((name, index) => {
        return {
            id: index + 50,
            name,
            years: config.years
        };
    });
    return getRandomInList(data);
}

function getMockRoleLevel(config = {}) {
    let list = [
        'Manager of Managers', 'Manager of Sales Professionals', 'Individual Contributor'
    ];
    let data = list.map((name, index) => {
        return {
            id: index + 100,
            name,
            years: config.years
        };
    });
    return getRandomInList(data);
}

function getMockRole(config = {}) {
    let list = [
        'Field Sales/AE', 'Inside Sales', 'Account Management', 'BDR/SDR',
        'Client Success', 'Channel Sales', 'Sales Engineer'
    ];
    let data = list.map((name, index) => {
        return {
            id: index + 150,
            name,
            years: config.years
        };
    });
    return getRandomInList(data);
}

function getMockClientType(config = {}) {
    let list = [
        'Enterprise', 'Mid-market', 'SMB', 'Startup', 'Consumer'
    ];
    let data = list.map((name, index) => {
        return {
            id: index + 200,
            name,
            years: config.years
        };
    });
    return getRandomInList(data);
}

function getMockSalesType(config = {}) {
    let list = [
        'New Business', 'Account Management', 'Hybrid'
    ];
    let data = list.map((name, index) => {
        return {
            id: index + 250,
            name,
            years: config.years
        };
    });
    return getRandomInList(data);
}

function getMockExpType(config = {}) {
    let list = [
        'work', 'education', 'certificate'
    ];
    let data = list.map((name, index) => {
        return {
            id: index + 300,
            name,
            years: config.years
        };
    });
    return getRandomInList(data);
}

function getMockOrganizationType(config = {}) {
    let list = [
        'company', 'university', 'institutions', 'other'
    ];
    let data = list.map((name, index) => {
        return {
            id: index + 350,
            name,
            years: config.years
        };
    });
    return getRandomInList(data);
}

function getMockMiniTag(config = {}) {
    let list = [
        faker.random.words(), faker.random.words(), faker.random.words(),
        faker.random.words(), faker.random.words(), faker.random.words(),
        faker.random.words(), faker.random.words(), faker.random.words(),
        faker.random.words(), faker.random.words(), faker.random.words(),
    ];
    let data = list.map((name, index) => {
        return {
            id: index + 400,
            name,
            years: config.years
        };
    });
    return getRandomInList(data);
}

function getMockDepartment(config = {}) {
    let list = [
        'C-Suite', 'IT', 'Marketing', 'Sales', 'Other'
    ];
    let data = list.map((name, index) => {
        return {
            id: index + 450,
            name,
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
            years: config.years
        };
    });
    return getRandomInList(data);
}

function getMockExperience(config) {
    let data = {
        expCurrent: config.expCurrent || false,
        expType: getMockExpType(),
        expTitle: faker.name.jobTitle(),
        role: getMockRole(),
        expSalesType: getMockSalesType(),
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
        industries: [
            getMockIndustry(),
            getMockIndustry(),
            getMockIndustry(),
        ],
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
        _state: 'published',
        _delete: false,
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
        url: faker.internet.url(),
        organizationType: getMockOrganizationType(),
        industries: [
            getMockIndustry(),
            getMockIndustry(),
            getMockIndustry(),
        ],
        location: getMockLocation(),
        companyType: getMockClientType(),
        revenueHistory: [],
        employeeCountHistory: [],
        miniTags: [
            getMockMiniTag(),
            getMockMiniTag(),
        ],
        culture: faker.random.words(),
        hasMentorship: faker.random.boolean(),
        mentorshipDesp: faker.lorem.paragraph(),
        hasEducationReimbursement: faker.random.boolean(),
        reimbursementDesp: faker.lorem.paragraph(),
        admiredCompanies: [],
        competitorCompanies: [],
        similarCompanies: [],
        stockExchange: faker.random.word(),
        tickerSymbol: faker.random.word(),
        description: faker.lorem.paragraph(),
        keywords: [faker.random.word(), faker.random.word()],
        publicPrivate: 'public',
        salesCulture: faker.random.words(),
        salesLeadershipOverview: faker.lorem.paragraph(),
        salesTrainingProvided: faker.lorem.paragraph(),
        salesToolsUsed: [
            faker.random.word(),
            faker.random.words(),
        ],
        salesTeamVideo: faker.image.imageUrl(),

        id: config.id || faker.random.number(),
        createdAt: faker.date.past(),
        updatedAt: faker.date.past(),
        _state: 'published',
        _delete: false,
    };
    // if (!config.withoutExperiences) {
    //     data.experiences = [
    //         getMockExperience({
    //             withoutOrganizations: true,
    //             expCurrent: true
    //         }),
    //         getMockExperience({
    //             withoutOrganizations: true,
    //         }),
    //         getMockExperience({
    //             withoutOrganizations: true,
    //         }),
    //         getMockExperience({
    //             withoutOrganizations: true,
    //         }),
    //         getMockExperience({
    //             withoutOrganizations: true,
    //         })
    //     ];
    // }
    return data;
}

function getMockJob(config) {
    let data = {
        companyName: faker.company.companyName(),
        companyUrl: faker.internet.url(),
        companyLocation: getMockLocation(),
        companyType: getMockClientType(),
        companyIndustries: [
            getMockIndustry(),
            getMockIndustry(),
            getMockIndustry(),
        ],
        companyRevenue: faker.random.number(),
        companyRevenueGrowthPercent: faker.random.number(),
        companyEmployeeCount: faker.random.number(),
        companyEmployeeCountGrowthPercent: faker.random.number(),
        companyMiniTags: [
            getMockMiniTag(),
            getMockMiniTag(),
        ],
        companyDescription: faker.lorem.paragraph(),
        companyCulture: faker.lorem.paragraph(),
        companyHasMentorship: faker.random.boolean(),
        companyMentorshipDesp: faker.lorem.paragraph(),
        companyHasEducationReimbursement: faker.random.boolean(),
        companyHasReimbursementDesp: faker.random.boolean(),
        companyAdmiredCompanies: [],
        startDate: faker.date.past(),

        positionTitle: faker.name.jobTitle(),
        positionRoleType: getMockRoleLevel(),
        positionSalesType: getMockSalesType(),
        positionRole: getMockRole(),
        positionTravelPercent: faker.random.number(),
        productSoldTypes: [
            faker.commerce.productName(),
            faker.commerce.productName()
        ],
        positionBaseMin: faker.random.number(),
        positionBaseMax: faker.random.number(),
        positionOTEMin: faker.random.number(),
        positionOTEMax: faker.random.number(),
        positionQuotaTargetMin: faker.random.number(),
        positionQuotaTargetMax: faker.random.number(),
        positionClientTypes: [
            getMockClientType(),
            getMockClientType()
        ],
        positionDepartments: [
            getMockDepartment(),
            getMockDepartment(),
        ],
        positionProductFileUrl: faker.internet.url(),
        positionSalesCycleMin: faker.random.number(),
        positionSalesCycleMax: faker.random.number(),
        fieldInside: 'field',
        positionOverview: faker.lorem.paragraph(),
        dealPercent: faker.random.number(),
        teamReportingTo: faker.random.words(),
        teamLinkedin: faker.random.words(),
        teamSize: faker.random.number(),
        saleTools: [
            faker.random.words(),
            faker.random.words(),
        ],
        saleModels: [
            faker.random.words(),
            faker.random.words(),
        ],
        saleMethods: [
            faker.random.words(),
            faker.random.words(),
        ],
        career: faker.random.words(),
        training: faker.random.words(),
        isBDRSDRSupport: true,
        newSalesHireLastYear: faker.random.number(),
        teamVideoUrl: faker.internet.url(),
        has401K: faker.random.boolean(),
        contributionDegree: faker.random.word(),
        hasSharingProfit: faker.random.boolean(),
        sharingDetail: faker.lorem.paragraph(),
        isEquity: faker.random.boolean(),
        hasHealthMedical: faker.random.boolean(),
        hasHealthDental: faker.random.boolean(),
        hasHealthVision: faker.random.boolean(),
        otherBenefits: faker.lorem.paragraph(),
        additionDocumentUrl: faker.internet.url(),
        awards: [
            faker.random.words(),
            faker.random.words(),
        ],

        id: config.id || faker.random.number(),
        createdAt: faker.date.past(),
        updatedAt: faker.date.past(),
        _state: 'published',
        _delete: false,
    };
    return data;
}

function getRandomInList(list) {
    let item = list[getRandomNumber(list.length)];
    return item;
}

function getRandomNumber(max) {
    return Math.floor(Math.random() * max);
}

async function searchIndex({
    index
}) {
    let result = await client.search({
        index,
        body: {
            query: {
                match_all: {}
            }
        }
    });
    console.log(`searchIndex-${index}`, JSON.stringify(result.body, null, '\t'));
    fs.writeFileSync(`./thes/searchIndex-${index}.json`, JSON.stringify(result.body, null, '\t'));
}

async function clearIndex({
    index
}) {
    // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_deletebyquery
    let result = await client.deleteByQuery({
        index,
        refresh: true,
        body: {
            query: {
                match_all: {}
            }
        }
    });
    console.log(`clearIndex-${index}`, JSON.stringify(result.body, null, '\t'));
}