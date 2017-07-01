//
//  HHTest2ViewController.m
//  HHBaseTabBarControllerDemo
//
//  Created by 豫风 on 2017/7/1.
//  Copyright © 2017年 豫风. All rights reserved.
//

#import "HHTest2ViewController.h"
#import "HHViewController.h"
#import "UIView+HHConstruct.h"

@interface HHTest2ViewController () <UITableViewDelegate ,UITableViewDataSource, DoubleClickProtocol>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HHTest2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self configBaseInfo];
}

- (void)configBaseInfo
{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.view addSubview:self.tableView];
}
- (void)viewDidLayoutSubviews
{
    self.tableView.frame = CGRectMake(0, 20, self.view.width, self.view.height-20);
}
- (void)doubleClickActionNeedToDo
{
    [self.tableView setContentOffset:CGPointZero animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld个cell",indexPath.row];
    return cell;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
