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
    /*タイマー*/
  
    NSTimer *timer;
    UIButton*button;
    UILabel *label;
    int labelY;


   }

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    
    
    
   

    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(up)
                                           userInfo:nil
                                            repeats:YES];
   
    
    
    button =[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-25,self.view.frame.size.height/2+250, 50, 50)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [self addLabel];
    
   
    
    
}

    
-(void)up{
    labelY=labelY+10;
    label.center = CGPointMake(self.view.frame.size.width/2, labelY);
    if (label.center.y >= 700) {
        [label removeFromSuperview];
        [self addLabel];
    }
}
-(void)addLabel{
    labelY = 0;
    label= [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-25,0, 50,  50)];
    label.backgroundColor =[UIColor blackColor];
    label.center = CGPointMake(self.view.frame.size.width/2-25, labelY);
    [self.view addSubview:label];

}

-(void)button {
    
}
    


    

    



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //    if (CGRectContainsPoint(button.frame,label.center)) {
    //
    //        NSLog(@"aaa");
    //    }
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
