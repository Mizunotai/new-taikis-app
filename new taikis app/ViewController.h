//
//  ViewController.h
//  new taikis app
//
//  Created by 大氣 on 2015/01/10.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{
    
    IBOutlet UILabel *downLabel;
    int countDown ;
    NSTimer * countDownTimer;
    
    UIImage *img;
    UIImageView *mainBidama;
    UIButton *onemore;
    
    UITextField *tf;//答えを入力する。
    
    
    UIButton*decideButton;//入力した答えで決定する。
    
    
}



@end

