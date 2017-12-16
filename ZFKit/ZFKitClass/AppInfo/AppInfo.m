//
//  AppInfo.m
//  ZFKit
//
//  Created by Daisy on 2017/12/16.
//  Copyright © 2017年 zf. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

+ (NSString *)appVersion
{
    NSString *versionValue = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return versionValue;
}

+ (NSString *)appBuildVersion
{
    NSString *versionValue = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return versionValue;
}

+ (NSString *)appBundleIdentifier
{
    static NSString * _identifier = nil;
    if (nil == _identifier)
    {
        _identifier = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    }
    
    return _identifier;
}

+ (NSString *)appDisplayName
{
    NSString *value = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    return value;
}


@end
