//
//  JsonTool.m
//  DynamicOC
//
//  Created by Hart on 2020/4/17.
//  Copyright © 2020 dKingbin. All rights reserved.
//

#import "JsonTool.h"

@implementation JsonTool

+ (NSDictionary *)toDict:(NSData *)netResult
{
    if (!netResult) return nil;
    NSString *resultToString = [[NSString alloc] initWithData:netResult encoding:NSUTF8StringEncoding];
    if (!resultToString) {
        return nil;
    }

    NSData *jsonData = [resultToString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                       options:NSJSONReadingMutableContainers
                                                         error:&err];
   if(err) {
       NSLog(@"hotfixserver:: >> %@",err);
       return nil;
   }
   return dic;
}

@end
