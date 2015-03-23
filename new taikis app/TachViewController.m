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
   
    
    
    
   // UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(150,550, 130, 130)];
       time =0.0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(up)
                                           userInfo:nil
                                            repeats:YES];
   
    CGRect appframe = [[UIScreen mainScreen] applicationFrame];
    label= [[UILabel alloc]initWithFrame:CGRectMake(appframe.size.width/2-25,0, 50,  50)];
    label.backgroundColor =[UIColor blackColor];
   [self.view addSubview:label];
//    speed = appframe.size.width /2 ;
    
}
-(void)up{
    time += 0.01;
    NSLog(@"%f",time);
    if (time > 3.0) {
        [UIView animateWithDuration:0.3f // アニメーション速度2.5秒
                              delay:0.0f // 1秒後にアニメーション
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             CGAffineTransform translate = CGAffineTransformMakeTranslation(0,900);
                             [label setTransform:translate];
                             // アニメーションをする処理
                         } completion:^(BOOL finished) {
                            
                             
                             
                         }];

        
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
