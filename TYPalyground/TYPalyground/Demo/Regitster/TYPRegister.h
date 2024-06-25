//
//  TYPRegister.h
//  TYPalyground
//
//  Created by yu tian on 2024/6/15.
//

#import <Foundation/Foundation.h>

#define TYPViewControllerRegister(VIEWCONTROLLER) \
    [[TYPRegister shared] registerCommand:VIEWCONTROLLER];

NS_ASSUME_NONNULL_BEGIN

@protocol TYPViewControllerInterface <NSObject>

@optional
- (void)title;

@end


@interface TYPRegister : NSObject

+ (instancetype)shared;

/// 注册容器
/// - Parameters:
///   - viewControllerClass: 容器类
///   - key: 容器的key
- (void)registerCommand:(Class<TYPViewControllerInterface>) viewControllerClass;

/// 获取注册的容器列表
- (NSArray *)getViewControllerKeyList;

/// 根据key，获取其注册的容器类
/// - Parameter key: key
- (Class<TYPViewControllerInterface>)getViewControllerClassWithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
