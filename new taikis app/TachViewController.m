//
//  TachViewController.m
//  new taikis app
//
//  Created by 大氣 on 2015/03/14.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import "TachViewController.h"

@interface TachViewController ()

@end

@implementation TachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect appframe = [[UIScreen mainScreen] applicationFrame];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(150,550, 130, 130)];
    
    time =0.0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(up)
                                           userInfo:nil
                                            repeats:YES];
   
    
    label= [[UILabel alloc]initWithFrame:CGRectMake(0,0, 100,  100)];
   
    
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:label];
    speed = appframe.size.height /2 ;
    
}
-(void)up{
    time += 0.01;
    
    if (10.0 - 1.2 <= time) {
        float y = (time -10.0 + 1.2) * speed -75;
        label.frame = CGRectMake(135, y,100 , 100);
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
