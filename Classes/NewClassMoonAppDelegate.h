//
//  NewClassMoonAppDelegate.h
//  NewClassMoon
//
//  Created by montaser alsawy on ١٩‏/١٠‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface NewClassMoonAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	LoginViewController * login;
	UITabBarController *rootTabBarController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic , retain) LoginViewController *login;
@property (nonatomic , retain) IBOutlet UITabBarController *rootTabBarController;


@end

