//
//  HHTableBarButton.m
//  BaseTabBar
//
//  Created by 豫风 on 2017/6/27.
//  Copyright © 2017年 豫风. All rights reserved.
//


#import "HHBarButton.h"
#import "HHButton.h"
#import "HHCommonInitial.h"

@interface HHBarButton ()

@property (nonatomic, weak)   id target;
@property (nonatomic, assign) SEL action;
@property (nonatomic, strong) HHButton *button;
@property (nonatomic, assign) NSInteger markTag;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end

@implementation HHBarButton

- (UITapGestureRecognizer *)tapGesture
{
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureClick:)];
        _tapGesture.numberOfTapsRequired = 2;
    }
    return _tapGesture;
}

- (instancetype)initWithFrame:(CGRect)frame markTag:(NSInteger)markTag
{
    if (self = [super initWithFrame:frame]) {
        self.markTag = markTag;
        [self configBaseInfo];
    }
    return self;
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
- (void)layoutSubviews
{
    self.button.frame = self.bounds;
}
- (void)configBaseInfo
{
    _button = [[HHButton alloc]init];
    [_button addTarget:self action:@selector(HHbuttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_button];
    
    _button.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *bindView = NSDictionaryOfVariableBindings(_button);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_button]|" options:0 metrics:nil views:bindView]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_button]|" options:0 metrics:nil views:bindView]];
}
- (void)configButtonDisplay:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage
{
    if (title) {
        
        [_button setTitle:title forState:UIControlStateNormal];
    }
    [_button setTitleColor:NormalTitleColor forState:UIControlStateNormal];
    [_button setTitleColor:SelectedTitleColor forState:UIControlStateDisabled];
    
    if (normalImage) {
        
        [_button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    }
    if (selectedImage) {
        
        [_button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateDisabled];
    }
}
- (void)changeButtonState:(BOOL)status
{
    _button.enabled = status;
    if (_button.enabled) {
        [self removeGestureRecognizer:self.tapGesture];
    }else
    {
        [self addGestureRecognizer:self.tapGesture];
    }
}
- (void)tapGestureClick:(UIGestureRecognizer *)gesture
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(barButton:Style:index:)]) {
        [self.delegate barButton:nil Style:ActionStyleDoubleTap index:self.markTag];
    }
}
- (void)HHbuttonClicked:(HHButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(barButton:Style:index:)]) {
        [self.delegate barButton:self Style:ActionStyleClick index:self.markTag];
    }
}

@end
