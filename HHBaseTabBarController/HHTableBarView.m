//
//  HHTableBarView.m
//  BaseTabBar
//
//  Created by 豫风 on 2017/6/27.
//  Copyright © 2017年 豫风. All rights reserved.
//

#import "UIView+HHConstruct.h"
#import "HHTableBarView.h"
#import "HHBarButton.h"

#define TableBarTag 128219

@interface HHTableBarView ()< HHBarButtonDelegate >

@property (nonatomic, strong) HHBarButton *tempButton;

@end

@implementation HHTableBarView

+ (instancetype)tableBarViewFrame:(CGRect)frame TotalCount:(NSInteger)count
{
    return [[HHTableBarView alloc]initWithFrame:frame count:count];
}

- (instancetype)initWithFrame:(CGRect)frame count:(NSInteger)count;
{
    if (self = [super initWithFrame:frame]) {
        
        _totalCount = count;
        [self configInitialInfo];
        [self configTableBarBaseInfo];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self configInitialInfo];
        [self configTableBarBaseInfo];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        [self configInitialInfo];
        [self configTableBarBaseInfo];
    }
    return self;
}
- (instancetype)init
{
    if (self = [super init]) {
        
        [self configInitialInfo];
        [self configTableBarBaseInfo];
    }
    return self;
}
- (void)configInitialInfo
{
    self.backgroundColor = [UIColor whiteColor];
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5);
    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:layer];
}
- (void)configTableBarBaseInfo
{
    for (int i = 0; i<self.totalCount; i++) {
        
        HHBarButton *button = [[HHBarButton alloc]initWithFrame:CGRectZero markTag:i];
        button.delegate = self;
        [self addSubview:button];
        if (i == 0) {
            [button changeButtonState:NO];
            _tempButton = button;
        }
    }
    [self addSubViewConstraints];
}
- (void)addSubViewConstraints
{
    if (self.totalCount == 0)return;
    CGFloat btnWidth = [UIScreen mainScreen].bounds.size.width/self.totalCount;
    for (int i = 0; i<self.subviews.count; i++) {
        
        HHBarButton *button = self.subviews[i];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        NSString *xFormat = [NSString stringWithFormat:@"H:|-%lf-[button(%lf)]",i*btnWidth,btnWidth];
        NSDictionary *bindViews = NSDictionaryOfVariableBindings(button);
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:xFormat options:0 metrics:nil views:bindViews]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0.5-[button]|" options:0 metrics:nil views:bindViews]];
    }
}

- (void)setTotalCount:(NSInteger)totalCount
{
    if (totalCount <= _totalCount){
        NSInteger margin = _totalCount - totalCount;
        for (int i = 0; i<margin; i++) {
            UIView * view = [self.subviews lastObject];
            [view removeFromSuperview];
        }
    }else
    {
        NSInteger margin = totalCount - _totalCount;
        for (int i = 0; i<margin; i++) {
            
            HHBarButton *button = [[HHBarButton alloc]initWithFrame:CGRectMake(0, 0, self.height, self.height) markTag:i+_totalCount];
            button.delegate = self;
            [self addSubview:button];
            if (_totalCount == 0 && i == 0) {
                [button changeButtonState:NO];
                _tempButton = button;
            }
        }
    }
    _totalCount = totalCount;
    [self addSubViewConstraints];
}

- (void)configTableBarTitle:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage atIndex:(NSInteger)index
{
    if (index>=self.subviews.count)return;
    HHBarButton *button = self.subviews[index];
    [button configButtonDisplay:title normalImage:normalImage selectedImage:selectedImage];
}

- (void)barButton:(HHBarButton *)button Style:(ActionStyle)style index:(NSInteger)index
{
    if (button) {
        [button changeButtonState:NO];
        [_tempButton changeButtonState:YES];
        _tempButton = button;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableBarViewClickStyle:index:)]) {
        [self.delegate tableBarViewClickStyle:style index:index];
    }
}


@end
