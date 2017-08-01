//
//  ViewController.m
//  WeiBoConstruct
//
//  Created by WangXueqi on 17/8/1.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ViewController.h"
#import "ConstructViewController.h"

#define K_ScreenWidth   CGRectGetWidth([[UIScreen mainScreen] bounds])// 当前屏幕宽
#define K_ScreenHeight  CGRectGetHeight([[UIScreen mainScreen] bounds])// 当前屏幕高
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"新建";
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreatConstructView];
}

- (void)CreatConstructView {

    UIButton * constructBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [constructBtn setFrame:CGRectMake(0, K_ScreenHeight-49, K_ScreenWidth, 49)];
    [constructBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [constructBtn addTarget:self action:@selector(constructButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:constructBtn];
    [self constructButtonClick];
}

- (void)constructButtonClick {

    ConstructViewController * construct = [[ConstructViewController alloc]init];
    construct.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    construct.providesPresentationContextTransitionStyle = YES;
    construct.definesPresentationContext = YES;
    construct.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:construct animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
