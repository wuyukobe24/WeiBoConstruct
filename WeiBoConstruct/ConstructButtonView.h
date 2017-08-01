//
//  ConstructButtonView.h
//  VCHelper
//
//  Created by WangXueqi on 17/6/30.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "BaseView.h"

@interface ConstructButtonView : BaseView
@property(nonatomic,strong)UIButton * calendarButton;
@property(nonatomic,strong)UIButton * projectButton;
@property(nonatomic,strong)UIButton * photoButton;
@property(nonatomic,strong)UIButton * soundButton;
@property(nonatomic,strong)UIButton * recordButton;
@property(nonatomic,strong)UIButton * cancelButton;
@property(nonatomic,copy)void(^constructBlock)(NSInteger ,BOOL);//Bool表示是否取消选择

- (void)openConstructButtonLocation;
- (void)closeConstructButtonLocation;
- (void)cancelButtonClick:(UIButton *)sender;

@end
