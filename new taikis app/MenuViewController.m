//
//  MenuViewController.m
//  new taikis app
//
//  Created by 大氣 on 2015/03/29.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController (){
    UIButton *lebelButton[3];
    
}

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect btnRect = CGRectMake(self.view.bounds.size.width/2-50,self.view.bounds.size.height/2-150,100,50);
    BButtonType btnType = BButtonTypeDanger;
    lebelButton[0]=[[BButton alloc]initWithFrame:btnRect type:btnType];
    
    [self.view addSubview:lebelButton[0]];
    
    CGRect btnRect2 = CGRectMake(self.view.bounds.size.width/2-50,self.view.bounds.size.height/2-25,100,50);
    BButtonType btnType2 = BButtonTypeDanger;
    lebelButton[1]=[[BButton alloc]initWithFrame:btnRect2 type:btnType2];
    
    [self.view addSubview:lebelButton[1]];
    
    CGRect btnRect3 = CGRectMake(self.view.bounds.size.width/2-50,self.view.bounds.size.height/2+100,100,50);
    BButtonType btnType3 = BButtonTypeDanger;
    lebelButton[2]=[[BButton alloc]initWithFrame:btnRect3 type:btnType3];
    
    [self.view addSubview:lebelButton[2]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
