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
    float time ;
    float d;
    NSTimer *timer;
    UILabel *countDwonLabel;
    CAShapeLayer *l;
    CAShapeLayer *whiteLayer;
    UILabel *idouLabel;
 
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    NSString *colorName;
    NSMutableArray *colorNamesArray;
    int num ;
    int totalProblem;//出題する問題の数
    //現在の進捗（出題済み問題数）を記録
    int currentProblem;
    
    //正答数
    int correctAnswers;
    UILabel *downLabel;
}

@end
