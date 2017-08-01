//
//  ConstructViewController.m
//  VCHelper
//
//  Created by WangXueqi on 17/6/30.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ConstructViewController.h"
#import "ConstructButtonView.h"
#import "ConstructDateView.h"
#import "UIView+Extension.h"

#define K_ScreenWidth   CGRectGetWidth([[UIScreen mainScreen] bounds])// 当前屏幕宽
#define K_ScreenHeight  CGRectGetHeight([[UIScreen mainScreen] bounds])// 当前屏幕高
@interface ConstructViewController ()
@property(nonatomic,strong)ConstructButtonView * construcButtontView;
@property(nonatomic,strong)ConstructDateView * constructDateView;
@end

@implementation ConstructViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubView];
}

- (void)addSubView {

    UIImageView * backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K_ScreenWidth, K_ScreenHeight)];
    backImage.image = [UIImage imageNamed:@"new_bg"];
    backImage.userInteractionEnabled = YES;
    [self.view addSubview:backImage];
    
    __weak typeof (self) selfWeak = self;
    if (!_constructDateView) {
        _constructDateView = [[ConstructDateView alloc]initWithFrame:CGRectMake(0, 50, K_ScreenWidth, 70)];
        [self.view addSubview:_constructDateView];
    }
    
    if (!_construcButtontView) {
        _construcButtontView = [[ConstructButtonView alloc]initWithFrame:CGRectMake(0, K_ScreenHeight-175, K_ScreenWidth, 175)];
        [_construcButtontView openConstructButtonLocation];
        [_construcButtontView setConstructBlock:^(NSInteger buttonIndex, BOOL isCancel) {
            
            [selfWeak dismissViewControllerAnimated:YES completion:nil];
            if (!isCancel) {
                [selfWeak constructButtonClickWithIndex:buttonIndex];
            }
            
        }];
        [self.view addSubview:_construcButtontView];
    }
    
    //加点击手势
    [self.view addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [selfWeak.construcButtontView cancelButtonClick:selfWeak.construcButtontView.cancelButton];
    }];
    
}

- (void)constructButtonClickWithIndex:(NSInteger)index {
    
    NSLog(@"index === %ld",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
