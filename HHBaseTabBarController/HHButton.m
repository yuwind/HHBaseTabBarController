//
//  HHButton.m
//  BaseTabBar
//
//  Created by 豫风 on 2017/6/27.
//  Copyright © 2017年 豫风. All rights reserved.
//


#import "HHButton.h"
#import "HHCommonInitial.h"

@implementation HHButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType
{
    if (buttonType == UIButtonTypeCustom) {
        HHButton *button = [[HHButton alloc]init];
        return button;
    }else
    {
        return [super buttonWithType:buttonType];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self configBaseInfo];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        [self configBaseInfo];
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
        
        [self configBaseInfo];
    }
    return self;
}

- (void)configBaseInfo
{
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.titleLabel.font = [UIFont systemFontOfSize:KtabBarFont];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat width = contentRect.size.width ;
    CGFloat height = contentRect.size.height * 0.3;
    CGFloat y = contentRect.size.height * 0.7;
    CGFloat x = 0;
    return CGRectMake(x, y, width, height);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat width = contentRect.size.height * 0.5;
    CGFloat height = width;
    CGFloat y = contentRect.size.height * 0.1;
    CGFloat x = (contentRect.size.width-width)/2;
    return CGRectMake(x, y, width, height);
}

@end
