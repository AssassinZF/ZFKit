//
//  AppInfo.h
//  ZFKit
//
//  Created by Daisy on 2017/12/16.
//  Copyright © 2017年 zf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfo : NSObject
+ (NSString *)appVersion;//版本
+ (NSString *)appBundleIdentifier;//Identifier
+ (NSString *)appDisplayName;//APP name
@end
