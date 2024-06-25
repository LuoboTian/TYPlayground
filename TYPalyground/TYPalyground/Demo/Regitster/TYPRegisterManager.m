//
//  TYPRegister.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/15.
//

#import "TYPRegisterManager.h"

#pragma mark - 注册元类
@implementation TYPRegisterCell

@end



#pragma mark - 注册管理类
@interface TYPRegisterManager ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, TYPRegisterCell*> *featureInfo;

@end



@implementation TYPRegisterManager

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static TYPRegisterManager *typRegister = nil;
    dispatch_once(&onceToken, ^{
        typRegister = [[TYPRegisterManager alloc] init];
        typRegister.featureInfo = [NSMutableDictionary dictionary];
    });
    return typRegister;
}


- (void)registerCommand:(Class<TYPViewControllerInterface>) viewControllerClass{
    @synchronized (self) {
        NSAssert(viewControllerClass != nil,  @"ViewControllerClass should not be null");
        NSString *key = NSStringFromClass([viewControllerClass class]);
        if ([viewControllerClass conformsToProtocol:@protocol(TYPViewControllerInterface)]) {
            if ([_featureInfo.allKeys containsObject:key]){
                NSAssert([[_featureInfo objectForKey:key] class] == viewControllerClass, @"repeat register bridge name:%@ with different object", key);
                NSAssert([[_featureInfo objectForKey:key] class] != viewControllerClass, @"repeat register bridge name:%@", key);
            } else {
                TYPRegisterCell *cell = [TYPRegisterCell new];
                cell.class = viewControllerClass;
                if ( [viewControllerClass performSelector:@selector(description)]) {
                    cell.title = [viewControllerClass description];
                } else {
                    cell.title = key;
                }
                [_featureInfo setObject:cell forKey:key];
            }
        } else {
            NSAssert(NO, @"viewController not confroms TYPViewControllerInterface protocol: %@", NSStringFromClass([viewControllerClass class]));
        }
        
    }
}


- (NSArray *)getViewControllerKeyList {
    return [_featureInfo allKeys];
}


- (TYPRegisterCell *)getViewControllerClassWithKey:(NSString *)key {
    return [_featureInfo objectForKey:key];
}


@end
