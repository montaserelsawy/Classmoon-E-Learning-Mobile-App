//
//  NewClassMoonAppDelegate.m
//  NewClassMoon
//
//  Created by montaser alsawy on ١٩‏/١٠‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NewClassMoonAppDelegate.h"

@implementation NewClassMoonAppDelegate

@synthesize window;
@synthesize login;
@synthesize rootTabBarController;

#pragma mark -
#pragma mark Application lifecycle



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

	NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
	//Get uer ID from user defaults
	NSString *userid = [defaults objectForKey:@"UserId"];
	
	if([userid isEqualToString:@""]){

		login = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
		[window addSubview:login.view];
		
		
	} else {
		
		[window addSubview:[rootTabBarController view]];

	}

	[self.window makeKeyAndVisible];
	return YES;
}


-(void) tabBaController:(UITabBarController *) tabBarController didSelectViewController:(UIViewController *)viewController
{
	if(tabBarController == [NSString stringWithFormat:@"Logout"]){
		UIAlertView * alertNoConnect = [[[UIAlertView alloc] 
										 initWithTitle:@"Internet Connection Is Required"
										 message:@"No Internet Connection" 
										 delegate:self 
										 cancelButtonTitle:@"OK" 
										 otherButtonTitles:nil] autorelease];
		[alertNoConnect show];
	}

}

- (void)dealloc {
    [window release];
	[login release];
	[rootTabBarController release];
    [super dealloc];
}


@end
