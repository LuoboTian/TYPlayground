//
//  GestureView.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/23.
//

#import "GestureView.h"

#define BGViewWidth 300

@interface GestureView ()

// 存储选择的按钮
@property (nonatomic, strong) NSMutableArray <UIButton *> *selectedButtons;

//
@property (nonatomic, assign) CGPoint freePoint;

@end


@implementation GestureView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectedButtons = [[NSMutableArray alloc] init];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    CGFloat btnWH = 80;
    int columns = 3;
    int rows = 3;
    
    for (int i = 0; i < 9; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat x = (i%3) * btnWH + (i%3) * (BGViewWidth - columns * btnWH)/2;
        CGFloat y = (i/3) * btnWH + (i/3) * (BGViewWidth - rows * btnWH)/2;
        button.frame = CGRectMake(x, y, btnWH, btnWH);
        button.tag = i;
        [button setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        button.userInteractionEnabled = NO;
        [self addSubview:button];
    }
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
        
    if (self.selectedButtons.count <= 0) {
        return ;
    }
    for (NSUInteger index = 0; index < self.selectedButtons.count; index++) {
        UIButton *button = self.selectedButtons[index];
        if (index == 0) {
            [path moveToPoint:button.center];
        }else{
            [path addLineToPoint:button.center];
        }
    }
    [path addLineToPoint:self.freePoint];
    
    [[UIColor greenColor] set];
    [path setLineWidth:10];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path stroke];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint currentPoint = [self touchPointCurrentView:touches];
    UIButton *button = [self btnRectContainspoint:currentPoint];
    if (button && !button.selected) {
        button.selected = YES;
        [self.selectedButtons addObject:button];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint currentPoint = [self touchPointCurrentView:touches];
    UIButton *button = [self btnRectContainspoint:currentPoint];
    self.freePoint = currentPoint;
    if (button && !button.selected) {
        button.selected = YES;
        [self.selectedButtons addObject:button];
    }
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSMutableString *string = [NSMutableString string];
    for (UIButton *button in self.selectedButtons) {
        [string appendString:[NSString stringWithFormat:@"%zd",button.tag]];
        button.selected = NO;
    }
    NSLog(@"选中的是->%@",string);
    [self.selectedButtons removeAllObjects];
    [self setNeedsDisplay];
}


#pragma mark - private
- (CGPoint)touchPointCurrentView:(NSSet *)touches {
    UITouch *touch = [touches anyObject];
    return  [touch locationInView:self];
}


- (UIButton *)btnRectContainspoint:(CGPoint) point {
    for (UIButton *button in self.subviews) {
        if (CGRectContainsPoint(button.frame, point)) {
            return button;
        }
    }
    return  nil;
}
@end
