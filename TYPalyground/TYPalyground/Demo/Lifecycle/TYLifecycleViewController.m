//
//  TYLifecycleViewController.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/18.
//
//  当前页面展示容器的生命周期

#import "TYLifecycleViewController.h"
#import "TYPRegisterManager.h"

#define TYLifecycleLog() \
    NSLog(@"%s, %s", __FILE_NAME__, __FUNCTION__);

@interface TYLifecycleViewController () <TYPViewControllerInterface>

@end

@implementation TYLifecycleViewController

+ (void)load {
    TYPViewControllerRegister([TYLifecycleViewController class]);
    TYLifecycleLog();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    TYLifecycleLog();
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    TYLifecycleLog();
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    TYLifecycleLog();
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    TYLifecycleLog();
}



@end
