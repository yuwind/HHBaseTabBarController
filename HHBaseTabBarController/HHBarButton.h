//
//  HHTableBarButton.h
//  BaseTabBar
//
//  Created by 豫风 on 2017/6/27.
//  Copyright © 2017年 豫风. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHTableBarView.h"

@class HHBarButton;
@protocol HHBarButtonDelegate <NSObject>

- (void)barButton:(HHBarButton *)button Style:(ActionStyle)style index:(NSInteger)index;

@end

@interface HHBarButton : UIView

@property (nonatomic, weak) id <HHBarButtonDelegate>delegate;

/**
 快速初始化构造方法

 @param frame frame
 @param markTag 绑定的标记
 @return 实例对象
 */
- (instancetype)initWithFrame:(CGRect)frame markTag:(NSInteger)markTag;

/**
 改变按钮状态

 @param status YES为正常状态，NO为选中状态，选中状态具有双击事件
 */
- (void)changeButtonState:(BOOL)status;

/**
 配置按钮的基本信息

 @param title 按钮标题
 @param normalImage 正常图片
 @param selectedImage 选中图片
 */
- (void)configButtonDisplay:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage;

@end
