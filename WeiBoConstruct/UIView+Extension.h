//
//  UIView+Extension.h
//  VCHelper
//
//  Created by WangXueqi on 16/12/14.
//  Copyright © 2016年 JingBei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);
@interface UIView (Extension)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;
@property (assign, nonatomic) CGFloat bottom;
@property (assign, nonatomic) CGFloat right;

- (UIImage *)snapshot;

//获取当前视图所在的视图控制器
- (UIViewController *) viewController;

//删除当前视图内的所有子视图
- (void) removeChildViews;

//给视图添加点按事件
- (void)addTapActionWithBlock:(GestureActionBlock)block;

//给视图添加长按事件
- (void)addLongPressActionWithBlock:(GestureActionBlock)block;

@end
