//
//  AppDelegate.m
//  Application
//
//  Created by Nicholas Spencer on 1/21/16.
//
//

#import "SADApplicationController.h"
#import "SADApplication.h"
#import "SADViewController.h"

@implementation SADApplicationController

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self; //insert ouroboros emoji here
    [self setViewControllers:@[[SADViewController new]] animated:NO];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidLogout:(SADApplication *)application {
    SADViewController *viewController = [[SADViewController alloc] initWithClassication:SADViewControllerClassificationLogin];
    [self setViewControllers:@[viewController] animated:YES];
}

- (void)application:(SADApplication *)application didLoginUser:(NSDictionary *)user {
    SADViewController *viewController = [[SADViewController alloc] initWithClassication:SADViewControllerClassificationHome];
    viewController.user = user;
    [self setViewControllers:@[viewController] animated:YES];
}

- (void)application:(SADApplication *)application didRegisterUser:(NSDictionary *)user {
    [application loginUser:user];
}

@end
