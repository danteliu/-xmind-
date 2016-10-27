//
//  ViewController.m
//  PictureLashen
//
//  Created by mac on 16/10/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#define TOPANDBOTTOM 42
#define LEFTANDRIGHT 20
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tempImage;

@end

@implementation ViewController
{
    UIImage *Timage;
    UIEdgeInsets insets;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    Timage=[UIImage imageNamed:@"123.jpg"];
}
- (IBAction)oneBtnWay:(UIButton *)sender {
    insets=UIEdgeInsetsMake(0, 0, 0, 0);
    _tempImage.image=[Timage resizableImageWithCapInsets:insets resizingMode:(UIImageResizingModeTile)];
}
- (IBAction)twoBtnWay:(UIButton *)sender {
    insets=UIEdgeInsetsMake(TOPANDBOTTOM, 0, 0, 0);
    _tempImage.image=[Timage resizableImageWithCapInsets:insets resizingMode:(UIImageResizingModeTile)];
    
}
- (IBAction)threeBtnWay:(UIButton *)sender {
    insets=UIEdgeInsetsMake(0, LEFTANDRIGHT, 0, 0);
    _tempImage.image=[Timage resizableImageWithCapInsets:insets resizingMode:(UIImageResizingModeTile)];
    
}
- (IBAction)fourBtnWay:(UIButton *)sender {
    insets=UIEdgeInsetsMake(TOPANDBOTTOM, LEFTANDRIGHT, TOPANDBOTTOM, LEFTANDRIGHT);
    _tempImage.image=[Timage resizableImageWithCapInsets:insets resizingMode:(UIImageResizingModeTile)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
