const {
  Client
} = require('@elastic/elasticsearch');
const faker = require('faker');
const fs = require('fs');

const client = new Client({
  node: 'http://localhost:9200'
});
const index = 'es-usage';

(async () => {
  // await createIndex();
  // await deleteIndex();
  // await reindex();

  // await updateMapping();
  // await getMapping();

  // await bulkCreateDoc();
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

async function reindex() {}

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
  let list = getList(10);
  let jsonList = [];
  bulkBody = list.map((item) => {
    let json = talent(item);
    jsonList.push(json);
    let obj = {
      'action': {
        'create': {
          '_index': index,
          '_id': faker.random.uuid()
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
  fs.writeFileSync('./talent.json', JSON.stringify(jsonList, null, '  '));
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
                id: 1,
                // _id: '81b6b5b5-1a48-486b-a6e2-bff190834ac1'
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

async function createDoc() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_create
  let result = await client.create({
    id: faker.random.uuid(),
    index,
    body: talent()
  });
  console.log('createDoc', JSON.stringify(result.body, null, '  '));
}

async function updateDoc() {
  // https://www.elastic.co/guide/en/elasticsearch/client/javascript-api/current/api-reference.html#_update
  let result = await client.update({
    id: '81b6b5b5-1a48-486b-a6e2-bff190834ac1',
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
    id: '81b6b5b5-1a48-486b-a6e2-bff190834ac1',
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
    createdAt: faker.date.past(),
  };
}