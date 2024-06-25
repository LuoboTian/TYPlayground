//
//  RedView.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/15.
//

#import "RedView.h"

@implementation RedView

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint previousPoint = [touch previousLocationInView:self];
    self.transform = CGAffineTransformTranslate(self.transform,
                                                currentPoint.x - previousPoint.x,
                                                currentPoint.y - previousPoint.y);
}

@end
