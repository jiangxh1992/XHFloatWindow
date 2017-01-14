//
//  XHFloatWindow.m
//  XHFloatingWindow
//
//  Created by Xinhou Jiang on 14/1/17.
//  Copyright © 2017年 Xinhou Jiang. All rights reserved.
//

#import "XHFloatWindow.h"
#import "XHFloatWindowSingleton.h"

@interface XHFloatWindow ()

@end

@implementation XHFloatWindow

+ (void)xh_addWindowOnTarget:(UIViewController *)target onClick:(void (^)())callback {
    [[XHFloatWindowSingleton Ins] xh_addWindowOnTarget:target onClick:callback];
}

+ (void)xh_setWindowSize:(float)size {
    [[XHFloatWindowSingleton Ins] xh_setWindowSize:size];
}

+ (void)xh_setHideWindow:(BOOL)hide {
    [[XHFloatWindowSingleton Ins] xh_setHideWindow:hide];
}

+ (void)xh_setBackgroundImage:(NSString *)imageName forState:(UIControlState)UIControlState {
    [[XHFloatWindowSingleton Ins] xh_setBackgroundImage:imageName forState:UIControlState];
}

@end
