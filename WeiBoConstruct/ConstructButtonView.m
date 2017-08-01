//
//  ConstructButtonView.m
//  VCHelper
//
//  Created by WangXueqi on 17/6/30.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ConstructButtonView.h"
#import "UIColor+NSString.h"

#define k_constructTag   666666
#define k_ButtonFont     12
#define k_ButtonWidth    40
#define k_SpaceWidth     (K_ScreenWidth-k_ButtonWidth*5)/6
#define K_ScreenWidth    CGRectGetWidth([[UIScreen mainScreen] bounds])// 当前屏幕宽
#define K_ScreenHeight   CGRectGetHeight([[UIScreen mainScreen] bounds])// 当前屏幕高
@implementation ConstructButtonView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatConstructButtonView];
    }
    
    return self;
}

- (void)creatConstructButtonView{

    UIEdgeInsets imageEdge = UIEdgeInsetsMake(0, 0, 30, 0);
    UIEdgeInsets titleEdge = UIEdgeInsetsMake(50, -40, 0, 0);
    
    if (!_calendarButton) {
        _calendarButton = [self addButton:_calendarButton andFrame:CGRectMake(k_SpaceWidth, 0, k_ButtonWidth, 80) andNormalImage:@"new_schedule" andSelectImage:nil andTitle:@"日程" andFont:k_ButtonFont andNormalTitleColor:[UIColor color:@"333333"] andSelectTitleColor:nil andAddView:self];
        [_calendarButton setTag:k_constructTag];
        [_calendarButton setImageEdgeInsets:imageEdge];
        [_calendarButton setTitleEdgeInsets:titleEdge];
        [_calendarButton setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];        
    }
    
    if (!_projectButton) {
        _projectButton = [self addButton:_projectButton andFrame:CGRectMake(k_ButtonWidth+k_SpaceWidth*2, 0, k_ButtonWidth, 80) andNormalImage:@"new_project" andSelectImage:nil andTitle:@"项目" andFont:k_ButtonFont andNormalTitleColor:[UIColor color:@"333333"] andSelectTitleColor:nil andAddView:self];
        [_projectButton setTag:k_constructTag+1];
        [_projectButton setImageEdgeInsets:imageEdge];
        [_projectButton setTitleEdgeInsets:titleEdge];
        [_projectButton setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    }
    
    if (!_photoButton) {
        _photoButton = [self addButton:_recordButton andFrame:CGRectMake(k_ButtonWidth*2+k_SpaceWidth*3, 0, k_ButtonWidth, 80) andNormalImage:@"nev_picture" andSelectImage:nil andTitle:@"相册" andFont:k_ButtonFont andNormalTitleColor:[UIColor color:@"333333"] andSelectTitleColor:nil andAddView:self];
        [_photoButton setTag:k_constructTag+2];
        [_photoButton setImageEdgeInsets:imageEdge];
        [_photoButton setTitleEdgeInsets:titleEdge];
        [_photoButton setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    }
    
    if (!_soundButton) {
        _soundButton = [self addButton:_soundButton andFrame:CGRectMake(k_ButtonWidth*3+k_SpaceWidth*4, 0, k_ButtonWidth, 80) andNormalImage:@"nev_audio" andSelectImage:nil andTitle:@"录音" andFont:k_ButtonFont andNormalTitleColor:[UIColor color:@"333333"] andSelectTitleColor:nil andAddView:self];
        [_soundButton setTag:k_constructTag+3];
        [_soundButton setImageEdgeInsets:imageEdge];
        [_soundButton setTitleEdgeInsets:titleEdge];
        [_soundButton setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    }
    
    if (!_recordButton) {
        _recordButton = [self addButton:_recordButton andFrame:CGRectMake(k_ButtonWidth*4+k_SpaceWidth*5, 0, k_ButtonWidth, 80) andNormalImage:@"new_record" andSelectImage:nil andTitle:@"记录" andFont:k_ButtonFont andNormalTitleColor:[UIColor color:@"333333"] andSelectTitleColor:nil andAddView:self];
        [_recordButton setTag:k_constructTag+4];
        [_recordButton setImageEdgeInsets:imageEdge];
        [_recordButton setTitleEdgeInsets:titleEdge];
        [_recordButton setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    }
    
    [_calendarButton addTarget:self action:@selector(constructButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_projectButton addTarget:self action:@selector(constructButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_photoButton addTarget:self action:@selector(constructButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_soundButton addTarget:self action:@selector(constructButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_recordButton addTarget:self action:@selector(constructButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    CALayer * lineLayer;
    lineLayer = [self addSubLayer:lineLayer andFrame:CGRectMake(0, self.frame.size.height-50, K_ScreenWidth, 1) andBackgroundColor:[UIColor color:@"f0efef"] andBackView:self];
    
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setFrame:CGRectMake((K_ScreenWidth-50)/2, self.frame.size.height-50, 50, 50)];
        [_cancelButton setImage:[UIImage imageNamed:@"new_close"] forState:UIControlStateNormal];
        [self addSubview:_cancelButton];
        [_cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //执行后主要队列延迟
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self cancelButtonClick:_cancelButton];
        });
        
    }
}

//向上弹出
-(void)openConstructButtonLocation{

    NSArray * upArray = @[_calendarButton,_projectButton,_photoButton,_soundButton,_recordButton];
    [upArray enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL*stop) {
        
        UIButton * btn = obj;
        
        CGFloat x = btn.frame.origin.x;
        CGFloat y = btn.frame.origin.y;
        CGFloat width = btn.frame.size.width;
        CGFloat height = btn.frame.size.height;
        
        btn.frame = CGRectMake(x, self.frame.size.height - height, width, height);
        
        btn.alpha = 0.0;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(idx * 0.1 * NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
            //1 0.16 0.4 1
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:100 initialSpringVelocity:40 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                btn.alpha = 1;                
                btn.frame = CGRectMake(x, y, width, height);
                
            }completion:^(BOOL finished) {
                
            }];
            
        });
        
    }];
}

//向下滑走
- (void)closeConstructButtonLocation{

    NSArray * downArray = @[_recordButton,_soundButton,_photoButton,_projectButton,_calendarButton];
    [downArray enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL*stop) {
        
        UIButton * btn = obj;
        
        CGFloat x = btn.frame.origin.x;
        CGFloat y = btn.frame.origin.y;
        CGFloat width = btn.frame.size.width;
        CGFloat height = btn.frame.size.height;

        btn.frame = CGRectMake(x, y, width, height);
        
        btn.alpha = 1.0;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(idx *0.06*NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:100 initialSpringVelocity:25 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                btn.alpha = 0.0;
                btn.frame = CGRectMake(x, self.frame.size.height - height, width, height);
                
            }completion:^(BOOL finished) {
                
                if (_constructBlock) {
                    _constructBlock(0,YES);
                }
            }];
            
        });
        
    }];
}

//点击按钮
- (void)constructButtonClick:(UIButton *)sender {

    NSInteger buttonTag = sender.tag - k_constructTag;
    if (_constructBlock) {
        _constructBlock(buttonTag,NO);
    }
}

- (void)cancelButtonClick:(UIButton *)sender{

    sender.selected = !sender.selected;
    
    if (sender.selected) {
        
        [UIView animateWithDuration:0.3f animations:^{
            sender.transform = CGAffineTransformMakeRotation(M_PI/4);
        }];
        
    }else{
        
        [self closeConstructButtonLocation];
        
        [UIView animateWithDuration:0.3f animations:^{
            sender.transform = CGAffineTransformMakeRotation(M_PI*4);
        }];        
        
    }
}



@end
