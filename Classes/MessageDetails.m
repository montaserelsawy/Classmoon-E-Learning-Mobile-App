//
//  MessageDetails.m
//  NewClassMoon
//
//  Created by montaser alsawy on ٢٠‏/١٠‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MessageDetails.h"
#import "Reachability.h"
#import "Globals.h"

@implementation MessageDetails

@synthesize GCourseIcon ,GPublishDate ,GFullName ,GComments,publishDate,CourseIcon
			,imagePath,Comments,Reads,FullName,NotifId;


- (NSString*) getUserId {
	NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
	NSString *userid = [defaults objectForKey:@"UserId"];
	return userid;
}

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


- (void)viewDidLoad {
    [super viewDidLoad];
	
	if ([self CourseIcon]) {
		imagePath = [NSString stringWithFormat:@"%@%@",IMAGE_URL_USERPHOTO,[self CourseIcon]];
		
	} else {
		imagePath = [NSString stringWithFormat:@"%@course_default.png",IMAGE_URL_USERPHOTO];
	}
	
	NSURL* url = [[[NSURL alloc] initWithString:imagePath] autorelease];
	NSData *imagedata = [[[NSData alloc] initWithContentsOfURL:url] autorelease];
	
	GPublishDate.text = self.publishDate;
	GCourseIcon.image = [UIImage imageWithData:imagedata];
	GFullName.text = self.FullName;
	GComments.text = self.Comments;
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
