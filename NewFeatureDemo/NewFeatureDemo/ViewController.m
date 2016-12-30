//
//  ViewController.m
//  NewFeatureDemo
//
//  Created by 边雷 on 16/12/30.
//  Copyright © 2016年 Mac-b. All rights reserved.
//

#import "ViewController.h"
#import "NewFeatureView.h"

@interface ViewController ()
@property(nonatomic, assign) BOOL hasNewFeature;
@end

@implementation ViewController
{
    NSArray<UIImage *> *_pictures;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hasNewFeature = YES;
    [self loadData];
    [self setupUI];
}


- (void)setupUI {
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cozy-control-car"]];
    imageView.frame = self.view.bounds;
    //修改图片模式
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
    //是否显示新特性页面
    if (_hasNewFeature) {
        NewFeatureView *NFV = [[NewFeatureView alloc]initWithFrame:self.view.bounds];
//        NFV.backgroundColor = [UIColor redColor];
        [self.view addSubview:NFV];
        NFV.pictures = _pictures;
    }
}

//加载数据(本地图片)
- (void)loadData
{
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"common_h%zd",i+1]];
        [arrM addObject:image];
    }
    _pictures = arrM.copy;
}
@end
