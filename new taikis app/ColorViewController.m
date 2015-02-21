//
//  ColorViewController.m
//  new taikis app
//
//  Created by 大氣 on 2015/02/21.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()

@end

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    idouLabel =[[UILabel alloc]initWithFrame:CGRectMake(350,200, 100,  100)];
    
    int num = arc4random()%4;
    NSLog(@"%d",num);
    switch (num) {
        case 1:
            idouLabel.backgroundColor = [UIColor redColor];
            NSLog(@"赤");
            break;
        case 2:
            idouLabel.backgroundColor = [UIColor yellowColor];
           NSLog(@"黄");
            break;
        case 3:
            idouLabel.backgroundColor = [UIColor blueColor];
            NSLog(@"青");
            break;
        case 4:
            idouLabel.backgroundColor = [UIColor greenColor];
            NSLog(@"緑");
            break;
    }
    
    timer =[NSTimer   scheduledTimerWithTimeInterval:1
                                              target:self
                                            selector:@selector(time:)
                                            userInfo:nil
                                             repeats:YES];

    countDwon = 1;
    NSLog(@"%daaaaa",countDwon);

//    [self.view addSubview:idouLabel];
    
}
-(void)time:(NSTimer *)time{
  countDwon -= 1;
   
    if (countDwon == 0){
        NSLog(@"%d",countDwon);
        [self.view addSubview:idouLabel];
        
        [UIView animateWithDuration:0.1
                              delay:0.0f
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             CGAffineTransform translate = CGAffineTransformMakeTranslation(-450, 0);
                             [idouLabel setTransform:translate];
                             
                         }completion:^(BOOL finish){
                             
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
