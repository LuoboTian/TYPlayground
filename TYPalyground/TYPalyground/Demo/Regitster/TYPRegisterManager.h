//
//  TYPRegister.h
//  TYPalyground
//
//  Created by yu tian on 2024/6/15.
//

#import <Foundation/Foundation.h>

#define TYPViewControllerRegister(VIEWCONTROLLER) \
    [[TYPRegisterManager shared] registerCommand:VIEWCONTROLLER];

NS_ASSUME_NONNULL_BEGIN

@protocol TYPViewControllerInterface <NSObject>

@optional
// 在列表里展示中文名称，默认使用类名显示
+ (NSString *)description;

@end


// 注册元类
@interface TYPRegisterCell : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) Class<TYPViewControllerInterface> class;

@end


// 注册管理类
@interface TYPRegisterManager : NSObject

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
- (TYPRegisterCell *)getViewControllerClassWithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
