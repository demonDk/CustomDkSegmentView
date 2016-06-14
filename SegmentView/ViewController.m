//
//  ViewController.m
//  SegmentView
//
//  Created by 党坤 on 16/6/14.
//  Copyright © 2016年 党坤. All rights reserved.
//

#import "ViewController.h"
#import "CustomSegmentView.h"

@interface ViewController ()<CustomSegmentDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *titleArray = @[@"测试1",@"测试2",@"测试3",@"测试4"];
    CustomSegmentView *custonSV = [[CustomSegmentView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 44) titileNum:titleArray];
    custonSV.delegate = self;
    custonSV.animate = self;
    custonSV.titleColor = [UIColor blackColor];
    custonSV.bottomLineColor = [UIColor redColor];
//    custonSV.selected = 4;
    [self.view addSubview:custonSV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didSelectedSement:(NSInteger)selectedIndex
{
    NSLog(@"selectIndex ==%ld",(long)selectedIndex);
}
@end
