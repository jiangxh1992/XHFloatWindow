# XHFloatWindow
slight floating window plugin for iOS apps

```objc
//
//  ViewController.m
//  XHFloatingWindow
//
//  Created by Xinhou Jiang on 14/1/17.
//  Copyright © 2017年 Xinhou Jiang. All rights reserved.
//

#import "ViewController.h"
#import "XHFloatWindow.h"
/** import the  XHFloatWindow header file and recall the class methods directly 
 * from now on, there are mianly 4 interfaces, namely xh_addWindowOnTarget,xh_setWindowSize and xh_setHideWindow
 * 1.xh_addWindowOnTarget: add the floaitng window to the target and the callback block will be excuted when click the button
 * 2.xh_setWindowSize: you can resize the view's size, 50 by default if you don't set it
 * 3.xh_setHideWindow: you can hide the view or show it again
 * 4.xh_setBackgroundImage: you can reset the button's background image of normal and selected states
 */

@interface ViewController ()

@end

@implementation ViewController

/**
 * sdk interface test demo
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.add floating button
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [XHFloatWindow xh_addWindowOnTarget:self onClick:^{
            
            // do something after floatingbutton clicked...
            NSLog(@"Floating button clicked!!!");
        }];
    });
    
    // 2.resize the button after 2 secs
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [XHFloatWindow xh_setWindowSize:100];
    });
    
    // 3.hide or not test
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [XHFloatWindow xh_setHideWindow:YES];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [XHFloatWindow xh_setHideWindow:NO];
    });
    
    // 4.reset the background image
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [XHFloatWindow xh_setBackgroundImage:@"default_normal" forState:UIControlStateSelected];
        [XHFloatWindow xh_setBackgroundImage:@"default_selected" forState:UIControlStateNormal];
    });

}

@end

```
