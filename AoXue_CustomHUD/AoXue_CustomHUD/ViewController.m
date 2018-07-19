//
//  ViewController.m
//  AoXue_CustomHUD
//
//  Created by yangqijia on 16/6/29.
//  Copyright © 2016年 yangqijia. All rights reserved.
//

#import "ViewController.h"
#import "CustomHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array = [NSArray arrayWithObjects:@"显示风火轮以及提示语10秒后消失",@"根据需求消失",@"仅显示提示语", nil];
    
    for (int i = 0; i < array.count; i++) {
        UIButton *touchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        touchBtn.frame = CGRectMake(0, 0, self.view.frame.size.width-60, 30);
        touchBtn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/4*(i+1)-30);
        [touchBtn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        [touchBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        touchBtn.layer.cornerRadius = 8.0;
        touchBtn.layer.borderWidth = 1.0;
        touchBtn.tag = i;
        touchBtn.layer.borderColor = [UIColor redColor].CGColor;
        [touchBtn addTarget:self action:@selector(showHUD:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:touchBtn];
    }

}

-(void)showHUD:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
        {
            [CustomHUD createHudCustomTime:10.0 showContent:@"显示风火轮以及提示语10秒后消失"];
            [self performSelector:@selector(changeContent) withObject:nil afterDelay:5.0];
        }
            break;
        case 1:
        {
            [CustomHUD createHudCustomShowContent:@"根据需求消失"];
            [self performSelector:@selector(hiddenHUD) withObject:nil afterDelay:2];
        }
            break;
        case 2:
        {
            [CustomHUD createShowContent:@"仅显示提示语"];
        }
            break;
        default:
            break;
    }
}

-(void)hiddenHUD
{
    [CustomHUD changeShowText:@"修改后的内容"];
    [CustomHUD stopHidden];
}

-(void)changeContent
{
    [CustomHUD changeShowText:@"修改后的内容"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
