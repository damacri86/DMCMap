//
//  DMCAppDelegate.m
//  DMCMap
//
//  Created by damacri86 on 08/12/2017.
//  Copyright (c) 2017 damacri86. All rights reserved.
//

#import "DMCAppDelegate.h"
#import "DMCViewController.h"

@implementation DMCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    DMCViewController *viewController = [[DMCViewController alloc] init];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
