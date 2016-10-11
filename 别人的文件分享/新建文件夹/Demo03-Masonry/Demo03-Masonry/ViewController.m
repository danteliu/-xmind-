//
//  ViewController.m
//  Demo03-Masonry
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
    UIView *leftView = nil;
    for (int i = 1; i <= 10; i++) {
        UIView *view = [UIView new];
        int red = arc4random()%256;
        int green = arc4random()%256;
        int blue = arc4random()%256;
        view.backgroundColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
        [self.view addSubview:view];
        //设置约束
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            if (i == 1) {
                //第一个视图相对于左边0
                make.left.mas_equalTo(0);
                //第一个视图高和宽一样(正方形)
                make.height.mas_equalTo(view.mas_width);
            } else {
                //非第一个视图(相对于左边视图是0;size是左边视图的size)
                make.size.mas_equalTo(leftView);
                make.left.mas_equalTo(leftView.mas_right);
                if (i == 10) {
                    //距离父视图右边0
                    make.right.mas_equalTo(0);
                }
            }
        }];
        //将当前的视图对象赋值leftView
        leftView = view;

            
       
    }
}



@end
