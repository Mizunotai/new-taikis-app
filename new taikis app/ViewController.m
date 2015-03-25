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
    
    
    
    
    
    rundomViewInt = arc4random() % 2;//画像をランダムで表示させるためのもの

    NSLog(@"%d",rundomViewInt);
    
    
    imgName = [NSString stringWithFormat:@"pico%d.png",rundomViewInt];

    img = [UIImage imageNamed:imgName];
    mainview = [[UIImageView alloc] initWithImage:img];
    mainview.frame = CGRectMake(350,200, 200,  200);
    mainview.contentMode = UIViewContentModeScaleAspectFit;
    
    if (rundomViewInt == 0) {
       name = @"とり";
        nameString = [@[@"とり", @"ひこうき", @"くも",@"ぬっきー"] mutableCopy];
        
    }
    if (rundomViewInt == 1){
        name = @"ひこうき";
        nameString =[@[@"とり", @"ひこうき", @"くも",@"ぬっきー"] mutableCopy];
    }
    
    seikaiLabel = [[UILabel alloc]
                   initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100,self.view.frame.size.height-300,200  ,100 )];
    seikaiLabel.textColor = [UIColor whiteColor];
    
    seikaiLabel.font =[UIFont boldSystemFontOfSize:50];
    seikaiLabel.backgroundColor=[UIColor clearColor];
    seikaiLabel.text=[NSString stringWithFormat:@"%@",name];
    seikaiLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:seikaiLabel];
    seikaiLabel.alpha = 0 ;
    
    /*---------------------------　ボタン関係 ----------------------------------------------*/
    BButtonType type = BButtonTypeSuccess;
    CGRect frame = CGRectMake(150,500,100,60);
    home=[[BButton alloc]initWithFrame:frame type:type];
    [home setTitle:@"ホームへ" forState:UIControlStateNormal];
    [home addTarget:self
             action:@selector(hoge:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:home];
    home.alpha = 0;

    /*  nameStringの中身をランダムに変更 　*/
    for (int i = 0; i < [nameString count];i ++) {
        int j =arc4random() % 4;
        [nameString exchangeObjectAtIndex:i withObjectAtIndex:j];
        
    }

    /* 一つ目のボタン */
    CGRect btnRect =CGRectMake(80,self.view.frame.size.height/2+20, 215, 50);
    BButtonType btnType =BButtonTypeSuccess ;
    btn1 =[[BButton alloc]initWithFrame:btnRect type:btnType];
    [btn1 setTitle: [NSString stringWithFormat:@"%@",nameString[0]]  forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    
    /*　２つ目のボタン　*/
    CGRect btn2Rect =CGRectMake(80,self.view.frame.size.height/2+80 , 215, 50);
    BButtonType btn2Type =BButtonTypeSuccess ;
    btn2 =[[BButton alloc]initWithFrame:btn2Rect type:btn2Type];
    [btn2 setTitle: [NSString stringWithFormat:@"%@",nameString[1]]  forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2:) forControlEvents:UIControlEventTouchUpInside];
   
    /* 三つ目もボタン */
    CGRect btn3Rect =CGRectMake(80,self.view.frame.size.height/2+140 , 215, 50);
    BButtonType btn3Type =BButtonTypeSuccess ;
    btn3 =[[BButton alloc]initWithFrame:btn3Rect type:btn3Type];
    [btn3 setTitle: [NSString stringWithFormat:@"%@",nameString[2]]  forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3:) forControlEvents:UIControlEventTouchUpInside];
    
    /*　四つ目のボタン　*/
    CGRect btn4Rect =CGRectMake(80,self.view.frame.size.height/2+200 , 215, 50);
    BButtonType btn4Type =BButtonTypeSuccess ;
    btn4 =[[BButton alloc]initWithFrame:btn4Rect type:btn4Type];
    [btn4 setTitle: [NSString stringWithFormat:@"%@",nameString[3]]  forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btn4:) forControlEvents:UIControlEventTouchUpInside];
    
   /*------------------------------- カウントダウン関係 --------------------------------------*/
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
    
    // [self drawPathGraph:0:d:[UIColor whiteColor]:100];
    //    [self drawPathGraph:60:60:[UIColor yellowColor]:100];
    
    [self.view.layer addSublayer:l];
    [self.view.layer addSublayer:whiteLayer];
    [self.view bringSubviewToFront:countDwonLabel];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(up)
                                           userInfo:nil
                                            repeats:YES];
    time = 4 ;
    d =0;
}


- (void)up {
    time -= 0.01;
    NSLog(@"%f",time);
    d = d + 1 ;
    [self drawPathGraph:d*3.6:360-d*3.6:[UIColor blackColor]:100:l];
    countDwonLabel.text = [NSString stringWithFormat:@"%d",(int)time];
    
    if (time <1){
        [timer invalidate];
        [l removeFromSuperlayer];
        [countDwonLabel removeFromSuperview];
        [whiteLayer removeFromSuperlayer];
        
        
        
            [UIView animateWithDuration:0.8f
                             animations:^{
//                                 label.alpha = 0;
            } completion:^(BOOL finished){
                [self.view addSubview:mainview];
                
                
                [UIView animateWithDuration:0.3f // アニメーション速度2.5秒
                                      delay:0.0f // 1秒後にアニメーション
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^{
                                     CGAffineTransform translate = CGAffineTransformMakeTranslation(-545, 0);
                                     [mainview setTransform:translate];
                                     // アニメーションをする処理
                                 } completion:^(BOOL finished) {
                                     // アニメーションが終わった後実行する処理
                                     //もう一度のボタンを表示
                                     
                                     
                                     [self.view addSubview:btn1];
                                     [self.view addSubview:btn2];
                                     [self.view addSubview:btn3];
                                     [self.view addSubview:btn4];
                                     
                                   
                                 }];

            }];
        }
    
}

-(void)btn:(UIButton *)button{
    if (name == nameString[0]) {
        NSLog(@"正解");
        self.view.backgroundColor =[UIColor blackColor];
        mainview.frame = CGRectMake(self.view.frame.size.width/2 - 150,self.view.frame.size.height-600, 300,  300);
        mainview.contentMode = UIViewContentModeScaleAspectFit;
        mainview.alpha = 0;

        [UIView animateWithDuration:3
                         animations:^{
                             mainview.alpha = 1.0;
                             seikaiLabel.alpha = 1.0;
                             home.alpha = 1.0;
                             
                         }completion:^(BOOL finished){
                             
                         
                             
                         }];
        
        
        [btn1 removeFromSuperview];
        [btn2 removeFromSuperview];
        [btn3 removeFromSuperview];
        [btn4 removeFromSuperview];
        
        
    }else{
        NSLog(@"不正解");
    }
}
-(void)btn2:(UIButton *)button{
    if (name ==nameString[1]) {
        NSLog(@"正解");
        mainview.frame = CGRectMake(self.view.frame.size.width/2 - 150,self.view.frame.size.height-600, 300,  300);
        mainview.contentMode = UIViewContentModeScaleAspectFit;
        mainview.alpha = 0;

        
        [btn1 removeFromSuperview];
        [btn2 removeFromSuperview];
        [btn3 removeFromSuperview];
        [btn4 removeFromSuperview];
        self.view.backgroundColor =[UIColor blackColor];
        
        [UIView animateWithDuration:3
                         animations:^{
                             mainview.alpha = 1.0;
                             seikaiLabel.alpha = 1.0;
                             home.alpha = 1.0;
                             
                         }completion:^(BOOL finished){
                             
                             
                             
                         }];

        
    }else{
        NSLog(@"不正解");
    }
}
-(void)btn3:(UIButton *)button{
    if (name == nameString[2]) {
        NSLog(@"正解");
        mainview.frame = CGRectMake(self.view.frame.size.width/2 - 150,self.view.frame.size.height-600, 300,  300);
        mainview.contentMode = UIViewContentModeScaleAspectFit;
        mainview.alpha = 0;

        
        [btn1 removeFromSuperview];
        [btn2 removeFromSuperview];
        [btn3 removeFromSuperview];
        [btn4 removeFromSuperview];
        self.view.backgroundColor =[UIColor blackColor];
        
        [UIView animateWithDuration:3
                         animations:^{
                             mainview.alpha = 1.0;
                             seikaiLabel.alpha = 1.0;
                             home.alpha = 1.0;
                             
                         }completion:^(BOOL finished){
                             
                             
                             
                         }];

    }else {
        NSLog(@"不正解");
    }
}
-(void)btn4:(UIButton *)button{
    if (name == nameString[3]) {
        NSLog(@"正解");
        mainview.frame = CGRectMake(self.view.frame.size.width/2 - 150,self.view.frame.size.height-600, 300,  300);
        mainview.contentMode = UIViewContentModeScaleAspectFit;
        mainview.alpha = 0;
 
        [btn1 removeFromSuperview];
        [btn2 removeFromSuperview];
        [btn3 removeFromSuperview];
        [btn4 removeFromSuperview];
        self.view.backgroundColor =[UIColor blackColor];
        
        [UIView animateWithDuration:3
                         animations:^{
                             mainview.alpha = 1.0;
                             seikaiLabel.alpha = 1.0;
                             home.alpha = 1.0;
                             
                         }completion:^(BOOL finished){
                             
                             
                        
                         }];

    }else{
        NSLog(@"不正解");
    }
}

// 円を描画するメソッド
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
    
    //[self.view.layer addSublayer:l];
    
    
    //[self.view.layer insertSublayer:l atIndex:0];
    
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
-(void)hoge:(UIButton*)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
