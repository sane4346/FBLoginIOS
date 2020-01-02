//
//  ViewController.m
//  FBLoginExample
//
//  Created by Santosh Chaurasia on 1/2/20.
//  Copyright © 2020 Santosh Chaurasia. All rights reserved.
//

#import "LoginViewController.h"
#import "NextViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.delegate = self;
    loginButton.center = self.view.center;
    loginButton.permissions = @[@"public_profile", @"email"];
    [self.view addSubview:loginButton];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -  FB Login Button Delegate Methods
- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(nullable FBSDKLoginManagerLoginResult *)result error:(nullable NSError *)error {
    
    if (error) {
        NSLog(@"error occured");
    }
    
    if (result.isCancelled) {
        NSLog(@"User cancelled the login");
    } else if (result.declinedPermissions.count > 0 ) {
        NSLog(@"User declined the login process");
    } else {
        // Login Successfull
        // Move to next view controller
        NextViewController *nextViewController = [[NextViewController alloc] initWithNibName:@"NextViewController" bundle:nil];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:nextViewController];
        [self  presentViewController:navigationController animated:YES completion:nil];
    }
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    NSLog(@"User logged out..");
}


@end
