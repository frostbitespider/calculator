//
//  AppDelegate.m
//  VisualCal
//
//  Created by frostbitespider on 15/12/2.
//  Copyright (c) 2015年 frostbitespider. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    NSString* bundlePath=[[NSBundle mainBundle]bundlePath];
//    NSLog(@"bundlePath is %@",bundlePath);
//    NSString* docuDir=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSLog(@"docuDir is %@",docuDir);
//    NSString* libDir=[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)lastObject];
//    NSLog(@"libDir is %@",libDir);
//    NSString* bundleResPath=[[NSBundle mainBundle]resourcePath];
//    NSLog(@"bundleResPath is %@",bundleResPath);
//    NSString* file=[NSString stringWithFormat:@"%@/fuck",bundleResPath];
//    NSError* fileError;
//    NSString* line1=[NSString stringWithContentsOfFile:file encoding:NSASCIIStringEncoding error:&fileError];
//    if(fileError.code==0)
//        NSLog(@"%@",line1);
//    else
//        NSLog(@"error(%ld): %@",fileError.code,fileError.description);
//    NSString* content=@"Love is hurt";
//    [content writeToFile:file atomically:YES encoding:NSStringEncodingConversionAllowLossy error:&fileError];
//    NSString* line2=[NSString stringWithContentsOfFile:file encoding:NSASCIIStringEncoding error:&fileError];
//    if(fileError.code==0)
//        NSLog(@"%@",line2);
//    else
//        NSLog(@"error(%ld): %@",fileError.code,fileError.description);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
