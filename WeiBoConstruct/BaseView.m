//
//  BaseView.m
//  VCHelper
//
//  Created by WangXueqi on 16/12/10.
//  Copyright © 2016年 JingBei. All rights reserved.
//

#import "BaseView.h"
@implementation BaseView

-(UILabel *)addSubLabel:(UILabel*)label
              andFrame:(CGRect)frame
          andAlignment:(NSTextAlignment)textAlignment
           andTextFont:(NSInteger)Font andColor:(UIColor*)color
               andText:(NSString*)text
{
    
    label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:Font];
    label.textColor = color;
    label.textAlignment = textAlignment;
    label.text = text;
    return label;
    
}

-(CALayer *)addSubLayer:(CALayer *)layer
               andFrame:(CGRect)frame
     andBackgroundColor:(UIColor *)color
            andBackView:(UIView *)baseView{
    
    layer = [[CALayer alloc]init];
    layer.frame = frame;
    layer.backgroundColor = [color CGColor];
    [baseView.layer addSublayer:layer];
    return layer;
}

-(UIButton *)addButton:(UIButton *)button
              andFrame:(CGRect)frame
        andNormalImage:(NSString *)normalImage
        andSelectImage:(NSString *)selectImage
              andTitle:(NSString *)title
               andFont:(NSInteger)font
   andNormalTitleColor:(UIColor *)normalColor
   andSelectTitleColor:(UIColor *)selectColor
            andAddView:(UIView *)subView{
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectColor forState:UIControlStateSelected];
    [subView addSubview:button];
    
    return button;
}

@end
