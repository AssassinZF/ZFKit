//
//  ModuleDataProvider.m
//  ZFKit
//
//  Created by kris on 2018/11/2.
//  Copyright © 2018年 zf. All rights reserved.
//

#import "ModuleDataProvider.h"

@interface ModuleDataProvider()
@property (nonatomic, strong) NSMutableArray<id<SectionModule>> *modules;
@end

@implementation ModuleDataProvider

- (void)addModule:(id<SectionModule>)module atSection:(NSUInteger)section {
    
}

- (void)addModulesWithJSON:(NSDictionary *)json {
    
}

- (NSArray<id<SectionModule>> *)allModules {
    return self.modules;
}

- (void)removeAllModule {
    [self.modules removeAllObjects];
}

- (void)setModule:(id<SectionModule>)module atSection:(NSUInteger)section {
    NSParameterAssert(module);
    if (section < self.modules.count) {
        self.modules[section] = module;
    } else {
        [self.modules addObject:module];
    }

}

#pragma mark - private

- (id<SectionModule>)moduleWithType:(id)module{
    /*
     analysis
     custom type of module . add to self.modules
     */
    return nil;
}

@end
