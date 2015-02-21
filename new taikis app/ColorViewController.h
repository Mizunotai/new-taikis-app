//
//  ColorViewController.h
//  new taikis app
//
//  Created by 大氣 on 2015/02/21.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BButton.h"
@interface ColorViewController : UIViewController{
    
    UILabel *idouLabel;
    int countDwon;
    NSTimer * timer;
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    NSString *colorName;
    NSMutableArray *colorNamesArray;
}

@end
