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

@implementation TachViewController{
    int hanteicount ;
   }

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    
    
    
   // UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(150,550, 130, 130)];
       time =1;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(up)
                                           userInfo:nil
                                            repeats:YES];
   
    CGRect appframe = [[UIScreen mainScreen] applicationFrame];
    
    button =[[UIButton alloc]initWithFrame:CGRectMake(appframe.size.width/2-25,appframe.size.height/2+250, 50, 50)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    hanteicount = 2;
    
    label= [[UILabel alloc]initWithFrame:CGRectMake(appframe.size.width/2-25,-50, 50,  50)];
    label.backgroundColor =[UIColor blackColor];
    [self.view addSubview:label];
    speed = appframe.size.height / 1.2;
    
}

    
-(void)up{
    time += 0.01;
 
    CGRect appframe = [[UIScreen mainScreen] applicationFrame];
    
    if (CGRectContainsPoint(button.frame,label.center)) {
        //NSLog(@"aaa");
    }
    
    
    if (10.0 - 1.2 <= time ) {
        
        
        float y = (time - 10.0 + 1.2) * speed -75 ;
        label.frame = CGRectMake(appframe.size.width/2 -25, y, 50, 50);
        
//        [UIView animateWithDuration:1 // アニメーション速度2.5秒
//                              delay:0.0f // 1秒後にアニメーション
//                            options:UIViewAnimationOptionCurveEaseIn
//                         animations:^{
//                             CGAffineTransform translate = CGAffineTransformMakeTranslation(0,900*hanteicount);
//                             [label setTransform:translate];
//                             // アニメーションをする処理
//                         } completion:^(BOOL finished) {
//                            hanteicount ++;
//                             label.frame =CGRectMake(appframe.size.width/2-25,-50, 50, 50);
//                             [self.view addSubview:label];
        
//                         }];
        
        
    }
    
}
- (NSString *)hantei:(float)number{
//    
//    if(time >= number - 0.05 && time <= number + 0.05)
//    {
//        NSLog(@"パーフェクト");
//        return @"PERFECT!!" ;
//    }else if(time >=number -0.10 && time <= number + 0.10){
//        NSLog(@"グレイト");
//        return @"GREAT!" ;
//        
//    }else if(time >= number - 0.15 && time <= number + 0.15) {
//        NSLog(@"グッド");
//        return @"GOOD" ;
//    }else{
//        NSLog(@"パッド");
//        return @"BAD" ;
//    }
    
    
    return 0;
    
}

-(void)button {
//    [self hantei:time ];
    float sa = (label.layer.position.y - button.layer.position.y);
   
    
   
    if (sa == 0) {
        NSLog(@"パーフェクト");
        [label removeFromSuperview];
    }else if (sa >= sa+0.15 && sa <= sa-0.15){
        NSLog(@"グレイト");
    }else if (sa >= sa+0.3 && sa <= sa-0.3){
        NSLog(@"グッと");//    [self hantei:3.0];

    if (label.layer.position.y == button.layer.position.y) {
       NSLog(@"パーフェクト");
  }
    if (label.layer.position.y+button.layer.position.y  ) {
        NSLog(@"ががが");
    }

    }else if(sa >sa+0.3 && sa <sa-0.3){
        NSLog(@"論外");
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
