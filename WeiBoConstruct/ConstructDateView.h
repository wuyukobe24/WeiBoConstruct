//
//  ConstructDateView.h
//  VCHelper
//
//  Created by WangXueqi on 17/6/30.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "BaseView.h"

@interface ConstructDateView : BaseView
@property(nonatomic,strong)UILabel * dayLabel;
@property(nonatomic,strong)UILabel * weekLabel;
@property(nonatomic,strong)UILabel * dateLabel;

- (void)creatDateView;
@end
