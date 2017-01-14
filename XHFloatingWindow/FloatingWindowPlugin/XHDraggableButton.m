//
//  XHDraggableButton.m
//  XHFloatingWindow
//
//  Created by Xinhou Jiang on 14/1/17.
//  Copyright © 2017年 Xinhou Jiang. All rights reserved.
//

#import "XHDraggableButton.h"

#define xh_ScreenH [UIScreen mainScreen].bounds.size.height
#define xh_ScreenW [UIScreen mainScreen].bounds.size.width

@interface XHDraggableButton()

@property (nonatomic, assign)CGPoint touchStartPosition;

@end

@implementation XHDraggableButton

typedef NS_ENUM(NSInteger ,xh_FloatWindowDirection) {
    xh_FloatWindowLEFT,
    xh_FloatWindowRIGHT,
    xh_FloatWindowTOP,
    xh_FloatWindowBOTTOM
};

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.touchStartPosition = [touch locationInView:_rootView];
    self.touchStartPosition = [self ConvertDir:_touchStartPosition];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint curPoint = [touch locationInView:_rootView];
    curPoint = [self ConvertDir:curPoint];
    self.superview.center = curPoint;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint curPoint = [touch locationInView:_rootView];
    curPoint = [self ConvertDir:curPoint];
    // if the start touch point is too close to the end point, take it as the click event and notify the click delegate
    if (pow((_touchStartPosition.x - curPoint.x),2) + pow((_touchStartPosition.y - curPoint.y),2) < 1) {
        [self.buttonDelegate dragButtonClicked:self];
        return;
    }

    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    CGFloat W = xh_ScreenW;
    CGFloat H = xh_ScreenH;
    if (orientation == UIInterfaceOrientationLandscapeRight||orientation ==UIInterfaceOrientationLandscapeLeft) {
        W = xh_ScreenH;
        H = xh_ScreenW;
    }
    // distances to the four screen edges
    CGFloat left = curPoint.x;
    CGFloat right = W - curPoint.x;
    CGFloat top = curPoint.y;
    CGFloat bottom = H - curPoint.y;
    // find the direction to go
    xh_FloatWindowDirection minDir = xh_FloatWindowLEFT;
    CGFloat minDistance = left;
    if (right < minDistance) {
        minDistance = right;
        minDir = xh_FloatWindowRIGHT;
    }
    if (top < minDistance) {
        minDistance = top;
        minDir = xh_FloatWindowTOP;
    }
    if (bottom < minDistance) {
        minDir = xh_FloatWindowBOTTOM;
    }
    
    switch (minDir) {
        case xh_FloatWindowLEFT: {
            [UIView animateWithDuration:0.3 animations:^{
                self.superview.center = CGPointMake(self.superview.frame.size.width/2, self.superview.center.y);
            }];
            break;
        }
        case xh_FloatWindowRIGHT: {
            [UIView animateWithDuration:0.3 animations:^{
                self.superview.center = CGPointMake(W - self.superview.frame.size.width/2, self.superview.center.y);
            }];
            break;
        }
        case xh_FloatWindowTOP: {
            [UIView animateWithDuration:0.3 animations:^{
                self.superview.center = CGPointMake(self.superview.center.x, self.superview.frame.size.height/2);
            }];
            break;
        }
        case xh_FloatWindowBOTTOM: {
            [UIView animateWithDuration:0.3 animations:^{
                self.superview.center = CGPointMake(self.superview.center.x, H - self.superview.frame.size.height/2);
            }];
            break;
        }
        default:
            break;
    }
}

- (CGPoint)UpsideDown:(CGPoint)p {
    return CGPointMake(xh_ScreenW - p.x, xh_ScreenH - p.y);
}

- (CGPoint)LandscapeLeft:(CGPoint)p {
    return CGPointMake(p.y, xh_ScreenW - p.x);
}

- (CGPoint)LandscapeRight:(CGPoint)p {
    return CGPointMake(xh_ScreenH - p.y, p.x);
}

/**
 *  convert to the origin coordinate
 */
- (CGPoint)ConvertDir:(CGPoint)p {
    // 获取屏幕方向
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    switch (orientation) {
        case UIInterfaceOrientationLandscapeLeft:
            return [self LandscapeLeft:p];
            break;
        case UIInterfaceOrientationLandscapeRight:
            return [self LandscapeRight:p];
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            return [self UpsideDown:p];
            break;
        default:
            return p;
            break;
    }
}

@end
