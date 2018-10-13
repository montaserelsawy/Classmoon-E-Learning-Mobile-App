//
//  LoginViewController.m
//  Login
//
//  Created by montaser alsawy on 7/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "NewClassMoonAppDelegate.h"
#import "Reachability.h"
#import "Globals.h"


@implementation LoginViewController

@synthesize username,password,loginButton ,window ,serverOutputLabel;

- (BOOL) connected{
	Reachability * reachability = [Reachability reachabilityForInternetConnection];
	NetworkStatus networkStatus = [reachability currentReachabilityStatus];
	return !(networkStatus == NotReachable);
}

- (UIAlertView*) NoConnection{
	UIAlertView * alertNoConnect = [[[UIAlertView alloc] 
									 initWithTitle:@"Internet Connection Is Required"
									 message:@"No Internet Connection" 
									 delegate:self 
									 cancelButtonTitle:@"OK" 
									 otherButtonTitles:nil] autorelease];
	[alertNoConnect show];
	return alertNoConnect;
}

- (IBAction) makeKeyboardGoaway{
		[username resignFirstResponder];
		[password resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	if (textField == username) {
		[password becomeFirstResponder];
	} else {
		[textField resignFirstResponder];
	}
	return YES;
}

- (IBAction) login:(id) sender{
	if (![self connected]) {
		[self NoConnection];
	} else {
		
		[username resignFirstResponder];
		[password resignFirstResponder];
		NSString *post =[NSString stringWithFormat:@"username=%@&password=%@",username.text, password.text];
		NSString *hostStr = [NSString stringWithFormat:@"%@?module=login&",API_URL_LINK];
		hostStr = [hostStr stringByAppendingString:post];
	
		NSMutableURLRequest  *request = [[NSMutableURLRequest alloc] 
									 initWithURL:[NSURL URLWithString:hostStr]];
		[request setHTTPMethod:@"POST"];
		[request setHTTPBody:[hostStr dataUsingEncoding:NSISOLatin1StringEncoding]];
				
		NSData *dataURL = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
		NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding:NSASCIIStringEncoding];
	
		if([serverOutput isEqualToString:@""] || 
		   [serverOutput isEqualToString:@"Invalid Username Or Password"] || 
		   [[serverOutput componentsSeparatedByCharactersInSet:
						  [NSCharacterSet newlineCharacterSet]] count] > 20){
		
			UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Invalid Login"
															   message:@"Username or Password Incorrect"
															  delegate:self 
													 cancelButtonTitle:@"OK" 
													 otherButtonTitles:nil, nil];
			serverOutputLabel.text=@"Can't Login ... Try Again Later!";
			[alertsuccess show];
			[alertsuccess release];

		} else {
			//create user defaults to store user ID
			NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
			[defaults setObject:serverOutput forKey:@"UserId"];

			//show tabbar app
			NewClassMoonAppDelegate * appsDelegate =[[UIApplication sharedApplication] delegate];
			[appsDelegate.window addSubview:[appsDelegate.rootTabBarController view]];
		}
	}
}

- (void)viewDidLoad {
	NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
	//Get uer ID from user defaults
	NSString *userid = [defaults objectForKey:@"UserId"];
	////print user ID in label 
	serverOutputLabel.text = userid;	
	
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[serverOutputLabel release]; 
    [super dealloc];
}

@end
