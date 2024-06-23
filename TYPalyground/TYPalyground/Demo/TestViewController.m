//
//  TestViewController.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/15.
//

#import "TestViewController.h"
#import "TYPRegister.h"

@interface TestViewController () <TYPViewControllerInterface>

@end

@implementation TestViewController

+ (void)load {
    TYPViewControllerRegister([TestViewController class]);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"haha");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    UIView *view = [UIView new];
    view.frame = CGRectMake(50, 40, 100, 100);
    view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view];
}


@end
