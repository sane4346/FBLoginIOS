//
//  NextViewController.m
//  FBLoginExample
//
//  Created by Santosh Chaurasia on 1/2/20.
//  Copyright © 2020 Santosh Chaurasia. All rights reserved.
//

#import "NextViewController.h"
#import <FBSDKCoreKit/FBSDKProfile.h>


@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [FBSDKProfile loadCurrentProfileWithCompletion: ^(FBSDKProfile *profile, NSError *error){
            if (profile) {
                //user's name
                self.navigationItem.title = [NSString stringWithFormat:@"Hello %@, %@",profile.firstName,profile.lastName];
                
                //user's image
                NSURL *url = [profile imageURLForPictureMode:FBSDKProfilePictureModeSquare size:CGSizeMake(40, 40)];
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
                UIView *profileView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
                profileView.layer.cornerRadius = profileView.frame.size.width / 2;
                profileView.clipsToBounds = YES;
                
                UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
                [profileView addSubview:imageView];
                UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:profileView];
                self.navigationItem.rightBarButtonItem = item;
                
            }
        }];
    });
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
