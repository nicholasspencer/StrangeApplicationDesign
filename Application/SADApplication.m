//
//  SADApplication.m
//  StrangeApplicationDesign
//
//  Created by Nicholas Spencer on 1/21/16.
//
//

#import "SADApplication.h"

@implementation SADApplication

@dynamic delegate;

+ (instancetype)sharedApplication {
    return (SADApplication *)[super sharedApplication];
}

- (void)logout {
    [self.delegate applicationDidLogout:self];
}

- (void)loginUser:(nonnull NSDictionary *)user {
    [self.delegate application:self didLoginUser:user];
}

- (void)registerUser:(nonnull NSDictionary *)user {
    [self.delegate application:self didRegisterUser:user];
}

@end
