//
//  AcadContentDetails.m
//  NewClassMoon
//
//  Created by montaser alsawy on ٢٣‏/١١‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AcadContentDetails.h"
#import "FileWebView.h"
#import "Reachability.h"
#import "Globals.h"



@implementation AcadContentDetails

@synthesize GCourseIcon ,GPublishDate ,GCourseTitle ,GComments ,showFile
,publishDate,CourseIcon,CourseTitle,imagePath,Comments,NotifId,Reads,FileName,AttachId;

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

-(IBAction) fileWebView{
	if (![self connected]) {
		[self NoConnection];
	} else {
		FileWebView *fileWeb = [[FileWebView alloc] initWithNibName:@"FileWebView" bundle:nil];
		fileWeb.fileName = self.FileName;
		fileWeb.AttachId = self.AttachId;
		[self.navigationController pushViewController:fileWeb animated:YES];
		[fileWeb release];
	}

}

- (void)viewDidLoad {
    [super viewDidLoad];

	
	//showFile.titleLabel.text = [NSString stringWithFormat:@"Show %@",FileName];
	
	if ([[self CourseIcon]  isEqualToString: @"default"] ) {
		imagePath = [NSString stringWithFormat:@"%@course_default.png",IMAGE_URL_110];
	} else {
		imagePath = [NSString stringWithFormat:@"%@%@",IMAGE_URL_110,[self CourseIcon]];
	}
	
	
	NSURL* url = [[[NSURL alloc] initWithString:imagePath] autorelease];
	NSData *imagedata = [[[NSData alloc] initWithContentsOfURL:url] autorelease];
	
	GPublishDate.text = self.publishDate;
	GCourseIcon.image = [UIImage imageWithData:imagedata];
	GCourseTitle.text = self.CourseTitle;
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
