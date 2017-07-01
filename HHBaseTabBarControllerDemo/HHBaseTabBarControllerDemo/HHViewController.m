//
//  ViewController.m
//  HHBaseTabBarControllerDemo
//
//  Created by 豫风 on 2017/7/1.
//  Copyright © 2017年 豫风. All rights reserved.
//

#import "HHViewController.h"
#import "HHTest0ViewController.h"
#import "HHTest1ViewController.h"
#import "HHTest2ViewController.h"
#import "HHTest3ViewController.h"

@interface HHViewController ()

@end

@implementation HHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    HHTest0ViewController *vc1 = [HHTest0ViewController new];
    HHTest1ViewController *vc2 = [HHTest1ViewController new];
    HHTest2ViewController *vc3 = [HHTest2ViewController new];
    HHTest3ViewController *vc4 = [HHTest3ViewController new];
    
    self.viewControllers = @[vc1,vc2,vc3,vc4];
    
    [self.tableBarView configTableBarTitle:@"主页" normalImage:@"icon_tab_my_nor" selectedImage:@"icon_tab_my_pressed" atIndex:0];
    [self.tableBarView configTableBarTitle:@"好友" normalImage:@"icon_tab_my_nor" selectedImage:@"icon_tab_my_pressed" atIndex:1];
    [self.tableBarView configTableBarTitle:@"发现" normalImage:@"icon_tab_my_nor" selectedImage:@"icon_tab_my_pressed" atIndex:2];
    [self.tableBarView configTableBarTitle:@"个人" normalImage:@"icon_tab_my_nor" selectedImage:@"icon_tab_my_pressed" atIndex:3];
}



@end
