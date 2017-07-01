//
//  helloword.h
//  BaseTabBar
//
//  Created by 豫风 on 2017/6/27.
//  Copyright © 2017年 豫风. All rights reserved.
//

#ifndef HHCommonInitial_h
#define HHCommonInitial_h


typedef NS_ENUM(NSUInteger, ActionStyle) {
    ActionStyleNone,
    ActionStyleClick,
    ActionStyleDoubleTap,
};

/**
 tabBar配置信息
 */
#define KtabBarFont 12
#define KTabBarHeight 50
#define NormalTitleColor [UIColor lightGrayColor]
#define SelectedTitleColor [UIColor orangeColor]

/**
 双击tabBar的事件协议，需要子控制器遵守协议
 */
@protocol DoubleClickProtocol <NSObject>

- (void)doubleClickActionNeedToDo;

@end




#endif /* helloword_h */
