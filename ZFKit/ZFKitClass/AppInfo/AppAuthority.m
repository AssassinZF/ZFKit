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

+(BOOL)applyPhotoAuthorization{
    __block BOOL isAllow = NO;
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        if (status == PHAuthorizationStatusAuthorized) {
            isAllow = YES;
        }
    }];
    return isAllow;
}

+(BOOL)applyVideoAVAuthorization{
    __block BOOL isAllow = NO;
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {//相机权限
        if (granted) {
            isAllow = YES;
        }else{
            NSLog(@"Denied or Restricted");
        }
    }];
    return isAllow;
}

+(BOOL)applyAudioAVAuthorization{
    __block BOOL isAllow = NO;
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {//麦克风权限
        if (granted) {
            isAllow = YES;
            NSLog(@"Authorized");
        }else{
            NSLog(@"Denied or Restricted");
        }
    }];
    
    return isAllow;
}

+(void)applyLocationAuthorization{
    CLLocationManager *manager = [[CLLocationManager alloc] init];
    [manager requestAlwaysAuthorization];//一直获取定位信息
    [manager requestWhenInUseAuthorization];//使用的时候获取定位信息
    //代理方法中检查定位权限的改动
}

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
