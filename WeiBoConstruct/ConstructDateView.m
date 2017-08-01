//
//  ConstructDateView.m
//  VCHelper
//
//  Created by WangXueqi on 17/6/30.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ConstructDateView.h"
#import "NSDate+Calendar.h"
#import "UIColor+NSString.h"
#import "UIView+Extension.h"

#define K_ScreenWidth   CGRectGetWidth([[UIScreen mainScreen] bounds])// 当前屏幕宽
#define K_ScreenHeight  CGRectGetHeight([[UIScreen mainScreen] bounds])// 当前屏幕高
static ConstructDateView * constructDateView;
@implementation ConstructDateView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatDateView];
    }
    return self;
}

- (void)creatDateView{

    _dayLabel = [self addSubLabel:_dayLabel andFrame:CGRectMake(24, 0, 70, 56) andAlignment:NSTextAlignmentCenter andTextFont:47 andColor:[UIColor color:@"666666"] andText:@""];
    [self addSubview:_dayLabel];
    
    _weekLabel = [self addSubLabel:_weekLabel andFrame:CGRectMake(_dayLabel.right, 8, K_ScreenWidth/2, 20) andAlignment:NSTextAlignmentLeft andTextFont:13 andColor:[UIColor color:@"666666"] andText:@""];
    [self addSubview:_weekLabel];
    
    _dateLabel = [self addSubLabel:_dateLabel andFrame:CGRectMake(_dayLabel.right, _weekLabel.bottom, K_ScreenWidth/2, 20) andAlignment:NSTextAlignmentLeft andTextFont:13 andColor:[UIColor color:@"666666"] andText:@""];
    [self addSubview:_dateLabel];
    
    NSDate * date = [NSDate date];
    _dayLabel.text = date.getTodayDayString;
    _weekLabel.text = date.getWeekDayString;
    _dateLabel.text = date.getYearAndMonth;
    
}

@end
