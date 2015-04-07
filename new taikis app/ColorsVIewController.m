//
//  ColorsVIewController.m
//  new taikis app
//
//  Created by 大氣 on 2015/04/07.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import "ColorsVIewController.h"

@implementation ColorsVIewController{
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    UILabel *idouLabel;
    int num;
    NSString *colorName;
    NSMutableArray *colorNamesArray;
    NSTimer *timer;
    float time;
    NSTimer *timer2;
    float drow;
    UILabel *countDwonLabel;
    CAShapeLayer *l;
    CAShapeLayer *whiteLayer;
    
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];//背景色
    
    idouLabel =[[UILabel alloc]initWithFrame:CGRectMake(450,200, 100,  100)]; //移動するlabel
    num = arc4random()%4;
    switch (num) {
        case 0:
            idouLabel.backgroundColor = [UIColor redColor];
            NSLog(@"赤");
            colorName =@"赤色" ;
            colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
            break;
        case 1:
            idouLabel.backgroundColor = [UIColor yellowColor];
            NSLog(@"黄");
            colorName =@"黄色" ;
            colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
            break;
        case 2:
            idouLabel.backgroundColor = [UIColor blueColor];
            NSLog(@"青");
            colorName =@"青色" ;
            colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
            break;
        case 3:
            idouLabel.backgroundColor = [UIColor greenColor];
            NSLog(@"緑");
            colorName =@"緑色" ;
            colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
            break;
    }
    /*------------------------------ボタン関係-----------------------------------*/
    for (int i; i <[colorNamesArray count]; i++) {
        int j = arc4random()%4;
        [colorNamesArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    
    
    /* 一つ目のボタン */
    CGRect btnRect =CGRectMake(80,self.view.frame.size.height/2+20, 215, 50);
    BButtonType btnType =BButtonTypeSuccess ;
    btn1 =[[BButton alloc]initWithFrame:btnRect type:btnType];
    [btn1 setTitle: [NSString stringWithFormat:@"%@",colorNamesArray[0]]  forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    /*　２つ目のボタン　*/
    CGRect btn2Rect =CGRectMake(80,self.view.frame.size.height/2+80 , 215, 50);
    BButtonType btn2Type =BButtonTypeSuccess ;
    btn2 =[[BButton alloc]initWithFrame:btn2Rect type:btn2Type];
    [btn2 setTitle: [NSString stringWithFormat:@"%@",colorNamesArray[1]]  forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2) forControlEvents:UIControlEventTouchUpInside];
    
    /* 三つ目もボタン */
    CGRect btn3Rect =CGRectMake(80,self.view.frame.size.height/2+140 , 215, 50);
    BButtonType btn3Type =BButtonTypeSuccess ;
    btn3 =[[BButton alloc]initWithFrame:btn3Rect type:btn3Type];
    [btn3 setTitle: [NSString stringWithFormat:@"%@",colorNamesArray[2]]  forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3) forControlEvents:UIControlEventTouchUpInside];
    
    /*　四つ目のボタン　*/
    CGRect btn4Rect =CGRectMake(80,self.view.frame.size.height/2+200 , 215, 50);
    BButtonType btn4Type =BButtonTypeSuccess ;
    btn4 =[[BButton alloc]initWithFrame:btn4Rect type:btn4Type];
    [btn4 setTitle: [NSString stringWithFormat:@"%@",colorNamesArray[3]]  forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btn4) forControlEvents:UIControlEventTouchUpInside];
    
    l = [CAShapeLayer layer];
    whiteLayer = [CAShapeLayer layer];
    
    [self drawPathGraph:0:360:[UIColor blackColor]:100:l];
    [self drawPathGraph:0:360:[UIColor whiteColor]:70:whiteLayer];
    
    countDwonLabel =[[UILabel alloc]initWithFrame:
                     CGRectMake(self.view.bounds.size.width/2-50,self.view.bounds.size.height/2-50,100,100)];
    countDwonLabel.font =[UIFont boldSystemFontOfSize:80];
    countDwonLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:countDwonLabel];
    
    
    [self.view.layer addSublayer:l];
    [self.view.layer addSublayer:whiteLayer];
    [self.view bringSubviewToFront:countDwonLabel];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(up)
                                           userInfo:nil
                                            repeats:YES];
    time = 4 ;
    
    timer2 = [NSTimer scheduledTimerWithTimeInterval:0.01
                                              target:self
                                            selector:@selector(up2)
                                            userInfo:nil
                                             repeats:YES];
    
    drow = 0;
    
    
}
-(void)up{
    
    
    if (time <=1) {
        
        [self addlabel];
    }
}
-(void)up2{
    time -=0.01;
    drow ++ ;
    [self drawPathGraph:drow*3.6:360-drow*3.6:[UIColor blackColor]:100:l];
    countDwonLabel.text = [NSString stringWithFormat:@"%d",(int)time];
    if (time<=1) {
        [timer2 invalidate];
        [l removeFromSuperlayer];
        [whiteLayer removeFromSuperlayer];
        [countDwonLabel removeFromSuperview];
        
    }
    
}
-(void)addlabel{
    idouLabel =[[UILabel alloc]initWithFrame:CGRectMake(450,200, 100,  100)]; //移動するlabel
    num = arc4random()%4;
    switch (num) {
        case 0:
            idouLabel.backgroundColor = [UIColor redColor];
            NSLog(@"赤");
            colorName =@"赤色" ;
            colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
            break;
        case 1:
            idouLabel.backgroundColor = [UIColor yellowColor];
            NSLog(@"黄");
            colorName =@"黄色" ;
            colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
            break;
        case 2:
            idouLabel.backgroundColor = [UIColor blueColor];
            NSLog(@"青");
            colorName =@"青色" ;
            colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
            break;
        case 3:
            idouLabel.backgroundColor = [UIColor greenColor];
            NSLog(@"緑");
            colorName =@"緑色" ;
            colorNamesArray =[@[@"赤色",@"黄色",@"青色",@"緑色"]mutableCopy];
            break;
    }

    
}

-(void)btn1{
    
}
-(void)btn2{
    
}
-(void)btn3{
    
}
-(void)btn4{
    
}
- (void) drawFunShapeWithCenter:(CGPoint)center
                         radius:(CGFloat)radius
                     startAngle:(CGFloat)startAngle
                          angle:(CGFloat)angle
                          color:(UIColor*)color
                       casLayer:(CAShapeLayer*)casLayer
{
    // インスタンス生成
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    
    // 終了角度を算出
    CGFloat endAngle = startAngle + angle;
    
    [path addArcWithCenter:center
                    radius:radius
                startAngle:startAngle
                  endAngle:endAngle
                 clockwise:YES];
    // 円弧から中心へ直線を引く
    [path addLineToPoint:center];
    
    
    // 描画実行
    casLayer.path = path.CGPath;
    if (color) {
        casLayer.strokeColor = color.CGColor;
        casLayer.fillColor = color.CGColor;
    }
    
    
    
    
}

// pathに渡す値を作成するメソッド
- (void)drawPathGraph:(CGFloat)setStartAngle
                     :(CGFloat)setEndAngle
                     :(UIColor*)setColor
                     :(float)r
                     :(CAShapeLayer*)casLayer{
    // 円の中心点
    CGFloat centerX = self.view.bounds.size.width / 2;
    CGFloat centerY = self.view.bounds.size.height / 2;
    CGPoint center = CGPointMake(centerX, centerY);
    
    // 円の半径
    CGFloat radius = r;
    // 開始角度
    CGFloat startAngle = M_PI*2 * (90-setStartAngle)/360 * (-1);
    
    CGFloat angle = M_PI*2 * setEndAngle/360;
    UIColor* color = setColor;
    [self drawFunShapeWithCenter:center radius:radius startAngle:startAngle angle:angle color:color casLayer:casLayer];
}



@end
