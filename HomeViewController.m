//
//  HomeViewController.m
//  new taikis app
//
//  Created by 大氣 on 2015/01/29.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)idou:(id)sender{
    UIViewController *viewController = [[ViewController alloc] init];
    viewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:viewController animated:YES completion:nil];

}
-(IBAction)color:(id)sender{
    UIViewController *viewController = [[ColorViewController alloc]init];
    viewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:viewController animated:YES completion:nil];
}
-(IBAction)tach:(id)sender{
    UIViewController *viewController = [[TachViewController alloc]init];
    viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:viewController animated:YES completion:nil];
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
