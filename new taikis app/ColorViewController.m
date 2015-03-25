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
    
    idouLabel =[[UILabel alloc]initWithFrame:CGRectMake(450,200, 100,  100)];
    
    
    num = arc4random()%4;
    NSLog(@"%d",num);
    switch (num) {
            
        case 0:
            idouLabel.backgroundColor = [UIColor redColor];
            NSLog(@"赤");
            colorName =@"赤色" ;
            colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
            break;
        case 1:
            idouLabel.backgroundColor = [UIColor yellowColor];
           NSLog(@"黄");
            colorName =@"黄色" ;
            colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
            break;
        case 2:
            idouLabel.backgroundColor = [UIColor blueColor];
            NSLog(@"青");
            colorName =@"青色" ;
            colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
            break;
        case 3:
            idouLabel.backgroundColor = [UIColor greenColor];
            NSLog(@"緑");
            colorName =@"緑色" ;
            colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
            break;
    }
    countDwon = 3;
    downLabel =[[UILabel alloc]initWithFrame:
                CGRectMake(self.view.frame.size.width/2-100, self.view.frame.size.height/2-100 ,200 ,200)];
    downLabel.textColor = [UIColor blackColor];
    downLabel.font =[UIFont boldSystemFontOfSize:200];
    downLabel.textAlignment = NSTextAlignmentCenter;
    downLabel.text =[NSString stringWithFormat:@"%d",countDwon];
    [self.view addSubview:downLabel];

    timer =[NSTimer   scheduledTimerWithTimeInterval:1
                                              target:self
                                            selector:@selector(time:)
                                            userInfo:nil
                                             repeats:YES];
   
   
    totalProblem =10;
    currentProblem = 0;
    
    for (int i; i <[colorNamesArray count]; i++) {
        int j = arc4random()%4;
        [colorNamesArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
   
    
    
    /* 一つ目のボタン */
    CGRect btnRect =CGRectMake(80,self.view.frame.size.height/2+20, 215, 50);
    BButtonType btnType =BButtonTypeSuccess ;
    btn1 =[[BButton alloc]initWithFrame:btnRect type:btnType];
  [btn1 setTitle: [NSString stringWithFormat:@"%@",colorNamesArray[0]]  forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    /*　２つ目のボタン　*/
    CGRect btn2Rect =CGRectMake(80,self.view.frame.size.height/2+80 , 215, 50);
    BButtonType btn2Type =BButtonTypeSuccess ;
    btn2 =[[BButton alloc]initWithFrame:btn2Rect type:btn2Type];
    [btn2 setTitle: [NSString stringWithFormat:@"%@",colorNamesArray[1]]  forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2:) forControlEvents:UIControlEventTouchUpInside];
    
    /* 三つ目もボタン */
    CGRect btn3Rect =CGRectMake(80,self.view.frame.size.height/2+140 , 215, 50);
    BButtonType btn3Type =BButtonTypeSuccess ;
    btn3 =[[BButton alloc]initWithFrame:btn3Rect type:btn3Type];
    [btn3 setTitle: [NSString stringWithFormat:@"%@",colorNamesArray[2]]  forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3:) forControlEvents:UIControlEventTouchUpInside];
    
    /*　四つ目のボタン　*/
    CGRect btn4Rect =CGRectMake(80,self.view.frame.size.height/2+200 , 215, 50);
    BButtonType btn4Type =BButtonTypeSuccess ;
    btn4 =[[BButton alloc]initWithFrame:btn4Rect type:btn4Type];
    [btn4 setTitle: [NSString stringWithFormat:@"%@",colorNamesArray[3]]  forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btn4:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)time:(NSTimer *)time{
    countDwon -= 1;
    downLabel .text = [NSString stringWithFormat:@"%d",countDwon];
    if (countDwon == 0){
        [time invalidate];
        NSLog(@"%d",countDwon);
        [self.view addSubview:idouLabel];
        [downLabel removeFromSuperview];
        [UIView animateWithDuration:0.1
                              delay:0.0f
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             CGAffineTransform translate = CGAffineTransformMakeTranslation(-550, 0);
                             [idouLabel setTransform:translate];
                             
                         }completion:^(BOOL finish){
                             [self.view addSubview:btn1];
                             [self.view addSubview:btn2];
                             [self.view addSubview:btn3];
                             [self.view addSubview:btn4];
                             
                             
                         }];
        
   }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)btn:(UIButton *)button{
    if (colorName == colorNamesArray[0]) {
        NSLog(@"正解" );
        correctAnswers ++;
    }else {
        NSLog(@"不正解");
    }
    
    [self nextProblem];
}

-(void)btn2:(UIButton *)button{
    if (colorName == colorNamesArray[1]) {
        NSLog(@"正解");
        correctAnswers ++;
    }else{
        NSLog(@"不正解");
    }
    [self nextProblem];
}

-(void)btn3:(UIButton *)button{
    if (colorName == colorNamesArray[2]) {
        NSLog(@" 正解");
        correctAnswers++;
    }else{
        NSLog(@"不正解");
    }
    [self nextProblem];
}

-(void)btn4:(UIButton *)button{
    if (colorName == colorNamesArray[3]) {
        NSLog(@"正解");
        correctAnswers++ ;
    }else{
        NSLog(@"不正解");
    }
    [self nextProblem];
}



-(void)nextProblem {
    if ( totalProblem > currentProblem){
        
        currentProblem ++ ;
        num = arc4random()%4;
        NSLog(@"%dだ",num);
        switch (num) {
                
            case 0:
                idouLabel.backgroundColor = [UIColor redColor];
                NSLog(@"赤");
                colorName =@"赤色" ;
                colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
                break;
            case 1:
                idouLabel.backgroundColor = [UIColor yellowColor];
                NSLog(@"黄");
                colorName =@"黄色" ;
                colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
                break;
            case 2:
                idouLabel.backgroundColor = [UIColor blueColor];
                NSLog(@"青");
                colorName =@"青色" ;
                colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
                break;
            case 3:
                idouLabel.backgroundColor = [UIColor greenColor];
                NSLog(@"緑");
                colorName =@"緑色" ;
                colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
                break;
        }

        idouLabel.frame = CGRectMake(450,200, 100,  100);
        [self.view addSubview:idouLabel];
        
        
                    [UIView animateWithDuration:0.1
                              delay:0.5f
                            options:UIViewAnimationOptionCurveEaseIn
                        animations:^{
                            if (currentProblem == 1) {
                                CGAffineTransform translate = CGAffineTransformMakeTranslation(-550*2, 0);
                                [idouLabel setTransform:translate];
                                currentProblem ++;
                            }else{
                             CGAffineTransform translate = CGAffineTransformMakeTranslation(-550*currentProblem, 0);
                             [idouLabel setTransform:translate];
                                }
                            NSLog(@"%dだよ",currentProblem);
                         }completion:^(BOOL finish){
                             [self.view addSubview:btn1];
                             [self.view addSubview:btn2];
                             [self.view addSubview:btn3];
                             [self.view addSubview:btn4];
                             
                             
                         }];


    }else{
        [btn1 removeFromSuperview];
        [btn2 removeFromSuperview];
        [btn3 removeFromSuperview];
        [btn4 removeFromSuperview];
        
        UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(0, 198, 365, 163)];
        label.text =[NSString stringWithFormat:@"10問中%d問正解",correctAnswers];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont boldSystemFontOfSize:40];
        [self.view addSubview:label];
        
        CGRect backBtnRect =CGRectMake(80,self.view.frame.size.height/2+200 , 215, 50);
        BButtonType backBtnType =BButtonTypeSuccess ;
        UIButton *backbtn =[[BButton alloc]initWithFrame:backBtnRect type:backBtnType];
        [backbtn setTitle: @"ホームへ"  forState:UIControlStateNormal];
        [backbtn addTarget:self action:@selector(backbtton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backbtn];
        }
    
    
}
-(void)backbtton:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
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
