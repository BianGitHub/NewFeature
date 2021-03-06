//
//  NewFeatureView.m
//  NewFeatureDemo
//
//  Created by 边雷 on 16/12/30.
//  Copyright © 2016年 Mac-b. All rights reserved.
//

#import "NewFeatureView.h"
#import "Masonry.h"

@interface NewFeatureView ()<UIScrollViewDelegate>
@property(nonatomic, weak) UIScrollView *scV;
@property(nonatomic, weak) UIPageControl *pageC;
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
    scV.delegate = self;
    //禁用弹簧效果
    scV.bounces = NO;
    [self addSubview:scV];
    self.scV = scV;
    
    UIPageControl *pageC = [[UIPageControl alloc]init];
    // 设置当前页颜色
    pageC.currentPageIndicatorTintColor = [UIColor redColor];
    //设置非当前页颜色
    pageC.pageIndicatorTintColor = [UIColor greenColor];
    
    //不能把pageC添加都scrollVew上, 不然会跟着滚动, 需要添加到view
    [self addSubview: pageC];
    self.pageC = pageC;
    
    [pageC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(-40);
    }];
}

- (void)setPictures:(NSArray *)pictures
{
    _pictures = pictures;
    
    for (int i = 0; i < _pictures.count; i++) {
        UIImageView *imagePic = [[UIImageView alloc]initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        imagePic.image = _pictures[i];
//        [self.scV addSubview:imagePic];
        //防止盖住pageControl
        [self.scV insertSubview:imagePic  atIndex:0];
        
        UIButton *moreBtn = [[UIButton alloc]init];
        [moreBtn setBackgroundImage:[UIImage imageNamed:@"common_more_black"] forState:UIControlStateNormal];
        [moreBtn setBackgroundImage:[UIImage imageNamed:@"common_more_white"] forState:UIControlStateHighlighted];
        [self.scV addSubview:moreBtn];
        
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(imagePic).offset(-20);
            make.bottom.equalTo(imagePic).offset(-40);
            make.size.mas_equalTo(CGSizeMake(100, 40));
        }];
        
        [moreBtn addTarget:self action:@selector(clickMoreButton) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.scV.contentSize = CGSizeMake((_pictures.count + 1) * self.frame.size.width, 0);
    self.pageC.numberOfPages = _pictures.count;
}
#pragma mark -点击更多按钮时调用的方法
- (void)clickMoreButton
{
    [UIView animateWithDuration:2 animations:^{
        self.transform = CGAffineTransformMakeScale(2, 2);
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma mark - scrollVeiw代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    
    CGFloat page = offsetX / self.frame.size.width;
    // 当滚动到屏幕一半时就改变page页码
    page += 0.5;
    
    self.pageC.currentPage = (NSInteger)page;
    NSLog(@"page = %.2f,count = %zd",page,_pictures.count);
    
    //当滚动到最后一页时取消pagecontrol
//    if ((NSInteger)page == _pictures.count) {
//        self.pageC.hidden = YES;
//    }else {
//        self.pageC.hidden = NO;
//    }
    self.pageC.hidden = ((NSInteger)page == _pictures.count);
}

//scrollview减速时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 当滚动到最后一页移除新特性页面
    if (scrollView.contentOffset.x / self.frame.size.width == _pictures.count) {
        [self removeFromSuperview];
    }
}

@end
