//
//  BaseView.h
//  VCHelper
//
//  Created by WangXueqi on 16/12/10.
//  Copyright © 2016年 JingBei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

-(UILabel *)addSubLabel:(UILabel *)label
               andFrame:(CGRect)frame
           andAlignment:(NSTextAlignment)textAlignment
            andTextFont:(NSInteger)Font
               andColor:(UIColor*)color
                andText:(NSString*)text;

-(CALayer *)addSubLayer:(CALayer *)layer
               andFrame:(CGRect)frame
     andBackgroundColor:(UIColor *)color
            andBackView:(UIView *)baseView;

-(UIButton *)addButton:(UIButton *)button
              andFrame:(CGRect)frame
        andNormalImage:(NSString *)normalImage
        andSelectImage:(NSString *)selectImage
              andTitle:(NSString *)title
               andFont:(NSInteger)font
   andNormalTitleColor:(UIColor *)normalColor
   andSelectTitleColor:(UIColor *)selectColor
            andAddView:(UIView *)subView;


@end
