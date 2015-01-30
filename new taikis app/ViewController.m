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
    rundomViewInt = arc4random_uniform(2);
    
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
        name =@"とり";
       
       
    }else if (rundomViewInt == 1){
        name = @"ひこうき";
    }
    
    
    //正解を入力するtextfieldの生成
    tf = [[UITextField alloc]initWithFrame:CGRectMake(112, 236, 150, 40)];
    tf.textColor =[UIColor blackColor];
    tf.backgroundColor = [UIColor whiteColor];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.placeholder =@"ここに書いてね";
    tf.keyboardType =UIKeyboardTypeDefault;
    tf.returnKeyType = UIReturnKeyDone;
    tf.clearButtonMode = UITextFieldViewModeAlways;
    tf.delegate = self ;
    
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
    BButtonType type = BButtonTypeFacebook;
    CGRect frame = CGRectMake(150,500,100,60);
    
//  home =[[ UIButton alloc]initWithFrame:CGRectMake(150,40,100, 60)];
    home=[[BButton alloc]initWithFrame:frame type:type];

    [home setTitle:@"ホームへ" forState:UIControlStateNormal];
    [home addTarget:self
            action:@selector(hoge:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    }
-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    
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
                                     onemore =[[UIButton alloc]initWithFrame:CGRectMake(112, 160, 155, 55)];
                                     onemore.backgroundColor =[UIColor redColor];
                                     [onemore setTitle:@"もう一度" forState:UIControlStateNormal];
                                     [onemore addTarget:self
                                                 action:@selector(mouitido:) forControlEvents:UIControlEventTouchUpInside];
                                     [self.view addSubview:onemore];
                                     //TextField表示
                                     
                                     [self.view addSubview:tf];
                                     [tf becomeFirstResponder];
                                 }];

            }];
        }
    
}
-(void)mouitido:(UIButton *)button{
   
    mainview.frame = CGRectMake(350,200, 100,  100);
    mainview.contentMode = UIViewContentModeScaleAspectFit;

    [self.view addSubview:mainview];
    onemore.hidden = YES;
    [tf removeFromSuperview];
    
    
    [UIView animateWithDuration:0.8f // アニメーション速度2.5秒
                          delay:0.0f // 1秒後にアニメーション
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                        
                          CGAffineTransform translate = CGAffineTransformMakeTranslation(-890, 0);
                         [mainview setTransform:translate];
                         // アニメーションをする処理
                     } completion:^(BOOL finished) {
                         
                         [self.view addSubview:tf];
                         [tf becomeFirstResponder];
                         
                         
                     }];
    
    
}
//Doneしたらキーボードを閉じる
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}
/*キーボードを閉じた時*/
- (void)textFieldDidEndEditing:(UITextField *)textField
{
  
    //テキストフィールドとNSStringで宣言して文字が一致した時
    if ([textField.text isEqualToString:name]) {
        NSLog(@"一致");
        [tf  removeFromSuperview];
        [onemore removeFromSuperview];
        
        mainview.frame = CGRectMake(self.view.frame.size.width/2 - 150,self.view.frame.size.height-600, 300,  300);
        mainview.contentMode = UIViewContentModeScaleAspectFit;
        mainview.alpha = 0;
        self.view.backgroundColor = [UIColor blackColor];
    
        //5秒かけて画像を表示
        [UIView animateWithDuration:5.0
                         animations:^{
                             mainview.alpha = 1.0;
                             seikaiLabel.alpha = 1.0;
                         }completion:^(BOOL finished){
                            [self.view addSubview:home];
                         }];
        
         
     
        
    }
   
}


//画面のどこかをタッチしたらキーボードを閉じる
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view.subviews enumerateObjectsUsingBlock:^(UIView* obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITextField class]]) {
            [obj resignFirstResponder];
        }
    }];
}

-(void)hoge:(UIButton*)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
