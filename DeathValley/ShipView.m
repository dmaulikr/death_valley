//
//  ShipView.m
//  DeathValley
//
//  Created by Matthew Ruggio on 5/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ShipView.h"

@implementation ShipView

- (id)sharedInit {
    position = 4;
    return self;
}

- (id)initWithFrame: (CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}

- (id)initWithCoder: (NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}

- (void) dealloc
{
    [shipImage release];
    [super dealloc];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //NSLog(@"drawRect position: %i", position);
    
    shipImage = [UIImage imageNamed:@"ship.png"];
    
    CGRect shipRect;
    shipRect.size = CGSizeMake(40,40);
    shipRect.origin.x = 40.0 * position;
    shipRect.origin.y = 0.0;
    
    //NSLog(@"re-drew ship at: %f, %f", shipRect.origin.x, shipRect.origin.y);
    
    [shipImage drawInRect:shipRect];
}

-(int)position
{
    return position;
}

-(void)moveLeft
{
    if (position > 0)
    {
        position--;
        [self setNeedsDisplay];
        //NSLog(@"Move left: %i", position);
    }
}

-(void)moveRight
{
    if (position < 8)
    {
        position++;
        [self setNeedsDisplay];
        //NSLog(@"Move right: %i", position);
    }
}

@end
