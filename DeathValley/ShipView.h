//
//  ShipView.h
//  DeathValley
//
//  Created by Matthew Ruggio on 5/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShipView : UIView
{
    UIImage *shipImage;
    int position;
}

- (id)sharedInit;
- (int)position;
- (void)moveLeft;
- (void)moveRight;

@end
