//
//  PanGestureFollowingViewController.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/15.
//  手势移动

#import "PanGestureFollowingViewController.h"
#import "RedView.h"
#import "TYPRegisterManager.h"


@interface PanGestureFollowingViewController () <TYPViewControllerInterface>

@end

@implementation PanGestureFollowingViewController

+ (void)load {
    TYPViewControllerRegister([PanGestureFollowingViewController class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor clearColor];
    
    RedView *view = [RedView new];
    view.frame = CGRectMake(30, 100, 40, 40);
    view.backgroundColor = [UIColor redColor];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    view.userInteractionEnabled = YES;
    [self.view addSubview:view];
}

#pragma mark - TYPViewControllerInterface
+ (NSString *)description {
    return @"view 手势跟随";
}

@end
