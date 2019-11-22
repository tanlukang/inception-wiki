# Postman auto test
## 1.Environments
##### 如果需要登录的接口，可以通过设置环境变量的方式，将登录接口返回的token绑定到环境变量{{token}}
```
if (responseCode.code == 200) {
    var jsonData = JSON.parse(responseBody);
    tests["status is good"] = jsonData.status === 'success';
    pm.environment.set("token", jsonData.data.token);
} else {
     tests["status is good"] = false;
}
pm.environment.unset("token");
```

## 2.Validate
##### 返回参数校验只列举了部分数据，还有很多功能待发掘
```
var schema = {
	"type" : "object",
	"required" : ["title", "url"],
	"properties" : {
		"title" : { "type" : "string"},
		"clicks" : { "type" : "number"},
		"childNode" : { "type" : "object"},
		"url" : { "type" : "string", "pattern" : /(http|ftp|https):\/\/[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:\/~+#-]*[\w@?^=%&amp;\/~+#-])?/ },
		"city" : { "enum" : ["beijing","shanghai"]}
	}
}
var data = {'title':'hello world', 'url':'http:www.baidu.com'};

pm.test('Schema is valid', function() {
  pm.expect(tv4.validate(data, schema)).to.be.true;
  console.log(tv4.error);
});
```
## 3.RUN test
##### 单个api测试用例编写
![avatar](https://image-static.segmentfault.com/470/240/470240710-5729648a3591e)
##### 批量接口测试
![avatar](https://image-static.segmentfault.com/268/104/268104085-572964941bc26)



## Link
整体介绍：https://segmentfault.com/a/1190000005055899   
官网举例: https://learning.getpostman.com/docs/postman/scripts/test-examples/   
tv4 & postman: https://medium.com/skillhive/json-schema-validation-in-postman-using-external-json-files-2f3f0741800f
