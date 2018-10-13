//
//  Home.m
//  NewClassMoon
//
//  Created by montaser alsawy on ١٩‏/١٠‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Home.h"
#import "Exams.h"
#import "AcadContent.h"
#import "HomeWork.h"
#import "Messages.h"
#import "LoginViewController.h"
#import "Reachability.h"
#import "VideoLectures.h"
#import "GradesColntroller.h"

@implementation Home

@synthesize navController;

- (BOOL) connected{
	Reachability * reachability = [Reachability reachabilityForInternetConnection];
	NetworkStatus networkStatus = [reachability currentReachabilityStatus];
	return !(networkStatus == NotReachable);
}

-(UIAlertView*) NoConnection{
	UIAlertView * alertNoConnect = [[[UIAlertView alloc] 
									 initWithTitle:@"Internet Connection Is Required"
									 message:@"No Internet Connection" 
									 delegate:self 
									 cancelButtonTitle:@"OK" 
									 otherButtonTitles:nil] autorelease];
	[alertNoConnect show];
	return alertNoConnect;
}

-(IBAction) examsBtn :(id) sender {
	if (![self connected]) {
		[self NoConnection];
	} else {
		Exams *exams = [[Exams alloc] initWithNibName:@"Exams" bundle:nil];
		[self.navigationController pushViewController:exams animated:YES];
		[exams release];
	}
}

-(IBAction) homeworkBtn :(id) sender {
	if (![self connected]) {
		[self NoConnection];
	} else {
		HomeWork *homework = [[HomeWork alloc] initWithNibName:@"HomeWork" bundle:nil];
		[self.navigationController pushViewController:homework animated:YES];
		[homework release];
	}
}

-(IBAction) acadBtn :(id) sender {
	if (![self connected]) {
		[self NoConnection];
	} else {
		AcadContent *acad = [[AcadContent alloc] initWithNibName:@"AcadContent" bundle:nil];
		[self.navigationController pushViewController:acad animated:YES];
		[acad release];
	}
}

-(IBAction) videoBtn :(id) sender {
	if (![self connected]) {
		[self NoConnection];
	} else {
		VideoLectures *video = [[VideoLectures alloc] initWithNibName:@"VideoLectures" bundle:nil];
		[self.navigationController pushViewController:video animated:YES];
		[video release];
	}
}

-(IBAction) msgBtn :(id) sender {
	if (![self connected]) {
		[self NoConnection];
	} else {
		Messages *msg = [[Messages alloc] initWithNibName:@"Messages" bundle:nil];
		[self.navigationController pushViewController:msg animated:YES];
		[msg release];
	}
}

-(IBAction) gradesBtn :(id) sender{
	if (![self connected]) {
		[self NoConnection];
	} else {
		GradesColntroller *grds = [[GradesColntroller alloc] initWithNibName:@"GradesColntroller" bundle:nil];
		[self.navigationController pushViewController:grds animated:YES];
		[grds release];
	}
	
}

- (BOOL) loggedIn {
	NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
	NSString *userid = [defaults objectForKey:@"UserId"];
	if(userid){
		return YES;
	} else { 
		return NO;
	}
}

- (void) viewDidLoad {
	self.title = @"Home";
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack; 
	//[self.view addSubview:[navController view]];
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}


@end
