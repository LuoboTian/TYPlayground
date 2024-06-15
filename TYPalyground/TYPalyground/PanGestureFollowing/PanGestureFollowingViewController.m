//
//  PanGestureFollowingViewController.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/15.
//

#import "PanGestureFollowingViewController.h"
#import "TYPRegister.h"


@interface PanGestureFollowingViewController () <TYPViewControllerInterface>

@end

@implementation PanGestureFollowingViewController

+ (void)load {
    TYPVireControllerRegister([PanGestureFollowingViewController class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor clearColor];
    
    UIView *view = [UIView new];
    view.frame = CGRectMake(20, 20, 40, 40);
    view.backgroundColor = [UIColor redColor];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:view];
}


@end
