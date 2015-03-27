//
//  TachViewController.m
//  new taikis app
//
//  Created by 大氣 on 2015/03/14.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import "TachViewController.h"

@interface TachViewController ()

@end

@implementation TachViewController{
    /*タイマー*/
    
    
    UIButton*button;
    UILabel *label;
    int labelY,labelX;
    
    float time ;
    float d;
    NSTimer *timer;
    UILabel *countDwonLabel;
    CAShapeLayer *l;
    CAShapeLayer *whiteLayer;
    
    int rundom;
    int num;
    NSTimer *timera;
    
    int count;
    UILabel * countLabel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
    button =[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-25,self.view.frame.size.height/2-25, 50, 50)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchDown];
    
    
    [self addLabel];
    
    l = [CAShapeLayer layer];
    whiteLayer = [CAShapeLayer layer];
    
    [self drawPathGraph:0:360:[UIColor blackColor]:100:l];
    [self drawPathGraph:0:360:[UIColor whiteColor]:70:whiteLayer];
    
    countDwonLabel =[[UILabel alloc]initWithFrame:
                     CGRectMake(self.view.bounds.size.width/2-50,self.view.bounds.size.height/2-50,100,100)];
    //    countDwonLabel.backgroundColor = [UIColor redColor];
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
    
    timera = [NSTimer scheduledTimerWithTimeInterval:0.01
                                              target:self
                                            selector:@selector(ddd)
                                            userInfo:nil
                                             repeats:YES];
    
    
    time = 4 ;
    d =0;
    count = 0 ;
    countLabel =[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50,button.center.y+100 , 100, 50)];
    countLabel.text = [NSString stringWithFormat:@"%d",count];
    countLabel.textAlignment = NSTextAlignmentCenter;
    countLabel.font = [UIFont boldSystemFontOfSize:50];
    [self.view addSubview:countLabel];
    
    
}



-(void)up {
    [self.view addSubview:button];
    button.alpha = 0;
    countLabel.alpha = 0;
    if (time < 1) {
        button.alpha = 1;
        countLabel.alpha = 1;
        switch (num) {
            case 0:
                labelY=labelY+10;
                
                label.center = CGPointMake(labelX, labelY);
                if (label.center.y >= 700) {
                    [label removeFromSuperview];
                    [self addLabel];
                }
                
                break;
            case 1:
                labelY = labelY-10;
                label.center = CGPointMake(labelX, labelY);
                NSLog(@"%d",labelY);
                if (label.center.y <= 0) {
                    [label removeFromSuperview];
                    [self addLabel];
                }
                
                break;
            case 2:
                labelX = labelX+8;
                label.center = CGPointMake(labelX, labelY);
                if (label.center.x >= 360) {
                    [label removeFromSuperview];
                    [self addLabel];
                }
                break;
            case 3:
                labelX = labelX-8;
                label.center = CGPointMake(labelX, labelY);
                if (label.center.x <= 0) {
                    [label removeFromSuperview];
                    
                    [self addLabel];
                }
                
                break;
                
        }
        
        
        
        
    }
    
    
}
-(void)addLabel{
    
    num = arc4random() %4;
    
    NSLog(@"%d",num);
    switch (num) {
        case 0:
            labelY = -50;
            labelX = (self.view.frame.size.width/2);
            break;
        case 1:
            labelY = 750;
            labelX = (self.view.frame.size.width/2);
            break;
            
        case 2:
            labelY = (self.view.frame.size.height/2);
            labelX = -50;
            break;
        case 3:
            labelY = (self.view.frame.size.height/2);
            labelX = 400;
            break;
    }
    
    //    labelY = -50;
    label= [[UILabel alloc]initWithFrame:CGRectMake(labelX ,labelY, 50,  50)];
    label.backgroundColor =[UIColor blackColor];
    label.center = CGPointMake(labelX, labelY);
    [self.view addSubview:label];
    
}

-(void)button {
    if (CGRectContainsPoint(button.frame, label.center)) {
        [label removeFromSuperview];
        count ++ ;
        countLabel.text =[NSString stringWithFormat:@"%d",count];
    }else {
        
    }
}



// 円を描画するメソッド
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

-(void)ddd {
    time -= 0.01;
    d = d + 1 ;
    [self drawPathGraph:d*3.6:360-d*3.6:[UIColor blackColor]:100:l];
    countDwonLabel.text = [NSString stringWithFormat:@"%d",(int)time];
    if (time <=1) {
        [timera invalidate];
        [l removeFromSuperlayer];
        [countDwonLabel removeFromSuperview];
        [whiteLayer removeFromSuperlayer];
        
        
    }
    
    
}
-(void)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
