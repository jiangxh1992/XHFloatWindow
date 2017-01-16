//
//  XHFloatWindowSingleton.h
//  XHFloatingWindow
//
//  Created by Xinhou Jiang on 14/1/17.
//  Copyright © 2017年 Xinhou Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CallBack)();

@class XHFloatWindowController;
@interface XHFloatWindowSingleton : NSObject

@property (nonnull, nonatomic, strong) XHFloatWindowController *floatVC;
@property (nullable, nonatomic, copy)CallBack floatWindowCallBack;

- (void)xh_addWindowOnTarget: (nonnull id)target onClick:(nullable void(^)())callback;
- (void)xh_setWindowSize:(float)size;
- (void)xh_setHideWindow:(BOOL)hide;
- (void)xh_setBackgroundImage:(nullable NSString *)imageName forState:(UIControlState)UIControlState;

+ (nonnull instancetype)Ins;

@end
