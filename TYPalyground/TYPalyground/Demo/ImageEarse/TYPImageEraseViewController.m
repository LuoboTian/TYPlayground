//
//  TYPImageEraseViewController.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/25.
//

#import "TYPImageEraseViewController.h"
#import "TYPRegisterManager.h"


@interface TYPImageEraseViewController () <TYPViewControllerInterface>

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TYPImageEraseViewController

+ (void)load {
    TYPViewControllerRegister([TYPImageEraseViewController class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 设置背景图
    UIImage *image = [UIImage imageNamed:@"image_erase_background"];
    _imageView = [[UIImageView alloc] initWithImage:image];
    // 启用监听列表
    _imageView.userInteractionEnabled = YES;
    
    // 处理手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureChange:)];
    [_imageView addGestureRecognizer:panGesture];
    
    [self.view addSubview:_imageView];

}


#pragma mark - 处理图片里的手势
// 图片区域擦除
- (void)panGestureChange:(UIPanGestureRecognizer *)pan {
    // 1 获取手势所在的点
    CGPoint position = [pan locationInView:_imageView];
    // 2 设定模糊区域为44*44
    CGFloat rectWH = 44;
    // 3 获取需要模糊的区域
    CGRect rect = CGRectMake(position.x - rectWH/2,
                             position.y - rectWH/2,
                             rectWH, rectWH);
    // 4 开启图片上下文，
    UIGraphicsBeginImageContextWithOptions(_imageView.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 5 将图片绘制到上下文中
    [_imageView.layer renderInContext:ctx];
    
    // 6 将手势所在区域裁截掉
    CGContextClearRect(ctx, rect);
    
    // 7 从当前上下文中得到图片
    UIImage *imageGot = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8 展示新图片
    _imageView.image = imageGot;
    
    // 9 关闭上下文
    UIGraphicsEndImageContext();
}



#pragma mark - TYPViewControllerInterface
+ (NSString *)description {
    return @"图片擦除";
}
@end
