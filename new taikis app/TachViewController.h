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
    float time;
    NSTimer *timer;
    float speed;
    UILabel *label;
    int random;
}
-(void)up;
@end
