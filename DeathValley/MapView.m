//
//  MapView.m
//  DeathValley
//
//  Created by Matthew Ruggio on 5/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MapView.h"

@implementation MapView

- (id)sharedInit {
    paths[0] = 4;
    paths[1] = 4;
    paths[2] = 4;
    paths[3] = 4;
    paths[4] = 4;
    paths[5] = 4;
    paths[6] = 4;
    paths[7] = 4;
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

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSLog(@"drawRect Map");
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIColor *color = [UIColor whiteColor];
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    
    for (int i = 0; i < 8; i++)
    {
        NSLog(@"%i, %i", paths[i], i);
        CGContextFillRect(ctx, CGRectMake(40.0 * paths[i], 40.0 * i, 40.0, 40.0));
    }
}

- (int)currentPath
{
    return paths[7];
}

-(float)randomIntBetween:(int)smallNumber andBigNumber:(int)bigNumber
{
    int diff = bigNumber - smallNumber + 1;
    return (((float) rand() / RAND_MAX) * diff) + smallNumber;
}

- (void)generatePath
{
    int floor = (paths[0] > 0) ? paths[0] - 1 : 0;
    int ceiling = (paths[0] < 8) ? paths[0] + 1 : 8;
    paths[7] = paths[6];
    paths[6] = paths[5];
    paths[5] = paths[4];
    paths[4] = paths[3];
    paths[3] = paths[2];
    paths[2] = paths[1];
    paths[1] = paths[0];
    paths[0] = [self randomIntBetween:floor andBigNumber:ceiling];
    [self setNeedsDisplay];
}

@end
