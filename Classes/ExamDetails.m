//
//  ExamDetails.m
//  NewClassMoon
//
//  Created by montaser alsawy on ٢٠‏/١٠‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExamDetails.h"
#import "Globals.h"

@implementation ExamDetails

@synthesize GCourseIcon ,GPublishDate ,GEndDate ,GCourseTitle ,GComments , GExamPeriod
,publishDate,endDate,CourseIcon,CourseTitle,imagePath,Comments,examPeriod;


- (void)viewDidLoad {
    [super viewDidLoad];
	
	if ([[self CourseIcon]  isEqualToString: @"default"] ) {
		imagePath = [NSString stringWithFormat:@"%@course_default.png",IMAGE_URL_110];
	} else {
		imagePath = [NSString stringWithFormat:@"%@%@",IMAGE_URL_110,[self CourseIcon]];
	}
	
	
	NSURL* url = [[[NSURL alloc] initWithString:imagePath] autorelease];
	NSData *imagedata = [[[NSData alloc] initWithContentsOfURL:url] autorelease];
	
	GPublishDate.text = self.publishDate;
	GEndDate.text = self.endDate;
	GCourseIcon.image = [UIImage imageWithData:imagedata];
	GCourseTitle.text = self.CourseTitle;
	GComments.text = self.Comments;
	GExamPeriod.text =[NSString stringWithFormat:@"%@ Minutes", self.examPeriod];
	
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
