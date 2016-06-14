//
//  CustomSegmentView.h
//  SegmentView
//
//  Created by 党坤 on 16/6/14.
//  Copyright © 2016年 党坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSegmentDelegate <NSObject>
@optional
-(void)didSelectedSement:(NSInteger)selectedIndex;
@end

@interface CustomSegmentView : UIView

/**
 *  标题颜色
 */
@property (nonatomic,strong) UIColor *titleColor;

/**
 *  底部选中线颜色
 */
@property (nonatomic,strong) UIColor *bottomLineColor;

/**
 *  设置选中 默认为0
 */
@property (nonatomic,assign) NSInteger selected;
/**
 *  代理
 */
@property (nonatomic,weak) id<CustomSegmentDelegate>delegate;
/**
 *  是否开启移动动画 默认不开启
 */
@property (nonatomic,assign) BOOL animate;
/**
 *  初始化方法
 *
 *  @param frame      frame
 *  @param titleArray titleArray
 *
 *  @return self
 */
-(instancetype)initWithFrame:(CGRect)frame titileNum:(NSArray *)titleArray;


@end
