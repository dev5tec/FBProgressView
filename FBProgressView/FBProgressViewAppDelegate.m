//
//  FBProgressViewAppDelegate.m
//  FBProgressView
//
//  Created by Hiroshi Hashiguchi on 11/03/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FBProgressViewAppDelegate.h"
#import "FBProgressView.h"

@implementation FBProgressViewAppDelegate


@synthesize window=_window;
@synthesize view1, view2;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    
    
    self.view1.progress = 0;
    self.view2.progress = 0;
    
    self.view2.progressViewStyle = FBProgressViewStyleWhite;
    
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(fire:)
                                   userInfo:nil
                                    repeats:YES];
    
    return YES;
}

- (void)fire:(NSTimer*)timer
{
    self.view1.progress = self.view1.progress + 0.01;
    self.view2.progress = self.view2.progress + 0.01;
    NSLog(@"fired: %f", self.view1.progress);
    
    if (self.view1.progress >= 1.0) {
        [timer invalidate];
        NSLog(@"timer stopped");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


@end
