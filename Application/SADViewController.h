//
//  ViewController.h
//  Application
//
//  Created by Nicholas Spencer on 1/21/16.
//
//

#import <UIKit/UIKit.h>

/*  
 This could easily be a couple of different
 view controllers but why?
 Enum Oriented Programming™  
 
 Also don't create UIView subclasses.
 This dude gives you all the hooks do that
 in here so don't bother.
 */
typedef enum : NSUInteger {
    SADViewControllerClassificationLogin,
    SADViewControllerClassificationRegister,
    SADViewControllerClassificationHome,
} SADViewControllerClassification;

@interface SADViewController : UIViewController

@property (nonatomic, readwrite) NSDictionary *user;

- (instancetype)initWithClassication:(SADViewControllerClassification)classification;

@end

