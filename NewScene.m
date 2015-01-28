//
//  NewScene.m
//  new taikis app
//
//  Created by 大氣 on 2015/01/27.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import "NewScene.h"

@implementation NewScene{

}
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor blueColor];
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Arial Bold"];
        myLabel.text = @"A";
        myLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        myLabel.fontSize = 300;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        [self addChild:myLabel];
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SKScene *scene = [[SKScene alloc] initWithSize:self.size];

   // SKTransition *transition = [SKTransition crossFadeWithDuration:2];
    //SKTransition *transition = [SKTransition fadeWithDuration:2];
    SKTransition *transition = [SKTransition doorsOpenHorizontalWithDuration:2];
    //SKTransition *transition = [SKTransition doorsCloseHorizontalWithDuration:2];
    //SKTransition *transition = [SKTransition doorwayWithDuration:2];
    //SKTransition *transition = [SKTransition flipHorizontalWithDuration:2];
    //SKTransition *transition = [SKTransition moveInWithDirection:SKTransitionDirectionUp duration:2];
    //SKTransition *transition = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:2];
    //SKTransition *transition = [SKTransition pushWithDirection:SKTransitionDirectionLeft duration:2];
    
    [self.view presentScene:scene transition:transition];
}
//-(IBAction)start:(id)sender{
//    SKScene *scene1 = [NewScene sceneWithSize:self.size]; // シーンのオブジェクトを作成
//    SKTransition *transition1 = [SKTransition flipHorizontalWithDuration:0.5]; // トランジションを作成
//    [self.view presentScene:scene1 transition:transition1];
//}
@end
