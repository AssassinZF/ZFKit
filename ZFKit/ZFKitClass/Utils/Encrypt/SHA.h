//
//  SHA.h
//  PACFB
//
//  Created by ZF on 15/1/21.
//  Copyright (c) 2015年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHA : NSObject
+(NSString *)digest_sha1:(NSString *)input;

+(NSString *)digest_sha256:(NSString *)input;

@end
