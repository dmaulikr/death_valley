//
//  MapView.h
//  DeathValley
//
//  Created by Matthew Ruggio on 5/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapView : UIView
{
    int paths[8];
}

- (id)sharedInit;
-(int)currentPath;
-(void)generatePath;

@end
