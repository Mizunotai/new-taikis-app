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
    
    int rundomViewInt ;
    NSMutableArray *nameString;
    
    UILabel *seikaiLabel;
    NSString *imgName;
    NSString *name ;
    UIButton *home;
    
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    int rundom;
    
    
  
    
 

    
    
    
}



@end

