//
//  NineGridGestureViewController.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/23.
//  模仿手势九宫格解锁

#import "NineGridGestureViewController.h"
#import "GestureView.h"
#import "TYPRegister.h"

@interface NineGridGestureViewController () <TYPViewControllerInterface>

@end

@implementation NineGridGestureViewController

+ (void)load {
    TYPViewControllerRegister([NineGridGestureViewController class]);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];

    GestureView *gestureView = [[GestureView alloc] 
                                initWithFrame:CGRectMake(
                                                         (self.view.frame.size.width - 300)/2,
                                                         (self.view.frame.size.height - 300)/2,
                                                         300, 300)];
    [self.view addSubview:gestureView];
}

@end
