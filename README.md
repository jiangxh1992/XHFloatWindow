# XHFloatWindow
slight floating window plugin for iOS apps

![](http://img.blog.csdn.net/20161110170919449?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

Demo:

```objc
//
//  RootViewController.m
//  XHFloatingWindow
//
//  Created by Xinhou Jiang on 29/5/2017.
//  Copyright © 2017 Xinhou Jiang. All rights reserved.
//

#import "RootViewController.h"
#import "XHFloatWindow.h"

/** import the  XHFloatWindow header file and recall the class methods directly
 * from now on, there are mianly 4 interfaces, namely xh_addWindowOnTarget,xh_setWindowSize and xh_setHideWindow
 * 1.xh_addWindowOnTarget: add the floaitng window to the target and the callback block will be excuted when click the button
 * 2.xh_setWindowSize: you can resize the view's size, 50 by default if you don't set it
 * 3.xh_setHideWindow: you can hide the view or show it again
 * 4.xh_setBackgroundImage: you can reset the button's background image under normal and selected states
 */

@interface RootViewController ()

@end

@implementation RootViewController

/**
 * sdk interface test demo
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
}

-(void)viewDidAppear:(BOOL)animated {
    
    // 1.add floating button
    [XHFloatWindow xh_addWindowOnTarget:self onClick:^{
        // do something after floating button clicked...
        NSLog(@"Floating button clicked!!!");
    }];
    
    // 2.hide or not test
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [XHFloatWindow xh_setHideWindow:YES];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [XHFloatWindow xh_setHideWindow:NO];
    });
    
    // 3.resize the button after 2 secs
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [XHFloatWindow xh_setWindowSize:60];
    });
    
    // 4.reset the background image for normal and selected state
    //[XHFloatWindow xh_setBackgroundImage:@"default_normal" forState:UIControlStateSelected];
    //[XHFloatWindow xh_setBackgroundImage:@"default_normal" forState:UIControlStateNormal];
}

@end
```


Plus:此悬浮窗使用UIWindow实现，用于实现绝对置顶的效果，保证悬浮窗永远位于最顶部。如果只需要将悬浮窗悬浮在某一个视图上，可被遮盖，可以考虑直接使用UIButton实现。