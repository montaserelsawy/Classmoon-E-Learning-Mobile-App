//
//  ExamDetails.h
//  NewClassMoon
//
//  Created by montaser alsawy on ٢٠‏/١٠‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ExamDetails : UIViewController {
	IBOutlet UIImageView * GCourseIcon;
	IBOutlet UILabel * GPublishDate;
	IBOutlet UILabel * GEndDate;
	IBOutlet UILabel * GCourseTitle;
	IBOutlet UITextView * GComments;
	IBOutlet UILabel * GExamPeriod;
	
	NSString *publishDate;
	NSString *endDate;
	NSString *CourseIcon;
	NSString *CourseTitle;
	NSString *imagePath;
	NSString *Comments;
	NSString *examPeriod;
}


@property (nonatomic ,retain ) IBOutlet UIImageView * GCourseIcon;
@property (nonatomic ,retain ) IBOutlet UILabel * GPublishDate;
@property (nonatomic ,retain ) IBOutlet UILabel * GEndDate;
@property (nonatomic ,retain ) IBOutlet UILabel * GCourseTitle;
@property (nonatomic ,retain ) IBOutlet UITextView * GComments;
@property (nonatomic ,retain ) IBOutlet UILabel * GExamPeriod;

@property (nonatomic ,retain ) NSString *publishDate;
@property (nonatomic ,retain ) NSString *endDate;
@property (nonatomic ,retain ) NSString *CourseIcon;
@property (nonatomic ,retain ) NSString *CourseTitle;
@property (nonatomic ,retain ) NSString *imagePath;
@property (nonatomic ,retain ) NSString *Comments;
@property (nonatomic ,retain ) NSString *examPeriod;


@end