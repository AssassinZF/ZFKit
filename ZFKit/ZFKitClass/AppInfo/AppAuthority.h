//
//  AppAuthority.h
//  ZFKit
//
//  Created by Daisy on 2017/12/16.
//  Copyright © 2017年 zf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>

typedef void(^ApplyAuthorizationResult)(BOOL isSuccess);

#warning 注意获取权限必须要在 info.plist 里面 包含相应权限KEY
/*
 <key>NSContactsUsageDescription</key>
 <string>请求访问通讯录</string>
 <key>NSMicrophoneUsageDescription</key>
 <string>请求访问麦克风</string>
 <key>NSPhotoLibraryUsageDescription</key>
 <string>请求访问相册</string>
 <key>NSCameraUsageDescription</key>
 <string>请求访问相机</string>
 <key>NSLocationAlwaysUsageDescription</key>
 <string>始终访问地理位置</string>
 <key>NSLocationWhenInUseUsageDescription</key>
 <string>在使用期间访问地理位置</string>
 <key>NSCalendarsUsageDescription</key>
 <string>请求访问日历</string>
 <key>NSRemindersUsageDescription</key>
 <string>请求访问注意事项</string>
 <key>NSBluetoothPeripheralUsageDescription</key>
 <string>请求访问蓝牙</string>
 */

@interface AppAuthority : NSObject

/**
 获取相册的授权状态

 @return status
 */
+(PHAuthorizationStatus)photoAuthorizationStatus;

/**
 apply PhotoAuthorization
 */
+(void)applyPhotoAuthorization:(ApplyAuthorizationResult)result;

//申请相机和麦克风权限
+(void)applyVideoAVAuthorization:(ApplyAuthorizationResult)result;
+(void)applyAudioAVAuthorization:(ApplyAuthorizationResult)result;

+(AVAuthorizationStatus)audioAuthorizationStatus;
+(AVAuthorizationStatus)videoAuthorizationStatus;

//定位权限
+(void)applyLocationAuthorization;
-(CLAuthorizationStatus)locationAuthorization;

//查看打印当前推送类型
+(void)lookPushNotificationType;

//通讯录权限
+(void)applyAddressBookAuthorization_iOS9later:(ApplyAuthorizationResult)result;//iOS9_later
+(void)applyAddressBookAuthorization:(ApplyAuthorizationResult)result;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
+(ABAuthorizationStatus)addressBookAuthorizationStatus;
#pragma clang diagnostic pop
@end
