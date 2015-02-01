//
//  Collection.h
//  new taikis app
//
//  Created by 大氣 on 2015/02/01.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface Collection : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    int num ;
}
@property (weak, nonatomic) IBOutlet UICollectionView *viewCollection;


@end
