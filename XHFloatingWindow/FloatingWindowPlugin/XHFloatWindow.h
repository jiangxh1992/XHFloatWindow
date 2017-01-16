//
//  XHFloatWindow.h
//  XHFloatingWindow
//
//  Created by Xinhou Jiang on 14/1/17.
//  Copyright © 2017年 Xinhou Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XHFloatWindow : NSObject

/* add the floaitng window to the target and the callback block will be excuted when click the button */
+ (void)xh_addWindowOnTarget:(nonnull id)target onClick:(nullable void(^)())callback;
/* you can resize the view's size, 50 by default if you don't set it */
+ (void)xh_setWindowSize:(float)size;
/* you can hide the view or show it again */
+ (void)xh_setHideWindow:(BOOL)hide;
/* you can reset the button's background image of normal and selected states */
+ (void)xh_setBackgroundImage:(nullable NSString *)imageName forState:(UIControlState)UIControlState;

@end
