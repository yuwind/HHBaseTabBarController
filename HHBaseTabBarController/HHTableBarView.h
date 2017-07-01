//
//  HHTableBarView.h
//  BaseTabBar
//
//  Created by 豫风 on 2017/6/27.
//  Copyright © 2017年 豫风. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHCommonInitial.h"


@protocol HHTableBarViewDelegate <NSObject>

/**
 点击的事件回调

 @param style ActionStyleClick为单击事件，ActionStyleDoubleTap双击事件
 @param index 点击按钮的索引
 */
- (void)tableBarViewClickStyle:(ActionStyle)style index:(NSInteger)index;

@end

@interface HHTableBarView : UIView

@property (nonatomic, weak) id <HHTableBarViewDelegate>delegate;

/**
 配置按钮的总个数
 */
@property (nonatomic, assign) NSInteger totalCount;

/**
 快速实例化方法

 @param frame frame
 @param count 配置按钮的总个数
 @return 实例对象
 */
+ (instancetype)tableBarViewFrame:(CGRect)frame TotalCount:(NSInteger)count;

/**
 配置按钮的基本信息

 @param title 按钮标题
 @param normalImage 正常图片
 @param selectedImage 选中图片
 @param index 配置的索引
 */
- (void)configTableBarTitle:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage atIndex:(NSInteger)index;

@end
