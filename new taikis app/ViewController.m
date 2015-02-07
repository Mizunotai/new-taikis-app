//
//  ViewController.m
//  new taikis app
//
//  Created by 大氣 on 2015/01/10.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    countDownTimer =[NSTimer   scheduledTimerWithTimeInterval:1
                                                       target:self
                                                     selector:@selector(countdwontime:)
                                                     userInfo:nil
                                                      repeats:YES];
    
    countDown = 3;
    rundomViewInt = arc4random_uniform(2);//画像をランダムで表示させるためのもの
    rundom = arc4random_uniform(4);//画像の名前表示させるためのもの
    NSLog(@"ぬっきーは%d才",rundomViewInt);
    
    downLabel =[[UILabel alloc]initWithFrame:
                CGRectMake(self.view.frame.size.width/2-100, self.view.frame.size.height/2-100 ,200 ,200)];
    downLabel.textColor = [UIColor blackColor];
    downLabel.font =[UIFont boldSystemFontOfSize:200];
    downLabel.textAlignment = NSTextAlignmentCenter;
    downLabel.text =[NSString stringWithFormat:@"%d",countDown];
    [self.view addSubview:downLabel];
    imgName = [NSString stringWithFormat:@"pico%d.png",rundomViewInt];
    
    img = [UIImage imageNamed:imgName];
    mainview = [[UIImageView alloc] initWithImage:img];
    mainview.frame = CGRectMake(350,200, 100,  100);
    mainview.contentMode = UIViewContentModeScaleAspectFit;
    
    if (rundomViewInt == 0) {
       name = @"とり";
        nameString[0] =@"とり";
        nameString[1] =@"ひこうき";
        nameString[2] =@"くも";
        nameString[3] =@"いぬ";
        
    }else if (rundomViewInt == 1){
        name = @"ひこうき";
        nameString[0] =@"とり";
        nameString[1] =@"ひこうき";
        nameString[2] =@"くも";
        nameString[3] =@"いぬ";
    }
    
    
    btnString[0]= @"btn1";
    btnString[1]= @"btn2";
    btnString[2]= @"btn3";
    btnString[3]= @"btn4";
    
    
    
    



    
    seikaiLabel = [[UILabel alloc]
                   initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100,self.view.frame.size.height-300,200  ,100 )];
    seikaiLabel.textColor = [UIColor whiteColor];
    
    seikaiLabel.font =[UIFont boldSystemFontOfSize:50];
    seikaiLabel.backgroundColor=[UIColor clearColor];
    seikaiLabel.text=[NSString stringWithFormat:@"%@",name];
    seikaiLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:seikaiLabel];
    seikaiLabel.alpha = 0 ;
    label.alpha = 0;
    BButtonType type = BButtonTypeSuccess;
    CGRect frame = CGRectMake(150,500,100,60);
    home=[[BButton alloc]initWithFrame:frame type:type];
    [home setTitle:@"ホームへ" forState:UIControlStateNormal];
    [home addTarget:self
            action:@selector(hoge:) forControlEvents:UIControlEventTouchUpInside];
   
    
    CGRect onemoreFrame =CGRectMake(112, 160, 155, 55);
    BButtonType onemoreType = BButtonTypeWarning;
    onemore =[[BButton alloc]initWithFrame:onemoreFrame type:onemoreType];
    [onemore setTitle:@"もう一度" forState:UIControlStateNormal];
    [onemore addTarget:self
                action:@selector(mouitido:) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect btnRect =CGRectMake(80,self.view.frame.size.height/2+20, 215, 50);
    BButtonType btnType =BButtonTypeSuccess ;
    btn1 =[[BButton alloc]initWithFrame:btnRect type:btnType];
    [btn1 addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"%@" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    
    CGRect btn2Rect =CGRectMake(80,self.view.frame.size.height/2+80 , 215, 50);
    BButtonType btn2Type =BButtonTypeSuccess ;
    btn2 =[[BButton alloc]initWithFrame:btn2Rect type:btn2Type];
    [btn2 addTarget:self action:@selector(btn2:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"%@" forState:UIControlStateNormal];
    
    btn2.titleLabel.text=[NSString stringWithFormat:@"%@",btnTitle1];
    
    [self.view addSubview:btn2];
    
    CGRect btn3Rect =CGRectMake(80,self.view.frame.size.height/2+140 , 215, 50);
    BButtonType btn3Type =BButtonTypeSuccess ;
    btn3 =[[BButton alloc]initWithFrame:btn3Rect type:btn3Type];
    [btn3 addTarget:self action:@selector(btn3:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setTitle:@"%@" forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    
    CGRect btn4Rect =CGRectMake(80,self.view.frame.size.height/2+200 , 215, 50);
    BButtonType btn4Type =BButtonTypeSuccess ;
    btn4 =[[BButton alloc]initWithFrame:btn4Rect type:btn4Type];
    [btn4 addTarget:self action:@selector(btn4:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setTitle:@"%@" forState:UIControlStateNormal];
    [self.view addSubview:btn4];
    

    

    
 
    }

- (void)countdwontime:(NSTimer *)_timer {
    
    countDown -= 1;
    downLabel .text = [NSString stringWithFormat:@"%d",countDown];
    
    if (countDown ==0){
    
        label.alpha = 1;
        downLabel.hidden = YES;
    
    
            [UIView animateWithDuration:0.8f
                             animations:^{
                                 label.alpha = 0;
            } completion:^(BOOL finished){
                [self.view addSubview:mainview];
                
                
                [UIView animateWithDuration:0.8f // アニメーション速度2.5秒
                                      delay:0.0f // 1秒後にアニメーション
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^{
                                     CGAffineTransform translate = CGAffineTransformMakeTranslation(-445, 0);
                                     [mainview setTransform:translate];
                                     // アニメーションをする処理
                                 } completion:^(BOOL finished) {
                                     // アニメーションが終わった後実行する処理
                                     //もう一度のボタンを表示
                                     [self.view addSubview:onemore];
                                   
//                                     [self.view addSubview:tf];
//                                     [tf becomeFirstResponder];
                                 }];

            }];
        }
    
}
-(void)mouitido:(UIButton *)button{
   
    mainview.frame = CGRectMake(350,200, 100,  100);
    mainview.contentMode = UIViewContentModeScaleAspectFit;

    [self.view addSubview:mainview];
    onemore.hidden = YES;
    
    
    
    [UIView animateWithDuration:0.8f // アニメーション速度2.5秒
                          delay:0.0f // 1秒後にアニメーション
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                        
                          CGAffineTransform translate = CGAffineTransformMakeTranslation(-890, 0);
                         [mainview setTransform:translate];
                         // アニメーションをする処理
                     } completion:^(BOOL finished) {
                         
                                                 //[tf becomeFirstResponder];
                         
                         
                     }];
    
    
}
-(void)btn:(UIButton *)button{
    
}
-(void)btn2:(UIButton *)button{
    
}
-(void)btn3:(UIButton *)button{
    
}
-(void)btn4:(UIButton *)button{
    
}

-(void)hoge:(UIButton*)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
