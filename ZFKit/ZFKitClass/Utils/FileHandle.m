//
//  FileHandle.m
//  ZFKit
//
//  Created by Daisy on 2017/12/16.
//  Copyright © 2017年 zf. All rights reserved.
//

#import "FileHandle.h"
#import "CommonMacro.h"

#define AppHomeDir NSHomeDirectory()
#define AppResourceDir [[NSBundle mainBundle] resourcePath]
#define AppDocumentDir [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define AppCacheDir [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define AppTempDir NSTemporaryDirectory()


@implementation FileHandle

+ (NSString *)filePathAtResourceDir:(NSString *)fileName {
    return [AppResourceDir stringByAppendingPathComponent: fileName];
}

+ (NSString *)filePathAtDocumentDir:(NSString *)fileName {
    return [AppDocumentDir stringByAppendingPathComponent: fileName];
}

+ (NSString *)filePathAtCacheDir:(NSString *)fileName {
    return [AppCacheDir stringByAppendingPathComponent: fileName];
}

+ (NSString *)filePathAtTempDir:(NSString *)fileName {
    return [AppTempDir stringByAppendingPathComponent: fileName];
}

+ (BOOL)fileExistAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (BOOL)dirExistAtPath:(NSString *)path {
    BOOL isDir;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir] && isDir) {
        return YES;
    }
    return NO;
}

+ (BOOL)createFileAtPath:(NSString *)path {
    if (![[self class] fileExistAtPath:path]) {
        BOOL result = [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
        if (!result) {
            DLog(@"Create file(%@) error", path);
        }
        return result;
    } else {
        DLog(@"Create file(%@) failed: file exists", path);
        return YES;
    }
}

+ (BOOL)createDirAtPath:(NSString *)path {
    if (![[self class] dirExistAtPath:path]) {
        NSError *error;
        BOOL result = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (!result) {
            DLog(@"Create directory(%@) error: %@", path, error);
        }
        return result;
    } else {
        DLog(@"Create directory(%@) failed: directory exists", path);
        return YES;
    }
}

+ (BOOL)deleteFileAtPath:(NSString *)path {
    if ([[self class] fileExistAtPath:path]) {
        NSError *error;
        BOOL result = [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        if (!result) {
            DLog(@"Delete file(%@) error: %@", path, error);
        }
        return result;
    } else {
        DLog(@"Delete file(%@) failed: file does not exist", path);
    }
    return YES;
}

+ (BOOL)copyFileAtPath:(NSString *)srcPath toPath:(NSString *)destPath {
    if (![[self class] fileExistAtPath:srcPath]) {
        DLog(@"Copy file(%@) error: src file does not exist", srcPath);
        return NO;
    } else {
        NSError *error;
        BOOL result = [[NSFileManager defaultManager] copyItemAtPath:srcPath toPath:destPath error:&error];
        if (!result) {
            DLog(@"Copy file(%@) error: %@", srcPath, error);
        }
        return result;
    }
}

+ (BOOL)writeFileAtPath:(NSString *)srcPath withData:(NSData *)data {
    return [data writeToFile:srcPath atomically:YES];
}

+ (NSArray *)contentsOfDirectoryAtPath:(NSString *)path {
    NSError *error;
    NSArray *result = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    if (!result) {
        DLog(@"Get contents of directory(%@) error: %@", path, error);
    }
    return result;
}

+ (NSUInteger)sizeOfFileAtPath:(NSString *)path {
    NSError *error;
    NSUInteger size = [[[[NSFileManager defaultManager] attributesOfItemAtPath:path error:&error] objectForKey:NSFileSize] unsignedIntegerValue];
    if (error) {
        DLog(@"Get size of file(%@) error: %@", path, error);
    }
    return size;
}

+ (NSUInteger)sizeOfDirectoryAtPath:(NSString *)path {
    return [[self class] sizeOfDirectoryAtURL:[NSURL URLWithString:path]];
}

+ (NSUInteger)sizeOfDirectoryAtURL:(NSURL *)url {
    NSUInteger result = 0;
    NSArray *properties = [NSArray arrayWithObjects: NSURLLocalizedNameKey,
                           NSURLCreationDateKey, NSURLLocalizedTypeDescriptionKey, nil];
    
    NSArray *array = [[NSFileManager defaultManager]
                      contentsOfDirectoryAtURL:url
                      includingPropertiesForKeys:properties
                      options:(NSDirectoryEnumerationSkipsHiddenFiles)
                      error:nil];
    
    for (NSURL *fileSystemItem in array) {
        BOOL directory = NO;
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:[fileSystemItem path] isDirectory:&directory];
        if (isExist) {
            if (!directory) {
                result += [[self class] sizeOfFileAtPath:[fileSystemItem path]];
            } else {
                result += [self sizeOfDirectoryAtURL:fileSystemItem];
            }
        }
    }
    
    return result;
}

@end
