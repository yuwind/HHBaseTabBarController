//
//  HHTableBarViewController.m
//  BaseTabBar
//
//  Created by 豫风 on 2017/6/27.
//  Copyright © 2017年 豫风. All rights reserved.
//

#import "HHBaseTabBarViewController.h"
#import "UIView+HHConstruct.h"

#define VIEWTAG 19891

@interface HHBaseTabBarViewController () <HHTableBarViewDelegate>

@end

@implementation HHBaseTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configBaseTabBarInitial];
}
- (void)configBaseTabBarInitial
{
    self.tableBarView = [[HHTableBarView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - KTabBarHeight, [UIScreen mainScreen].bounds.size.width, KTabBarHeight)];
    self.tableBarView.delegate = self;
    [self.view addSubview:self.tableBarView];
    self.tapIndex = 0;
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers
{
    _viewControllers = viewControllers;
    _tableBarView.totalCount = viewControllers.count;
    for (int i = 0; i< viewControllers.count;i++) {
        UIViewController *vc = viewControllers[i];
        vc.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - KTabBarHeight);
        vc.view.tag = VIEWTAG+i;
        [self.view addSubview:vc.view];
        [self addChildViewController:vc];
    }
    UIView * firstView = [self.view viewWithTag:VIEWTAG];
    [self.view bringSubviewToFront:firstView];
}
- (void)tableBarViewClickStyle:(ActionStyle)style index:(NSInteger)index
{
    if (style == ActionStyleDoubleTap){
        
        [self tapGestureClickWithIndex:index];
    }else if (style == ActionStyleClick)
    {
        self.tapIndex = index;
        [self setNeedsStatusBarAppearanceUpdate];
        UIView *view = [self.view viewWithTag:(VIEWTAG + index)];
        [self.view bringSubviewToFront:view];
    }
}

- (void)tapGestureClickWithIndex:(NSInteger)index
{
    UIViewController *viewController = self.viewControllers[index];
    if ([viewController conformsToProtocol:@protocol(DoubleClickProtocol)] && [viewController respondsToSelector:@selector(doubleClickActionNeedToDo)]) {
        
        [viewController performSelectorOnMainThread:@selector(doubleClickActionNeedToDo) withObject:nil waitUntilDone:NO];
    }
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return [self.viewControllers[self.tapIndex] preferredStatusBarStyle];
}

/**
 是否需要隐藏tabBarView, 有需求再加上
 
 @param status YES隐藏、NO显示
 @param animation 是否需要动画效果
 */

- (void)needToHiddenTabBarView:(BOOL)status animation:(BOOL)animation
{
    UIView *coverView = self.view.subviews.lastObject;
//    UIView *bgView = coverView.subviews.firstObject;
    
    if (status) {
        
        if (animation) {
            
            [UIView animateWithDuration:0.3 animations:^{
                coverView.height += KTabBarHeight;
//                bgView.height += KTabBarHeight;
                self.tableBarView.y = [UIScreen mainScreen].bounds.size.height;
            }];
        }else
        {
            coverView.height += KTabBarHeight;
//            bgView.height += KTabBarHeight;
            self.tableBarView.y = [UIScreen mainScreen].bounds.size.height;
        }
    }else
    {
        if (animation) {
            
            [UIView animateWithDuration:0.3 animations:^{
                coverView.height -= KTabBarHeight;
//                bgView.height -= KTabBarHeight;
                self.tableBarView.y = [UIScreen mainScreen].bounds.size.height-KTabBarHeight;
            }];
        }else
        {
            coverView.height -= KTabBarHeight;
//            bgView.height -= KTabBarHeight;
            self.tableBarView.y = [UIScreen mainScreen].bounds.size.height-KTabBarHeight;
        }
    }
}


@end
