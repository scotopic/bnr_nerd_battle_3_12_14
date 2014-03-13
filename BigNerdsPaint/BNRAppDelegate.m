//
//  BNRAppDelegate.m
//  BigNerdsPaint
//
//  Created by Hiedi Utley on 3/13/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRGalleryViewController.h"

@implementation BNRAppDelegate

- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UINavigationController*   navController = [[UINavigationController alloc] init];
    BNRGalleryViewController* galleryVC     = [[BNRGalleryViewController alloc] init];
    navController.viewControllers = @[galleryVC];
    _window.rootViewController    = navController;
    [_window makeKeyAndVisible];
    return YES;


    return YES;
}


@end
