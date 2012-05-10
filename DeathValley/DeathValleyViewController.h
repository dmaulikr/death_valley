//
//  DeathValleyViewController.h
//  DeathValley
//
//  Created by Matthew Ruggio on 5/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShipView.h"
#import "MapView.h"

@interface DeathValleyViewController : UIViewController
{
    IBOutlet ShipView *ship;
    IBOutlet MapView *map;
    NSTimer *mapTimer;
    int score;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UIImageView *homeImageView;
    IBOutlet UIImageView *gameOverImageView;
    IBOutlet UIButton *playButton;
    IBOutlet UILabel *finalScoreLabel;
    IBOutlet UIButton *pauseButton;
    IBOutlet UIButton *leftButton;
    IBOutlet UIButton *rightButton;
    BOOL paused;
}

-(IBAction)playClick:(id)sender;
-(IBAction)leftClick:(id)sender;
-(IBAction)rightClick:(id)sender;
-(IBAction)pauseClick:(id)sender;

-(void)pause;
-(void)drive;
-(void)start;
-(void)end;
-(void)home;
-(void)startTimer;
-(void)stopTimer;

@end
