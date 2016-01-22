//
//  ViewController.m
//  Application
//
//  Created by Nicholas Spencer on 1/21/16.
//
//

#import "SADViewController.h"
#import "SADApplication.h"

@interface SADViewController ()

@property (nonatomic, readwrite) SADViewControllerClassification classification;

@property (nonatomic, readwrite) UITextField *usernameTextField;
@property (nonatomic, readwrite) UITextField *passwordTextField;
@property (nonatomic, readwrite) UILabel *usernameLabel;

@end

@implementation SADViewController

- (instancetype)initWithClassication:(SADViewControllerClassification)classification {
    if(!(self = [super init])) { return nil; }
    self.classification = classification;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    switch (self.classification) {
        case SADViewControllerClassificationLogin:
            [self setupLoginView];
            break;
        case SADViewControllerClassificationRegister:
            [self setupRegistrationView];
            break;
        case SADViewControllerClassificationHome:
            [self setupHomeView];
            break;
            
        default:
            [self setupLoginView];
            break;
    }
}

- (void)setupLoginView {
    self.title = @"Login";
    self.usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 80, 320, 48)];
    self.usernameTextField.textAlignment = NSTextAlignmentCenter;
    self.usernameTextField.placeholder = @"username";
    [self.view addSubview:self.usernameTextField];
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 140, 320, 48)];
    self.passwordTextField.textAlignment = NSTextAlignmentCenter;
    self.passwordTextField.placeholder = @"password";
    self.passwordTextField.secureTextEntry = YES;
    [self.view addSubview:self.passwordTextField];
    
    UIBarButtonItem *registerButton = [[UIBarButtonItem alloc] initWithTitle:@"Register" style:UIBarButtonItemStylePlain target:self action:@selector(registrationViewController)];
    UIBarButtonItem *loginButton = [[UIBarButtonItem alloc] initWithTitle:@"Login" style:UIBarButtonItemStylePlain target:self action:@selector(loginUser)];
    
    self.navigationItem.rightBarButtonItems = @[loginButton, registerButton];
}

- (void)setupRegistrationView {
    self.title = @"Register";
    self.usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 80, 320, 48)];
    self.usernameTextField.textAlignment = NSTextAlignmentCenter;
    self.usernameTextField.placeholder = @"username";
    [self.view addSubview:self.usernameTextField];
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 140, 320, 48)];
    self.passwordTextField.textAlignment = NSTextAlignmentCenter;
    self.passwordTextField.placeholder = @"password";
    self.passwordTextField.secureTextEntry = YES;
    [self.view addSubview:self.passwordTextField];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Register" style:UIBarButtonItemStylePlain target:self action:@selector(registerUser)];
}

- (void)setupHomeView {
    self.title = @"Home";
    self.usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 320, 48)];
    self.usernameLabel.textAlignment = NSTextAlignmentCenter;
    self.usernameLabel.text = [NSString stringWithFormat:@"Hello, %@", self.user[@"username"]];
    [self.view addSubview:self.usernameLabel];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logoutUser)];
}

- (void)loginUser {
    NSString *username = self.usernameTextField.text ?: @"";
    NSString *password = self.passwordTextField.text ?: @"";
    [[SADApplication sharedApplication] loginUser:@{@"username":username,@"password":password}];
}

- (void)logoutUser {
    [[SADApplication sharedApplication] logout];
}

- (void)registerUser {
    NSString *username = self.usernameTextField.text ?: @"";
    NSString *password = self.passwordTextField.text ?: @"";
    [[SADApplication sharedApplication] registerUser:@{@"username":username,@"password":password}];
}

- (void)registrationViewController {
    SADViewController *viewController = [[SADViewController alloc] initWithClassication:SADViewControllerClassificationRegister];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
