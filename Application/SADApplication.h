//
//  SADApplication.h
//  StrangeApplicationDesign
//
//  Created by Nicholas Spencer on 1/21/16.
//
//

#import <UIKit/UIKit.h>
#import "SADApplicationController.h"

/*  
 Move all those public methods and properties
 that you put in your application delegate
 here so you don't type the ".delegate" part in
 [UIApplication sharedApplication].delegate.<insert psuedo singleton> 
 */

@interface SADApplication : UIApplication

@property(nullable, nonatomic, weak) id <SADApplicationDelegate> delegate;

+ (nonnull SADApplication *)sharedApplication;

- (void)logout;
- (void)loginUser:(nonnull NSDictionary *)user;
- (void)registerUser:(nonnull NSDictionary *)user;

@end
