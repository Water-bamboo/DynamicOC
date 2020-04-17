//
//  ViewController.m
//  DynamicOC
//
//  Created by dKingbin on 2019/7/16.
//  Copyright © 2019 dKingbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad2
{
    [super viewDidLoad];
    self.title = @"DynamicOC";
    CGRect frame = CGRectMake(10, 64, 200, 48);
    UILabel *btnView = [[UILabel alloc] initWithFrame:frame];
    btnView.textAlignment = 1;//NSTextAlignmentCenter;
    btnView.text = @"New View";
//    [btnView addTarget:self action:@selector(asdf:) forControlEvents:1 <<  6];
//    [view setTitleColor:UIColor.purpleColor forState:UIControlStateNormal];
    btnView.backgroundColor = UIColor.greenColor;
    [self.view addSubview:btnView];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    UIButton *btn = [UIButton new];
    [btn setTitle:@"Old View" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.purpleColor
                forState:UIControlStateNormal];
    btn.backgroundColor = UIColor.redColor;
    btn.frame = CGRectMake(200, 200, 120, 48);
    
    [self.view addSubview:btn];
}

@end
