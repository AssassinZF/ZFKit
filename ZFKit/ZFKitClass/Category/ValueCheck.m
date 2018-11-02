//
//  NSDictionary+ValueErrorCheck.m
//  MSZX
//
//  Created by ZF on 14/11/13.
//  Copyright (c) 2014年 ZF. All rights reserved.
//

#import "ValueCheck.h"

@implementation NSString (ValueCheck)

- (BOOL)isNotEmpty {
    return !!self.length;
}

@end

@implementation NSDictionary (ValueErrorCheck)

- (BOOL)isNotEmpty {
    return !!self.count;
}

- (id)objectCheckForKey:(id)key {
    NSValue *value = [self objectForKey:key];
    return !value ? @"" : value;
}

@end

@implementation NSArray (ValueCheck)

- (BOOL)isNotEmpty {
    return !!self.count;
}

@end
