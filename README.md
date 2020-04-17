[中文介绍](https://github.com/dKingbin/DynamicOC/blob/master/README-chs.md) | [原理介绍](https://github.com/dKingbin/DynamicOC/blob/master/principle_chs.md)

## DynamicOC
A hotfix library based on flex/yacc. You can call any Objective-C class and method using DynamicOC.
DynamicOC is functionally similar to [JSPath](https://github.com/bang590/JSPatch), but it only needs to write native OC syntax to implement hotfix.

## Usage
# Step1 Add hot code when app startup, it will finish injection.

Here is the sample
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self fetchHotfixCode];    
    return YES;
}

- (void)fetchHotfixCode{    
    //本地服务器搭建https://www.perfect.org/docs/index_zh_CN.html    
    //    
    __block BOOL processed = false;   
    __block NSDictionary *jsonDict = nil;    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:8181"];    
    NSURLSession *session = [NSURLSession sharedSession];    
    NSURLSessionDataTask *netTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {        
        NSLog(@"Get请求返回的响应信息：%@", data);        
        jsonDict = [JsonTool toDict:data];        
        processed = true;    
    }];    
    [netTask resume];
    
    while (!processed) {        
        [NSThread sleepForTimeInterval:0];    
    }    
    
    if (jsonDict.count > 0) {        
        NSString *argsRow = [jsonDict valueForKey:@"args"];        
        NSArray *args = @[];        
        if (argsRow.length > 0) {            
            args = [argsRow componentsSeparatedByString:@","];        
        }        
    if (!args) {            
        args = @[];        
    }                
    
    [DynamicOCAPI hookClass:[jsonDict valueForKey:@"class"] 
                selector:[jsonDict valueForKey:@"selector"]              
                argNames:args                   
                    isClass:[[jsonDict valueForKey:@"isClass"] boolValue]        
                    implementation:[jsonDict valueForKey:@"hotcode"]];    
    }
}
```

# Step2 Add a localserver

* Just clone https://github.com/Water-bamboo/DynamicOCServer.git
cd $project
swift build
.build/debug/PerfectTemplate
 This is a server project based Perfect.(https://www.perfect.org/docs/gettingStarted_zh_CN.html)

* Replace your code to OCHotfixString.hot_hotcode.
