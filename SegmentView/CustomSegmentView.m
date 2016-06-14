//
//  CustomSegmentView.m
//  SegmentView
//
//  Created by 党坤 on 16/6/14.
//  Copyright © 2016年 党坤. All rights reserved.
//

#import "CustomSegmentView.h"

#define buttonWidth self.bounds.size.width/4
#define buttonHeight self.bounds.size.height
#define bottomLineWidth buttonWidth/3*2

@interface CustomSegmentView()
{
    UIView *bottomLine;//底部选中线
    
    NSMutableArray *itemArray;
}
@end

@implementation CustomSegmentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame titileNum:(NSArray *)titleArray
{
    self = [super initWithFrame:frame];
    if(self)
    {
        itemArray = [NSMutableArray array];
        self.selected = 0;
        self.animate = NO;
        [self initUI:frame titleNum:titleArray];
    }
    return self;
}

#pragma mark-创建UI界面
-(void)initUI:(CGRect)frame titleNum:(NSArray *)titleArray
{
    //titleArray为1的情况
    if(titleArray.count ==1)
    {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(frame.size.width/2-buttonWidth/2, 0, buttonWidth,buttonHeight);
        [button setTitle:titleArray.firstObject forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:button];
    }
    //titleArray大于1的情况
    if(titleArray.count >1)
    {
        bottomLine = [[UIView alloc] init];
        [self addSubview:bottomLine];
        
        for (int i=0;i<titleArray.count;i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = i;
            if(titleArray.count==2)
            {
                button.frame = CGRectMake(buttonWidth*i, 0, buttonWidth,buttonHeight);
            }else if(titleArray.count==3)
            {
                button.frame = CGRectMake(buttonWidth/2+buttonWidth*i, 0, buttonWidth,buttonHeight);
            }else if(titleArray.count==4)
            {
                button.frame = CGRectMake(buttonWidth*i, 0, buttonWidth,buttonHeight);
            }
            [button setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:14.0];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [itemArray addObject:button];
            
            if(self.selected ==i)
            {
               [self bottomLineChange:button animate:self.animate];
            }
        }
    }
    //titleArray小于1的情况
    if(titleArray.count<1)
    {
        return;
    }
}

#pragma mark-设置title颜色
-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    for (UIView *chirdView in self.subviews) {
        if([chirdView isKindOfClass:[UIButton class]])
        {
            UIButton *button = (UIButton *)chirdView;
            [button setTitleColor:self.titleColor forState:UIControlStateNormal];
        }
    }
}

#pragma mark-设置BottomLine颜色
-(void)setBottomLineColor:(UIColor *)bottomLineColor
{
    _bottomLineColor = bottomLineColor;
    bottomLine.backgroundColor = self.bottomLineColor;
}

#pragma mark-设置选中
-(void)setSelected:(NSInteger)selected
{
    _selected = selected;
    if(itemArray.count !=0 && selected<itemArray.count)
    {
        UIButton *button = [itemArray objectAtIndex:self.selected];
        [self bottomLineChange:button animate:self.animate];
    }
   
}

#pragma mark-button点击事件
-(void)buttonClick:(UIButton *)button
{
    self.selected = button.tag;
    [self.delegate didSelectedSement:self.selected];
}

#pragma mark-bottomLine的位置变化
-(void)bottomLineChange:(UIButton *)button animate:(BOOL)animate
{
    if(animate)
    {
        [UIView animateWithDuration:0.25 animations:^{
            bottomLine.frame = CGRectMake(button.frame.origin.x+(button.frame.size.width-bottomLineWidth)/2, button.frame.origin.y+button.frame.size.height-3, bottomLineWidth, 2);
        }];
    }else
    {
        bottomLine.frame = CGRectMake(button.frame.origin.x+(button.frame.size.width-bottomLineWidth)/2, button.frame.origin.y+button.frame.size.height-3, bottomLineWidth, 2);
    }
}
@end
