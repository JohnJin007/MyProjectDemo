//
//  ViewController.m
//  MasonryDemo
//
//  Created by LeeJin on 15/12/17.
//  Copyright (c) 2015年 psylife. All rights reserved.
//

#import "ViewController.h"
#import "YCDefine.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()

@end

@implementation ViewController

#pragma mark -- Life cylce
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *string = [NSString stringWithFormat:@"%f",kScaleFrom_iPhone5_Desgin(40)];
    NSLog(@"string = %@",string);
    
    //初始化布局视图
    [self initViewLayout];
    
}

#pragma mark -- Private method
- (void)initViewLayout {
    
    //1.背景图
    UIImageView *backgroundImageView = [UIImageView new];
    backgroundImageView.image = [UIImage imageNamed:@"底图"];
    [self.view addSubview:backgroundImageView];
    
    [backgroundImageView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    //2.logo图标
    UIImageView *logoImageView = [UIImageView new];
    logoImageView.image = [UIImage imageNamed:@"奖惩戳"];
    
//    [logoImageView sd_setImageWithURL:[NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"] placeholderImage:nil];
//    [self.view addSubview:logoImageView];
    
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(kScaleFrom_iPhone5_Desgin(30));
        make.width.equalTo(@kScaleFrom_iPhone5_Desgin(180));
        make.height.equalTo(@kScaleFrom_iPhone5_Desgin(180));
        
    }];
    
    //3.公司名字
    UIImageView *companyImageView = [UIImageView new];
    companyImageView.image = [UIImage imageNamed:@"bottom"];
    [self.view addSubview:companyImageView];
    
    [companyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(@30);
    }];

    //4.输入框容器视图
    UIView *inputContainerView = [UIView new];
    inputContainerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:inputContainerView];
    
    [inputContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.top.equalTo(logoImageView.mas_bottom).with.offset(kScaleFrom_iPhone5_Desgin(20));
        make.bottom.equalTo(companyImageView.mas_top).with.offset(kScaleFrom_iPhone5_Desgin(-15));
    }];
    
    //4.输入框容器视图背景图
    UIImageView *inputImageView = [UIImageView new];
    inputImageView.image = [UIImage imageNamed:@"backgroundImage"];
    [inputContainerView addSubview:inputImageView];
    
    [inputImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(inputContainerView);
    }];

    //5.输入框用户名
    UITextField *userName = [UITextField new];
    userName.background = [UIImage imageNamed:@"textfieldBackgroundImage"];
    userName.placeholder =@"请输入用户名";
    userName.font = [UIFont systemFontOfSize:18];
    [inputContainerView addSubview:userName];
    
    [userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(inputContainerView.mas_left).with.offset(5);
        make.right.equalTo(inputContainerView.mas_right).with.offset(-5);
        make.top.equalTo(inputContainerView.mas_top).with.offset(kScaleFrom_iPhone5_Desgin(15));
        make.height.equalTo(@kScaleFrom_iPhone5_Desgin(40));
    }];
    
    //6.输入框用户名
    UITextField *password = [UITextField new];
    password.background = [UIImage imageNamed:@"textfieldBackgroundImage"];
    password.placeholder =@"请输入密码";
    password.font = [UIFont systemFontOfSize:18];
    [inputContainerView addSubview:password];
    
    [password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(inputContainerView.mas_left).with.offset(5);
        make.right.equalTo(inputContainerView.mas_right).with.offset(-5);
        make.top.equalTo(userName.mas_bottom).with.offset(kScaleFrom_iPhone5_Desgin(15));
        make.height.equalTo(@kScaleFrom_iPhone5_Desgin(40));
    }];
    
    //7.登陆
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"登录"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [inputContainerView addSubview:loginBtn];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(inputContainerView.mas_left).with.offset(5);
        make.right.equalTo(inputContainerView.mas_right).with.offset(-5);
        make.top.equalTo(password.mas_bottom).with.offset(kScaleFrom_iPhone5_Desgin(15));
        make.height.equalTo(@kScaleFrom_iPhone5_Desgin(45));
    }];
    
    //8.记住密码
    UILabel *remeberPassword = [UILabel new];
    remeberPassword.backgroundColor = [UIColor clearColor];
    remeberPassword.font = [UIFont systemFontOfSize:14];
    remeberPassword.textColor = [UIColor brownColor];
    remeberPassword.text = @"记住密码";
    [inputContainerView addSubview:remeberPassword];
    
    [remeberPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@24);
        make.width.equalTo(@60);
        make.top.equalTo(loginBtn.mas_bottom).with.offset(kScaleFrom_iPhone5_Desgin(10));
        make.right.equalTo(inputContainerView.mas_right).with.offset(-5);
    }];
    
    UIButton *remeberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [remeberBtn setBackgroundImage:[UIImage imageNamed:@"圆角矩形1"] forState:UIControlStateNormal];
    [remeberBtn setBackgroundImage:[UIImage imageNamed:@"圆角矩形2"] forState:UIControlStateSelected];
    [remeberBtn addTarget:self action:@selector(remeberBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [inputContainerView addSubview:remeberBtn];
    
    [remeberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@24);
        make.width.equalTo(@24);
        make.top.equalTo(loginBtn.mas_bottom).with.offset(kScaleFrom_iPhone5_Desgin(10));
        make.right.equalTo(remeberPassword.mas_left).with.offset(-5);
    }];
    
}

#pragma mark -- Event method

- (void)loginBtnClick:(UIButton *)sender {
    NSLog(@"loginBtnClick");
}

- (void)remeberBtnClick:(UIButton *)sender {
    sender.selected = YES;
}

@end
