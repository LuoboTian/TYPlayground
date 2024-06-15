//
//  AppDelegate.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/15.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.


    //为整个程序创建一个UIWindow对象
    //整个程序中就一个UIWindw对象（默认一个，我们可以自己创建更多的但是绝大多数情况下不用）
    //UIScreen:含有屏幕的各种物理参数（类似于android中的DisplayMetrics）
    //UIWindow也是继承于UIView的，比较特殊。
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //根view控制器
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    self.window.rootViewController = navc;
    
    
    //使window有效并显示
    [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
