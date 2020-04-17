//
//  JsonTool.h
//  DynamicOC
//
//  Created by Hart on 2020/4/17.
//  Copyright © 2020 dKingbin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JsonTool : NSObject

//+ (NSDictionary *)toDict:(NSString *)string;
+ (NSDictionary *)toDict:(NSData *)string;

@end

NS_ASSUME_NONNULL_END
