//
//  NewFeatureView.m
//  NewFeatureDemo
//
//  Created by 边雷 on 16/12/30.
//  Copyright © 2016年 Mac-b. All rights reserved.
//

#import "NewFeatureView.h"

@interface NewFeatureView ()
@property(nonatomic, weak) UIScrollView *scV;
@end

@implementation NewFeatureView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //设置view
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    UIScrollView *scV = [[UIScrollView alloc]initWithFrame:self.bounds];
    //隐藏滚动指示条
    scV.showsVerticalScrollIndicator = NO;
    scV.showsHorizontalScrollIndicator = NO;
    
    //分页
    scV.pagingEnabled = YES;
    
    //禁用弹簧效果
    scV.bounces = NO;
    
    [self addSubview:scV];
    self.scV = scV;
}

- (void)setPictures:(NSArray *)pictures
{
    _pictures = pictures;
    
    for (int i = 0; i < _pictures.count; i++) {
        UIImageView *imagePic = [[UIImageView alloc]initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        imagePic.image = _pictures[i];
        [self.scV addSubview:imagePic];
    }
    
    self.scV.contentSize = CGSizeMake((_pictures.count + 1) * self.frame.size.width, 0);
}
@end
