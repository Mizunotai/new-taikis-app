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
    countDownTimer =[NSTimer   scheduledTimerWithTimeInterval:1
                                                       target:self
                                                     selector:@selector(countdwontime:)
                                                     userInfo:nil
                                                      repeats:YES];
    
    countDown = 3;
    rundomViewInt = arc4random_uniform(2);
    
    NSLog(@"ぬっきーは%d才",rundomViewInt);
    
    downLabel.text =[NSString stringWithFormat:@"%d",countDown];
    NSString *imgName = [NSString stringWithFormat:@"pico%d.png",rundomViewInt];
    img = [UIImage imageNamed:imgName];
    mainview = [[UIImageView alloc] initWithImage:img];
    mainview.frame = CGRectMake(320,200, 100,  100);//[[UIScreen mainScreen]  bounds];
    
//    CGRect rect = CGRectMake(320,200, 45,  45);
    mainview.center = CGPointMake(320, 200);
    
    mainview.contentMode = UIViewContentModeScaleAspectFit;
    
    
    //textfieldの情報
    tf = [[UITextField alloc]initWithFrame:CGRectMake(112, 236, 150, 40)];
    tf.textColor =[UIColor blackColor];
    tf.backgroundColor = [UIColor whiteColor];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.placeholder =@"ここに書いてね";
    tf.keyboardType =UIKeyboardTypeDefault;
    tf.returnKeyType = UIReturnKeyDone;
    tf.clearButtonMode = UITextFieldViewModeAlways;
    tf.delegate = self ;
    
    decideButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    decideButton = [[UIButton alloc]initWithFrame:CGRectMake(112, 400, 150, 40)];
    decideButton.backgroundColor = [UIColor yellowColor];
    [decideButton setTitle:@"決定" forState:UIControlStateNormal];
    [decideButton addTarget:self action:@selector(decide:)
           forControlEvents:UIControlEventTouchUpInside];
}
- (void)countdwontime:(NSTimer *)_timer {
    
    countDown -= 1;
    downLabel .text = [NSString stringWithFormat:@"%d",countDown];
    
    if (countDown ==0){
    
        
        downLabel.hidden = YES;
        
        
        [self.view addSubview:mainview];
        [UIView animateWithDuration:1.0f // アニメーション速度2.5秒
                              delay:0.0f // 1秒後にアニメーション
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             CGAffineTransform translate = CGAffineTransformMakeTranslation(-400, 0);
                             [mainview setTransform:translate];
                             // アニメーションをする処理
                         } completion:^(BOOL finished) {
                             // アニメーションが終わった後実行する処理
                             //もう一度のボタンを表示
                             onemore =[[UIButton alloc]initWithFrame:CGRectMake(112, 160, 155, 55)];
                             onemore.backgroundColor =[UIColor redColor];
                             [onemore setTitle:@"もう一度" forState:UIControlStateNormal];
                             [onemore addTarget:self
                                         action:@selector(mouitido:) forControlEvents:UIControlEventTouchUpInside];
                             [self.view addSubview:onemore];
                             //TextField表示
                             
                             [self.view addSubview:tf];
                             [tf becomeFirstResponder];
                             [self.view addSubview:decideButton];
                         }];
        
    }
}
-(void)mouitido:(UIButton *)button{
    //    mainBidama.hidden ;
//    CGRect rect = CGRectMake(320,200, 30,  30);
//    mainview.frame = rect;
    mainview.frame = [[UIScreen mainScreen]  bounds];
    mainview.center = CGPointMake(320, 200);
    
    mainview.contentMode = UIViewContentModeScaleAspectFit;

    [self.view addSubview:mainview];
    onemore.hidden = YES;
    tf.alpha = 0;
    decideButton.alpha = 0;
    
    [UIView animateWithDuration:1.0f // アニメーション速度2.5秒
                          delay:0.0f // 1秒後にアニメーション
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGAffineTransform translate = CGAffineTransformMakeTranslation(-800, 0);
                         [mainview setTransform:translate];
                         // アニメーションをする処理
                     } completion:^(BOOL finished) {
                         
                         tf.alpha = 1;
                         [tf becomeFirstResponder];
                         decideButton.alpha = 1 ;
                         
                     }];
    
    
}
//Doneしたらキーボードを閉じる
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}
/*画面のどこかをタッチしたらキーボードを閉じる*/
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [self.view.subviews enumerateObjectsUsingBlock:^(UIView* obj, NSUInteger idx, BOOL *stop) {
//        if ([obj isKindOfClass:[UITextField class]]) {
//            [obj resignFirstResponder];
//        }
//    }];
//}

-(void)decide:(UIButton *)button {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
