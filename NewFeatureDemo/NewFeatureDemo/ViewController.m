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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hasNewFeature = YES;
    
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
        NFV.backgroundColor = [UIColor redColor];
        [self.view addSubview:NFV];
    }
}


@end
