//
//  AppAuthority.m
//  ZFKit
//
//  Created by Daisy on 2017/12/16.
//  Copyright © 2017年 zf. All rights reserved.
//

#import "AppAuthority.h"
#import "CommonMacro.h"
@implementation AppAuthority

+(void)applyPhotoAuthorization:(ApplyAuthorizationResult)result{
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        result(status == PHAuthorizationStatusAuthorized);
    }];
}

+(void)applyVideoAVAuthorization:(ApplyAuthorizationResult)result{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {//相机权限
        result(granted);
    }];
}

+(void)applyAudioAVAuthorization:(ApplyAuthorizationResult)result{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {//麦克风权限
        result(granted);
    }];
}

+(void)applyLocationAuthorization{
    CLLocationManager *manager = [[CLLocationManager alloc] init];
    [manager requestAlwaysAuthorization];//一直获取定位信息
    [manager requestWhenInUseAuthorization];//使用的时候获取定位信息
    //代理方法中检查定位权限的改动
}

+(void)applyAddressBookAuthorization_iOS9later:(ApplyAuthorizationResult)result{
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        result(granted);
    }];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

+(void)applyAddressBookAuthorization:(ApplyAuthorizationResult)result{
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
        result(granted);
        CFRelease(addressBook);
    });
}

+(ABAuthorizationStatus)addressBookAuthorizationStatus{
    ABAuthorizationStatus ABstatus = ABAddressBookGetAuthorizationStatus();
    switch (ABstatus) {
            case kABAuthorizationStatusAuthorized:
            return kABAuthorizationStatusAuthorized;
            break;
            case kABAuthorizationStatusDenied:
            return kABAuthorizationStatusDenied;
            break;
            case kABAuthorizationStatusNotDetermined:
            return kABAuthorizationStatusNotDetermined;
            break;
            case kABAuthorizationStatusRestricted:
            return kABAuthorizationStatusRestricted;
            break;
        default:
            break;
    }
}

+(void)lookPushNotificationType{
    UIUserNotificationSettings *settings = [[UIApplication sharedApplication] currentUserNotificationSettings];
    switch (settings.types) {
            case UIUserNotificationTypeNone:
            DLog(@"None");
            break;
            case UIUserNotificationTypeAlert:
            DLog(@"Alert Notification");
            break;
            case UIUserNotificationTypeBadge:
            DLog(@"Badge Notification");
            break;
            case UIUserNotificationTypeSound:
            DLog(@"sound Notification'");
            break;
        default:
            break;
    }
}
#pragma clang diagnostic pop

+(CLAuthorizationStatus)locationAuthorization{
    CLAuthorizationStatus CLstatus = [CLLocationManager authorizationStatus];
    switch (CLstatus) {
            case kCLAuthorizationStatusAuthorizedAlways:
            NSLog(@"Always Authorized");
            return kCLAuthorizationStatusAuthorizedAlways;
            break;
            case kCLAuthorizationStatusAuthorizedWhenInUse:
            NSLog(@"AuthorizedWhenInUse");
            return kCLAuthorizationStatusAuthorizedWhenInUse;
            break;
            case kCLAuthorizationStatusDenied:
            NSLog(@"Denied");
            return kCLAuthorizationStatusDenied;
            break;
            case kCLAuthorizationStatusNotDetermined:
            NSLog(@"not Determined");
            return kCLAuthorizationStatusNotDetermined;
            break;
            case kCLAuthorizationStatusRestricted:
            NSLog(@"Restricted");
            return kCLAuthorizationStatusRestricted;
            break;
        default:
            break;
    }
}

+(AVAuthorizationStatus)audioAuthorizationStatus{
    return [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];//麦克风权限
}

+(AVAuthorizationStatus)videoAuthorizationStatus{
    return [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];//相机权限
}

+(PHAuthorizationStatus)photoAuthorizationStatus{
    PHAuthorizationStatus photoAuthorStatus = [PHPhotoLibrary authorizationStatus];
    switch (photoAuthorStatus) {
            case PHAuthorizationStatusAuthorized:
            DLog(@"Authorized");
            return PHAuthorizationStatusAuthorized;
            break;
            case PHAuthorizationStatusDenied:
            DLog(@"Denied");
            return PHAuthorizationStatusDenied;
            break;
            case PHAuthorizationStatusNotDetermined:
            DLog(@"not Determined");
            return PHAuthorizationStatusNotDetermined;
            break;
            case PHAuthorizationStatusRestricted:
            DLog(@"Restricted")
            return PHAuthorizationStatusRestricted;
            break;
        default:
            break;
    }
}
@end
