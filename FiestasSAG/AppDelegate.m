//
//  AppDelegate.m
//  FiestasSAG
//
//  Created by Dani Gonzalez castillo on 12/08/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize globalArray,globalArray1,globalArray2,globalArray3;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [Parse setApplicationId:@"EBNL9DANqUtKpvbVX91JPkJg44Zl0dABucripTwE"
               clientKey:@"9muzoGOa4mfPXKUYI2I9ztT9MJC56Bkg3xigYKKM"];
  
    
    
     self.globalArray = [NSMutableArray array];
     self.globalArray1 = [NSMutableArray array];
     self.globalArray2 = [NSMutableArray array];
     self.globalArray3 = [NSMutableArray array];
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    globalArray=[def objectForKey:@"globalArray"];
    
    NSUserDefaults *def1 = [NSUserDefaults standardUserDefaults];
    globalArray1=[def1 objectForKey:@"globalArray1"];
    
    NSUserDefaults *def2 = [NSUserDefaults standardUserDefaults];
    globalArray2=[def2 objectForKey:@"globalArray2"];
    
    globalArray3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"globalArray3"];
    
    
    
    if (globalArray.count == 0) {
        self.globalArray = [NSMutableArray array];
        
    }
    
    if (globalArray1.count == 0) {
        self.globalArray1 = [NSMutableArray array];
        
    }
    
    if (globalArray2.count == 0) {
        self.globalArray2 = [NSMutableArray array];
        
    }
    if (globalArray3.count == 0) {
        self.globalArray3 = [NSMutableArray array];
        
    }
    

          NSLog(@" active");
 
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:globalArray forKey:@"globalArray"];
    [def synchronize];

    NSUserDefaults *def1 = [NSUserDefaults standardUserDefaults];
    [def1 setObject:globalArray1 forKey:@"globalArray1"];
    [def1 synchronize];

    NSUserDefaults *def2 = [NSUserDefaults standardUserDefaults];
    [def2 setObject:globalArray2 forKey:@"globalArray2"];
    [def2 synchronize];
    
    NSUserDefaults *def3 = [NSUserDefaults standardUserDefaults];
    [def3 setObject:globalArray3 forKey:@"globalArray3"];
    [def3 synchronize];

    NSLog(@"%@",globalArray3);

    
    
        NSLog(@"background");
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    

    
    
        NSLog(@"become active");
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
    
        
 
    NSLog(@"save");
    
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
