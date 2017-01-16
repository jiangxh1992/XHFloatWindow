//
//  XHDraggableButton.h
//  XHFloatingWindow
//
//  Created by Xinhou Jiang on 14/1/17.
//  Copyright © 2017年 Xinhou Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * to avoid event collision between button click and pan,here touch event is adopted 
 * to deal with both click and pan event
 */
@protocol UIDragButtonDelegate <NSObject>

- (void)dragButtonClicked:(UIButton *)sender;

@end

@interface XHDraggableButton : UIButton

@property (nonatomic, strong)UIView *rootView;
@property (nonatomic, weak)id<UIDragButtonDelegate>buttonDelegate;
@property (nonatomic, assign)UIInterfaceOrientation initOrientation;
@property (nonatomic, assign)CGAffineTransform originTransform;

- (void)buttonRotate;

@end
