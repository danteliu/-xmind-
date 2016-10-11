//
//  ViewController.m
//  Demo02-Masonry
//
//  Created by isd1511 on 16/2/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     添加红色视图
     步骤:添加到父视图，添加约束
     */
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    //需求：上20:左/右/下:0
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
//        make.left.mas_equalTo(0);
//        make.right.mas_equalTo(0);
//        make.bottom.mas_equalTo(0);
        make.left.bottom.right.mas_equalTo(0);
    }];
    //添加button;约束：上左：10宽：100：高：50
    UIButton *greenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    greenButton.backgroundColor = [UIColor greenColor];
    [redView addSubview:greenButton];
    [greenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    UIButton *blackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    blackButton.backgroundColor = [UIColor blackColor];
    [redView addSubview:blackButton];
    /*
      负值的设置原则：向上移动：负值;
      向左移动：负值
    */
    [blackButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    UIButton *grayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    grayButton.backgroundColor = [UIColor grayColor];
    [redView addSubview:grayButton];
    [grayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    UIButton *purpleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    purpleButton.backgroundColor = [UIColor purpleColor];
    [redView addSubview:purpleButton];
    [purpleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    UIButton *yellowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    yellowButton.backgroundColor = [UIColor yellowColor];
    [redView addSubview:yellowButton];
    [yellowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(greenButton);
        make.center.mas_equalTo(redView.center);
    }];
    
    /*
     通过相对参照物的约束设定
     白色button,宽高和黄色一样;x和黄色button一样;y距离黄色button顶部20
     */
    UIButton *whiteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    whiteButton.backgroundColor = [UIColor whiteColor];
    [redView addSubview:whiteButton];
    [whiteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.size.mas_equalTo(yellowButton);
        make.centerX.mas_equalTo(yellowButton.center);
        make.bottom.mas_equalTo(yellowButton.mas_top).mas_equalTo(-20);
    }];
    
    UIButton *blueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    blueButton.backgroundColor = [UIColor blueColor];
    [redView addSubview:blueButton];
    [blueButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.width.mas_equalTo(whiteButton.mas_width).multipliedBy(2);
        make.height.mas_equalTo(whiteButton.mas_height).dividedBy(2);
        make.centerX.mas_equalTo(whiteButton.center);
        make.bottom.mas_equalTo(whiteButton.mas_top).mas_equalTo(-20);
    }];
    
}



@end
