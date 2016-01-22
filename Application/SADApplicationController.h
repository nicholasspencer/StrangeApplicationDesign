//
//  AppDelegate.h
//  Application
//
//  Created by Nicholas Spencer on 1/21/16.
//
//

#import <UIKit/UIKit.h>
#import "SADApplicationDelegate.h"

/*  
 Go ahead just call this a controller and stick a bunch of code in this.
 Hell... just make it a UIViewController. Are there any other types of controllers in Cocoa?
 Doesn't matter what it's controlling just put it here 'cause it's easier to find that way.
 */

@interface SADApplicationController : UINavigationController <SADApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

