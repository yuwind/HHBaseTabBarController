//
//  HHTableBarViewController.h
//  BaseTabBar
//
//  Created by 豫风 on 2017/6/27.
//  Copyright © 2017年 豫风. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHTableBarView.h"
#import "HHCommonInitial.h"

/**
 双击tabBar的事件，需要子控制器遵守协议:< DoubleClickProtocol >
 */

@interface HHBaseTabBarViewController : UIViewController


/**
 当前选择视图的索引
 */
@property (nonatomic, assign) NSInteger tapIndex;

/**
 需要先配置控制器，之后设置tableBar的属性
 @usage setter方法
 */
@property(nullable, nonatomic,copy) NSArray<__kindof UIViewController *> *viewControllers;

/**
 调用configTableBarDisplay方法进行配置，文字颜色大小在 CommonConfig.h
 */

@property (nonatomic, strong) HHTableBarView * _Nonnull tableBarView;


@end
