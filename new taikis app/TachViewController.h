//
//  TachViewController.h
//  new taikis app
//
//  Created by 大氣 on 2015/03/14.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TachViewController : UIViewController
{
    /*タイマー*/
    float time;
    NSTimer *timer;
    
    
    UIButton*button;
 
    UILabel *label;
    float speed;
}
-(void)up;
-(void)button;
-(NSString *)hantei:(float)number;


@end
