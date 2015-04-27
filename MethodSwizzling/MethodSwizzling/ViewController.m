//
//  ViewController.m
//  MethodSwizzling
//
//  Created by Robert on 15/4/27.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic ,strong)UIView *firstView;
@property (nonatomic, strong)UIView *secondView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.firstView];
    [self.view addSubview:self.secondView];
}

-(void)viewDidLayoutSubviews {
    __block ViewController *weakSelf = self;
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(50);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@50);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
    }];
    [self.secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.firstView.mas_bottom).offset(50);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@50);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
    }];
}

- (UIView *)firstView {
    if (!_firstView) {
        NSLog(@"constaint firstView");
        _firstView = [[UIView alloc] init];
        _firstView.backgroundColor = [UIColor redColor];
    }
    return _firstView;
}

-(UIView *)secondView {
    if (!_secondView) {
        NSLog(@"constaint secondView");
        _secondView = [[UIView alloc] init];
        _secondView.backgroundColor = [UIColor greenColor];
    }
    return _secondView;
}

@end
