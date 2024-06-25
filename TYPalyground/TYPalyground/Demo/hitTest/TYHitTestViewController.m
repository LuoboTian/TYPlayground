//
//  TYHitTestViewController.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/25.
//

#import "TYHitTestViewController.h"
#import "TYPRegisterManager.h"


@interface TYHitTestViewController () <TYPViewControllerInterface>

@end

@implementation TYHitTestViewController

+ (void)load {
    TYPViewControllerRegister([TYHitTestViewController class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
