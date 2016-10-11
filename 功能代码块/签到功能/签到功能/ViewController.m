//
//  ViewController.m
//  签到功能
//
//  Created by mac on 16/5/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>//<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController
{
    UICollectionView *maincollEction;
    NSTimer *DSTime;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor blackColor];
    /**
     *  获取签到功能的所需要时间
     */
//    [self timers];
    
    /**
     *  学习时间（NSdate）
     */
//    [self studyDate];
    

    
    
}
- (IBAction)testBtnWay:(UIButton *)sender {
    [DSTime invalidate];
    [maincollEction removeFromSuperview];
    [self studyDate];
    
}
-(void)studyDate{
    NSCalendar *calendar=[NSCalendar currentCalendar];
//    NSDateComponents *dateComponents = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekOfMonthCalendarUnit | NSWeekOfYearCalendarUnit fromDate:[NSDate date]];
    NSDateComponents *dateComponents=[calendar components:  NSCalendarUnitYear |
                                                            NSCalendarUnitMonth |
                                                            NSCalendarUnitDay |
                                                            NSCalendarUnitHour |
                                                            NSCalendarUnitMinute |
                                                            NSCalendarUnitSecond |
                                                            NSCalendarUnitQuarter |
                                                            NSCalendarUnitWeekday |
                                                            NSCalendarUnitWeekOfYear |
                                                            NSCalendarUnitWeekOfMonth
                                                 fromDate:[NSDate date]];
    NSLog(@"year(年):%ld",(long)dateComponents.year);
    NSLog(@"month(月):%ld",(long)dateComponents.month);
    NSLog(@"day(日):%ld",(long)dateComponents.day);
    NSLog(@"hour(时):%ld",(long)dateComponents.hour);
    NSLog(@"minute(分):%ld",(long)dateComponents.minute);
    NSLog(@"second(秒):%ld",(long)dateComponents.second);
    NSLog(@"quarter(季度):%ld",(long)dateComponents.quarter);
    NSLog(@"weekday(星期):%ld",(long)dateComponents.weekday);
    NSLog(@"weekofyear(该年第几周):%ld",(long)dateComponents.weekOfYear);
    NSLog(@"weekofmonth(该月第几周):%ld",(long)dateComponents.weekOfMonth);


    //当月有多少天
    NSRange dayrange=[calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    //当月有几周
    NSRange weekmonth=[calendar rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    //当第一天是周几
    dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    [dateComponents setDay:1];
    NSDate *firstdate = [calendar dateFromComponents:dateComponents];
    NSUInteger firstday=[calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstdate];
    NSLog(@"本月有%lu天，%lu周，第一天是周%lu。",(unsigned long)dayrange.length,(unsigned long)weekmonth.length,(unsigned long)firstday-1);

    /**
     *  orthes
     */
    NSDate *date=[NSDate date];
    NSLog(@"date:%@",date);
    
    NSDate *newDate=[calendar dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:date options:0];
    NSLog(@"newdate:%@",newDate);
    //1.穿件布局方式
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //设置滚动方向
    [layout setScrollDirection:(UICollectionViewScrollDirectionVertical)];//垂直
    
    //设置headerView大小
    layout.headerReferenceSize=CGSizeMake(self.view.frame.size.width, 100);
    layout.itemSize=CGSizeMake((self.view.frame.size.width-4*8)/7, (self.view.frame.size.width-3*8)/7);
   
    //2.初始化UICollectionView
    maincollEction=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 52, self.view.frame.size.width, self.view.frame.size.height-52) collectionViewLayout:layout];
    [self.view addSubview:maincollEction];
    maincollEction.backgroundColor=[UIColor whiteColor];
    //3.注册collectionViewCell
    [maincollEction registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collcell"];
//    [maincollEction registerClass:[UICollectionReusableView class] forCellWithReuseIdentifier:@"headview"];
    //4.设置代理
    maincollEction.delegate=self;
    maincollEction.dataSource=self;
    DSTime =[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(DSTimeWay) userInfo:nil repeats:YES];
    [DSTime fire];
    
}

-(void)DSTimeWay{
    [maincollEction reloadData];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return (section+1) * 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"collcell" forIndexPath:indexPath];
    UIView *view=[[UIView alloc]initWithFrame:cell.contentView.frame];
    view.backgroundColor=[UIColor colorWithRed:arc4random()%255/255.0f green:arc4random()%255/255.0f blue:arc4random()%255/255.0f alpha:1];
    [cell.contentView addSubview:view];
    return cell;
}



//设置item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(4, 4, 4, 4);
}
//左右间隔
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 4;
}
//上下间隔
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}


-(void)timers{
    //当月有多少天
    NSCalendar *calender=[NSCalendar currentCalendar];
    NSDate *currentDate=[NSDate date];
    NSRange range=[calender rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:currentDate];
    NSLog(@"range:%lu",(unsigned long)range.length);
    
    // 初始化日历
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // 获取系统当前日期
    NSDate *weekDate = [NSDate date];
    // 获取当前日期中当前月中周的范围
    NSRange weekrange = [calendar rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:weekDate];
    // 得到当前月中总共有多少周（即范围的长度）
    NSInteger numberOfWeeksInCurrentMonth = weekrange.length;
    NSLog(@"当前月中有多少周：%ld",(long)numberOfWeeksInCurrentMonth);
    
    /**
     *  获取当前月第一天是星期几
     */
    NSInteger dateLwq=[self firstWeekdayInThisMonth:[NSDate date]];
    NSLog(@"dateLwq:%ld",(long)dateLwq);
    NSLog(@"这是时间戳");
}
- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

