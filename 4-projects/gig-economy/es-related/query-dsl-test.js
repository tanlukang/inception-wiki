const {
  Client
} = require('@elastic/elasticsearch');
const faker = require('faker');
const fs = require('fs');

const client = new Client({
  node: 'http://localhost:9200'
});

const index = 'talent-query';

(async () => {
  // await deleteIndex();
  // await createIndex();
  // await deleteAll();
  // await bulkCreate();
  await search();
  // await searchAll();
})();

async function search() {
  let queryKeyword = 'Investment';
  let result = await client.search({
    index,
    // 返回字段排除
    _source_excludes: ['email', 'phone'],
    // _source: ['email', 'dateOfBirth'],
    // 分页控制
    from: 0,
    size: 10,
    body: {
      query: {
        bool: {
          // 使用must的原因是，后续widget可能也有对特定字段的关键字搜索，到时候widget的关键字搜索和searchbar的搜索是`AND`的关系
          must: [
            // {
            //   "multi_match": {
            //     "query": queryKeyword,
            //     "fields": ["firstName", "lastName", "note", "keyword"],
            //     "fuzziness": 'AUTO',
            //     "prefix_length": 3,
            //   }
            // },
            // searchbar的关键字查询条件
            {
              bool: {
                // searchbar的关键字查询使用should，对多个字段分别进行搜索
                should: [{
                    match: {
                      firstName: {
                        "query": queryKeyword,
                        // 模糊匹配配置
                        "fuzziness": 'AUTO',
                        "prefix_length": 3,
                        // 权重配置，大于1表示加大权重，0-1表示减少权重
                        "boost": 3
                      },
                    }
                  },
                  {
                    match: {
                      lastName: {
                        "query": queryKeyword,
                        "fuzziness": 'AUTO',
                        "prefix_length": 3,
                      }
                    }
                  },
                  {
                    match: {
                      note: {
                        "query": queryKeyword,
                        "fuzziness": 'AUTO',
                        "prefix_length": 3,
                      }
                    }
                  },
                  {
                    match: {
                      keyword: {
                        "query": queryKeyword,
                        "fuzziness": 'AUTO',
                        "prefix_length": 3,
                      }
                    }
                  },
                ],
              }
            }
          ],
          // 过滤条件，目前只是全局的过滤条件，后续widget的过滤条件也往里塞
          filter: [{
              // 匹配的filter都用match，不管是text、keyword、boolean、int
              match: {
                state: {
                  query: true
                }
              }
            },
            // 匹配范围的filter使用range
            {
              range: {
                dateOfBirth: {
                  gte: '2019-07-21',
                  lte: '2019-10-21'
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
            },
            {
              match: {
                email: {
                  query: 'yahoo.com'
                }
              }
            }
          ],
          // minimum_should_match: 1,
        },
      },
    },
    // 排序，如果不设置sort默认按照_score从大到小排序
    "sort": [
      // ？对象形式的写法在sdk中不支持，需要查一下
      // {
      //   'firstName.raw': 'asc'
      // },
      // 由于text类型不能sort和aggs，因此text类型数据mapping增加fields，index时独立index出一个keyword类型的raw字段，处理sort和aggs的场景
      "firstName.raw:desc",
      "dateOfBirth:desc",
      "_score"
    ],
  });
  console.log(JSON.stringify(result.body, null, '  '));
}

async function searchAll() {
  let result = await client.search({
    index,
    body: {
      query: {
        match_all: {}
      }
    }
  });
  console.log(JSON.stringify(result.body, null, '  '));
}

async function createIndex() {
  var result = await client.indices.create({
    index,
    body: {
      "mappings": {
        "properties": {
          "firstName": {
            "type": "text",
            "fields": {
              "raw": {
                "type": "keyword"
              }
            }
          }
        }
      }
    }
  });
  // console.log(JSON.stringify(result.body, null, '  '));
}

async function deleteIndex() {
  var result = await client.indices.delete({
    index
  });
  // console.log(JSON.stringify(result.body, null, '  '));
}

async function deleteAll() {
  var result = await client.deleteByQuery({
    index,
    body: {
      query: {
        match_all: {}
      }
    }
  });
  // console.log(result);
}

async function bulkCreate() {
  let bulkBody = ``;
  let data = getList(4000);
  let jsonList = [];
  bulkBody = data.map((item, idx) => {
    let json = talent(idx);
    jsonList.push(json);
    let obj = {
      "action": {
        "create": {
          "_index": index,
          "_id": random()
        }
      },
      "value": json
    };
    return JSON.stringify(obj.action) + '\n' + JSON.stringify(obj.value);
  }).join('\n') + '\n';
  var result = await client.bulk({
    index,
    body: bulkBody
  });
  // console.log(JSON.stringify(result.body, null, '  '));
  fs.writeFileSync('./talent-query.json', JSON.stringify(jsonList, null, "\t"));
}

function getList(count) {
  let list = [];
  for (let i = 0; i < count; i++) {
    list.push(i);
  }
  return list;
}

function random(length) {
  let text = '';
  let possible = 'abcdefghijklmnopqrstuvwxyz';
  length = length || 10;
  for (let i = 0; i < length; i++)
    text += possible.charAt(Math.floor(Math.random() * possible.length));
  return text;
}

function talent(index) {
  return {
    firstName: faker.name.firstName(),
    lastName: faker.name.lastName(),
    email: faker.internet.email(),
    phone: faker.phone.phoneNumber(),
    dateOfBirth: faker.date.past(),
    avatar: faker.image.avatar(),
    note: faker.lorem.sentences(),
    state: index % 2 === 0,
    keyword: [faker.random.words(), faker.random.words(), faker.random.words(), faker.random.words(), faker.random.words()]
  };
}