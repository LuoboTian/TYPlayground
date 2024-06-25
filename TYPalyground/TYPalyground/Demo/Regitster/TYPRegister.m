//
//  TYPRegister.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/15.
//

#import "TYPRegister.h"

@interface TYPRegister ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, Class<TYPViewControllerInterface>>* featureInfo;

@end


@implementation TYPRegister

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static TYPRegister *typRegister = nil;
    dispatch_once(&onceToken, ^{
        typRegister = [[TYPRegister alloc] init];
        typRegister.featureInfo = [NSMutableDictionary dictionary];
    });
    return typRegister;
}


- (void)registerCommand:(Class<TYPViewControllerInterface>) viewControllerClass {
    @synchronized (self) {
        NSAssert(viewControllerClass != nil,  @"ViewControllerClass should not be null");
        NSString *key = NSStringFromClass([viewControllerClass class]);
        if ([viewControllerClass conformsToProtocol:@protocol(TYPViewControllerInterface)]) {
            if ([_featureInfo.allKeys containsObject:key]){
                NSAssert([_featureInfo objectForKey:key] == viewControllerClass, @"repeat register bridge name:%@ with different object", key);
                NSAssert([_featureInfo objectForKey:key] != viewControllerClass, @"repeat register bridge name:%@", key);
            } else {
                [_featureInfo setObject:viewControllerClass forKey:key];
            }
        } else {
            NSAssert(NO, @"viewController not confroms TYPViewControllerInterface protocol: %@", NSStringFromClass([viewControllerClass class]));
        }
        
    }
}


- (NSArray *)getViewControllerKeyList {
    return [_featureInfo allKeys];
}


- (Class<TYPViewControllerInterface>)getViewControllerClassWithKey:(NSString *)key {
    return [_featureInfo objectForKey:key];
}


@end
