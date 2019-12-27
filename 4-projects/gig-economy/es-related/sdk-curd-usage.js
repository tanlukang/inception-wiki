const {
  Client
} = require('@elastic/elasticsearch');
const faker = require('faker');
const fs = require('fs');

const client = new Client({
  node: 'http://localhost:9200'
});

// 真正使用时可以用的格式：`application_${applicationId}-model_${modelId}-${datetime}`
const index = 'es-usage';

(async () => {
  // await createIndex();
  // await deleteIndex();

  // await updateMapping();
  // await getMapping();

  // await bulkCreateDoc();
  // await search();
  // await getAllDoc();
  // await getDocByQuery();
  // await createDoc();
  // await updateDoc();
  // await updateDocByQuery();
  // await deleteDoc();
  // await deleteDocByQuery();
  // await deleteAllDoc();
})();

async function createIndex() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_indices_create
  let result = await client.indices.create({
    index,
    body: {
      mappings: {
        properties: {
          id: {
            type: 'integer'
          },
          firstName: {
            type: 'text',
            fields: {
              raw: {
                type: 'keyword'
              }
            }
          },
          lastName: {
            type: 'text',
            fields: {
              raw: {
                type: 'keyword'
              }
            }
          },
          email: {
            type: 'text',
            fields: {
              raw: {
                type: 'keyword'
              }
            }
          },
          age: {
            type: 'integer'
          },
          age: {
            type: 'double'
          },
          bio: {
            type: 'text',
            fields: {
              raw: {
                type: 'keyword'
              }
            }
          },
          keyword: {
            type: 'text',
            fields: {
              raw: {
                type: 'keyword'
              }
            }
          },
          isActive: {
            type: 'boolean'
          },
          createdAt: {
            type: 'date'
          },
          company: {
            type: 'nested',
            properties: {
              name: {
                type: 'text',
                fields: {
                  raw: {
                    type: 'keyword'
                  }
                }
              },
              url: {
                type: 'text',
                fields: {
                  raw: {
                    type: 'keyword'
                  }
                }
              },
              industry: {
                type: 'nested',
                properties: {
                  name: {
                    type: 'text',
                    fields: {
                      raw: {
                        type: 'keyword'
                      }
                    }
                  },
                  category: {
                    type: 'text',
                    fields: {
                      raw: {
                        type: 'keyword'
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  });
  console.log('createIndex', JSON.stringify(result.body, null, '  '));
}

async function deleteIndex() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_indices_delete
  let result = await client.indices.delete({
    index
  });
  console.log('deleteIndex', JSON.stringify(result.body, null, '  '));
}

async function getMapping() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_indices_getmapping
  let result = await client.indices.getMapping({
    index
  });
  console.log('getMapping', JSON.stringify(result.body, null, '  '));
}

async function updateMapping() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_indices_putmapping
  let result = await client.indices.putMapping({
    index,
    body: {
      properties: {
        gender: {
          type: 'text',
          fields: {
            raw: {
              type: 'keyword'
            }
          }
        }
      }
    }
  });
  console.log('updateMapping', JSON.stringify(result.body, null, '  '));
}

async function bulkCreateDoc() {
  let bulkBody = ``;
  let list = getList(1000);
  let jsonList = [];
  bulkBody = list.map((item) => {
    let json = talent(item);
    jsonList.push(json);
    let obj = {
      'action': {
        'create': {
          '_index': index,
          // _id可以直接用pgId的字符串
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
  console.log(JSON.stringify(result.body, null, '  '));
  fs.writeFileSync('./es-usage.json', JSON.stringify(jsonList, null, '  '));
}

async function getAllDoc() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_search
  let result = await client.search({
    index,
    body: {
      query: {
        match_all: {}
      }
    }
  });
  console.log('getAllDoc', JSON.stringify(result.body, null, '  '));
}

async function getDocByQuery() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_search
  let result = await client.search({
    index,
    body: {
      query: {
        bool: {
          should: [{
              match: {
                // 这里的id是mapping中的id
                id: 1,
                // 这里的_id是document的_id，和mapping的id不同；mapping的id=pgId，_id=pgId的字符串形式
                // _id: '1'
              }
            },
            {
              match: {
                id: 2,
              }
            }
          ]
        },
        // 以下语法不存在
        // match: {
        //   id: [1, 2]
        // }
      }
    }
  });
  console.log('getAllDoc', JSON.stringify(result.body, null, '  '));
}

async function search() {
  let queryKeyword = 'Kris';
  let result = await client.search({
    index,
    // 返回字段排除
    // _source_excludes: ['email', 'phone'],
    _source: ['firstName', 'dateOfBirth'],
    // 分页控制
    // from: 0,
    size: 1,
    body: {
      query: {
        bool: {
          // 使用must的原因是，后续widget可能也有对特定字段的关键字搜索，到时候widget的关键字搜索和searchbar的搜索是`AND`的关系
          must: [
            // searchbar的关键字查询条件
            {
              bool: {
                // searchbar的关键字查询使用should，对多个字段分别进行搜索
                should: [{
                    match: {
                      firstName: {
                        'query': queryKeyword,
                        // 模糊匹配配置
                        'fuzziness': 'AUTO',
                        'prefix_length': 3,
                        // 权重配置，大于1表示加大权重，0-1表示减少权重
                        'boost': 3
                      },
                    }
                  },
                  {
                    match: {
                      lastName: {
                        'query': queryKeyword,
                        'fuzziness': 'AUTO',
                        'prefix_length': 3,
                      }
                    }
                  },
                  {
                    match: {
                      keyword: {
                        'query': queryKeyword,
                        'fuzziness': 'AUTO',
                        'prefix_length': 3,
                      }
                    }
                  },
                  {
                    'nested': {
                      'path': 'company',
                      'query': {
                        bool: {
                          should: [{
                            'match': {
                              'company.name': {
                                query: queryKeyword,
                                'fuzziness': 'AUTO',
                                'prefix_length': 3,
                              }
                            }
                          }, {
                            nested: {
                              path: 'company.industry',
                              query: {
                                bool: {
                                  should: [{
                                      match: {
                                        'company.industry.name': {
                                          query: queryKeyword,
                                          'fuzziness': 'AUTO',
                                          'prefix_length': 3,
                                        }
                                      }
                                    },
                                    {
                                      match: {
                                        'company.industry.category': {
                                          query: queryKeyword,
                                          'fuzziness': 'AUTO',
                                          'prefix_length': 3,
                                        }
                                      }
                                    }
                                  ]
                                }
                              },
                              'score_mode': 'avg'
                            }
                          }]
                        }
                      },
                      'score_mode': 'avg'
                    }
                  }
                ]
              }
            }
          ],
          // 过滤条件，目前只是全局的过滤条件，后续widget的过滤条件也往里塞
          filter: [
            // 匹配的filter都用match，不管是text、keyword、boolean、int
            {
              match: {
                email: {
                  query: 'hotmail.com'
                }
              }
            },
            {
              match: {
                isActive: {
                  query: true
                }
              }
            },
            // 匹配范围的filter使用range
            {
              range: {
                dateOfBirth: {
                  gte: '2018-07-21',
                  lte: '2019-11-21'
                }
              }
            }
          ],
          // 过滤条件，同上
          must_not: [{
            range: {
              dateOfBirth: {
                gte: '2019-08-10',
                lte: '2019-09-10'
              }
            }
          }]
        },
      },
      // 排序，如果不设置sort默认按照_score从大到小排序
      sort: [
        // 由于text类型不能sort和aggs，因此text类型数据mapping增加fields，index时独立index出一个keyword类型的raw字段，处理sort和aggs的场景
        {
          'firstName.raw': {
            order: 'asc'
          }
        }, {
          'dateOfBirth': 'desc'
        },
        {
          'company.industry.name.raw': {
            order: 'desc',
            nested: {
              path: 'company',
              // filter: {
              //   "term": {
              //     "company.name": "inc"
              //   }
              // },
              nested: {
                path: 'company.industry'
              }
            }
          }
        },
        '_score'
      ]
    },
    // sort: [
    //   'firstName.raw:desc',
    //   'dateOfBirth:desc',
    //   '_score'
    // ]
  });
  console.log(JSON.stringify(result.body, null, '  '));
}

async function createDoc() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_create
  let result = await client.create({
    // 这里的id属性实际上是_id，到时候直接用pgId的字符串
    id: '' + faker.random.number(),
    index,
    body: talent()
  });
  console.log('createDoc', JSON.stringify(result.body, null, '  '));
}

async function updateDoc() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_update
  let result = await client.update({
    // 这里的id属性实际上是_id，到时候直接用pgId的字符串
    id: '1',
    index,
    refresh: true,
    body: {
      doc: talent()
    }
  });
  console.log('updateDoc', JSON.stringify(result.body, null, '  '));
}

async function updateDocByQuery() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_updatebyquery
  let result = await client.updateByQuery({
    index,
    refresh: true,
    body: {
      query: {
        match: {
          id: 1
        }
      },
      // 似乎不能类似update方法一样把doc直接传参，需要写script，https://stackoverflow.com/questions/39113370/looking-for-elasticsearch-updatebyquery-syntax-example-node-driver
      script: {
        lang: 'painless',
        inline: `
          ctx._source.firstName = params.firstName; 
          ctx._source.lastName = params.lastName;
        `,
        params: talent()
      }
    }
  });
  console.log('updateDocByQuery', JSON.stringify(result.body, null, '  '));
}

async function deleteDoc() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_delete
  let result = await client.delete({
    // 这里的id属性实际上是_id，到时候直接用pgId的字符串
    id: '1',
    index,
    refresh: true
  });
  console.log('deleteDoc', JSON.stringify(result.body, null, '  '));
}

async function deleteDocByQuery() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_deletebyquery
  let result = await client.deleteByQuery({
    index,
    refresh: true,
    body: {
      query: {
        bool: {
          should: [{
              match: {
                id: 1,
              }
            },
            {
              match: {
                id: 2,
              }
            }
          ]
        }
      }
    }
  });
  console.log('deleteDocByQuery', JSON.stringify(result.body, null, '  '));
}

async function deleteAllDoc() {
  let result = await client.deleteByQuery({
    index,
    refresh: true,
    body: {
      query: {
        match_all: {}
      }
    }
  });
  console.log('deleteAllDoc', JSON.stringify(result.body, null, '  '));
}

function getList(count) {
  let list = [];
  for (let i = 0; i < count; i++) {
    list.push(i + 1);
  }
  return list;
}

function talent(pgId) {
  pgId = pgId || faker.random.number();
  return {
    id: pgId,
    firstName: faker.name.firstName(),
    lastName: faker.name.lastName(),
    email: faker.internet.email(),
    age: faker.random.number(),
    weight: faker.random.number() + parseFloat(Math.random().toFixed(3)),
    bio: faker.lorem.paragraphs(),
    keyword: [faker.random.words(), faker.random.words(), faker.random.words(), faker.random.words()],
    isActive: faker.random.boolean(),
    dateOfBirth: faker.date.past(),
    createdAt: faker.date.past(),
    company: companyList({})
  };
}

function companyList({
  count = 2
}) {
  let list = [];
  for (let i = 0; i <= count; i++) {
    list.push(company(i));
  }
  return list;
}

function company() {
  return {
    name: faker.company.companyName(),
    url: faker.internet.url(),
    industry: industryList({})
  };
}

function industryList({
  count = 2
}) {
  let list = [];
  for (let i = 0; i <= count; i++) {
    list.push(industry(i));
  }
  return list;
}

function industry() {
  return {
    name: faker.random.words(),
    category: faker.random.word(),
  };
}