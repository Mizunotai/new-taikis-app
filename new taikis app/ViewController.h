//
//  ViewController.h
//  new taikis app
//
//  Created by 大氣 on 2015/01/10.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BButton.h"
@interface ViewController: UIViewController<UITextFieldDelegate>{
  
     UILabel *downLabel;
    int countDown ;
    NSTimer * countDownTimer;
    IBOutlet UILabel *label;
    
    UIImage *img;
    UIImageView *mainview;
    UIButton *onemore;
    
    UITextField *tf;//答えを入力する。
    
    int rundomViewInt ;
    
    UILabel *seikaiLabel;
    NSString *imgName;
    NSString *viewName ;
    UIButton *home;
    
    NSArray *viewNames;
   
}



@end

