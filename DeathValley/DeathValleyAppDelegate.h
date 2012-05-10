//
//  DeathValleyAppDelegate.h
//  DeathValley
//
//  Created by Matthew Ruggio on 5/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DeathValleyViewController;

@interface DeathValleyAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DeathValleyViewController *viewController;

@end
