//
//  ViewController.m
//  NewFeatureDemo
//
//  Created by 边雷 on 16/12/30.
//  Copyright © 2016年 Mac-b. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


- (void)setupUI {
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cozy-control-car"]];
    imageView.frame = self.view.bounds;
    //修改图片模式
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
}


@end
