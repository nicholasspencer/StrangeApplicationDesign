//
//  SADApplicationDelegate.h
//  StrangeApplicationDesign
//
//  Created by Nicholas Spencer on 1/21/16.
//
//

#import <Foundation/Foundation.h>

@class SADApplication;

@protocol SADApplicationDelegate <UIApplicationDelegate>

- (void)applicationDidLogout:(SADApplication *)application;
- (void)application:(SADApplication *)application didLoginUser:(NSDictionary *)user;
- (void)application:(SADApplication *)application didRegisterUser:(NSDictionary *)user;

@end
