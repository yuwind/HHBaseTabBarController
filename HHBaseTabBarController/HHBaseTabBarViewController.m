//
//  HHTableBarViewController.m
//  BaseTabBar
//
//  Created by 豫风 on 2017/6/27.
//  Copyright © 2017年 豫风. All rights reserved.
//

#import "HHBaseTabBarViewController.h"

#define VIEWTAG 93193

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
    self.tableBarView = [[HHTableBarView alloc]initWithFrame:CGRectZero];
    self.tableBarView.delegate = self;
    [self.view addSubview:self.tableBarView];
    self.tapIndex = 0;
    
    self.tableBarView.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *bindView = NSDictionaryOfVariableBindings(_tableBarView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableBarView]|" options:0 metrics:nil views:bindView]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_tableBarView(50)]|" options:0 metrics:nil views:bindView]];
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers
{
    _viewControllers = viewControllers;
    _tableBarView.totalCount = viewControllers.count;
    for (int i = 0; i< viewControllers.count;i++) {
        UIViewController *vc = viewControllers[i];

        vc.view.tag = VIEWTAG+i;
        [self.view addSubview:vc.view];
        [self addChildViewController:vc];
        
        UIView *coverView = vc.view;
        coverView.translatesAutoresizingMaskIntoConstraints = NO;
        NSDictionary *bindViews = NSDictionaryOfVariableBindings(coverView,_tableBarView);
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[coverView]|" options:0 metrics:nil views:bindViews]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[coverView]-0-[_tableBarView]" options:0 metrics:nil views:bindViews]];
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


@end
