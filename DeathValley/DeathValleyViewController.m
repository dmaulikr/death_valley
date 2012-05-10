//
//  DeathValleyViewController.m
//  DeathValley
//
//  Created by Matthew Ruggio on 5/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DeathValleyViewController.h"

@implementation DeathValleyViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc 
{
    [ship release]; ship = nil;
    [map release]; map = nil;
    
    if (mapTimer)
    {
        [mapTimer release]; mapTimer = nil;
    }
    
    [scoreLabel release]; scoreLabel = nil;
    [homeImageView release]; homeImageView = nil;
    [gameOverImageView release]; gameOverImageView = nil;
    [playButton release]; playButton = nil;
    [finalScoreLabel release]; finalScoreLabel = nil;
    
    [super dealloc];
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    paused = NO;
    
    [self.view bringSubviewToFront:ship];
    
    //Initialize Home Page Layout
    [self.view addSubview:homeImageView];
    CGRect frame = homeImageView.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.width = 480.0;
    frame.size.height = 320.0;
    homeImageView.frame = frame;
    
    //Initialize Game Over Page Layout
    [self.view addSubview:gameOverImageView];
    frame = gameOverImageView.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.width = 480.0;
    frame.size.height = 320.0;
    gameOverImageView.frame = frame;
    
    [self.view addSubview:playButton];
    frame = playButton.frame;
    frame.origin.x = 160.0;
    frame.origin.y = 170.0;
    playButton.frame = frame;
    
    [self.view addSubview:finalScoreLabel];
    frame = finalScoreLabel.frame;
    frame.origin.x = 0.0;
    frame.origin.y = 260.0;
    frame.size.width = 480.0;
    frame.size.height = 50.0;
    finalScoreLabel.frame = frame;
    
    [self home];
        
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

-(IBAction)leftClick:(id)sender
{
    [ship moveLeft];
    [map setNeedsDisplay];
}

-(IBAction)rightClick:(id)sender
{    
    [ship moveRight];
}

-(IBAction)playClick:(id)sender
{
    [self start];
}

-(IBAction)pauseClick:(id)sender
{
    [self pause];
}

-(void)drive
{
    if (ship.position != map.currentPath)
    {
        [self end];
    }
    
    [map generatePath];
    score++;
    [scoreLabel setText:[NSString stringWithFormat:@"Score: %i", score]];
}

-(void)start
{
    [homeImageView setHidden:YES];
    [playButton setHidden:YES];
    [gameOverImageView setHidden:YES];
    [finalScoreLabel setHidden:YES];
    
    score = 0;
    [scoreLabel setText:[NSString stringWithFormat:@"Score: %i", score]];
    
    [ship sharedInit];
    [map sharedInit];
    
    [ship setNeedsDisplay];
    [map setNeedsDisplay];
    
    [self startTimer];
}

-(void)end
{
    [finalScoreLabel setText:[NSString stringWithFormat:@"Final Score: %i", score]];
    [finalScoreLabel setHidden:NO];
    [gameOverImageView setHidden:NO];
    [playButton setHidden:NO];
    [self stopTimer];
}

-(void)home
{
    [homeImageView setHidden:NO];
    [playButton setHidden:NO];
}

-(void)pause
{
    if (!paused)
    {
        [self stopTimer];
        [leftButton setEnabled:NO];
        [rightButton setEnabled:NO];
        [pauseButton setTitle:@"play" forState:UIControlStateNormal];
        paused = YES;
    }
    else 
    {
        [self startTimer];
        [leftButton setEnabled:YES];
        [rightButton setEnabled:YES];
        [pauseButton setTitle:@"pause" forState:UIControlStateNormal];
        paused = NO;
    }
}

-(void)startTimer
{
    mapTimer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                target:self 
                                              selector:@selector(drive) 
                                              userInfo:nil 
                                               repeats:YES];
}

-(void)stopTimer
{
    [mapTimer invalidate];
    mapTimer = nil; 
}

@end
