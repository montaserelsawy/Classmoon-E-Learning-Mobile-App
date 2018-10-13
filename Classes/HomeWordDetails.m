//
//  HomeWordDetails.m
//  NewClassMoon
//
//  Created by montaser alsawy on ١٩‏/١٠‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeWordDetails.h"
#import "Globals.h"

@implementation HomeWordDetails

@synthesize GCourseIcon ,GPublishDate ,GEndDate ,GCourseTitle ,GComments
,publishDate,endDate,CourseIcon,CourseTitle,imagePath,Comments;


- (void)viewDidLoad {
    [super viewDidLoad];

	if ([[self CourseIcon]  isEqualToString: @"default"] ) {
		imagePath = [NSString stringWithFormat:@"%@course_default.png",IMAGE_URL_110];
	} else {
		imagePath = [NSString stringWithFormat:@"%@%@",IMAGE_URL_110,[self CourseIcon]];
	}
	
	
	NSURL* url = [[[NSURL alloc] initWithString:imagePath] autorelease];
	NSData *imagedata = [[[NSData alloc] initWithContentsOfURL:url] autorelease];
	
	GPublishDate.text = [NSString stringWithFormat:@"%@",self.publishDate];
	GEndDate.text = [NSString stringWithFormat:@"%@",self.endDate];
	GCourseIcon.image = [UIImage imageWithData:imagedata];
	GCourseTitle.text = [NSString stringWithFormat:@"%@",self.CourseTitle];
	GComments.text = self.Comments;
	
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
