//
//  AcadContentDetails.h
//  NewClassMoon
//
//  Created by montaser alsawy on ٢٣‏/١١‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AcadContentDetails : UIViewController {

	IBOutlet UIImageView * GCourseIcon;
	IBOutlet UILabel * GPublishDate;
	IBOutlet UILabel * GCourseTitle;
	IBOutlet UITextView * GComments;
	IBOutlet UIButton *showFile;
	
	NSString *publishDate;
	NSString *CourseIcon;
	NSString *CourseTitle;
	NSString *imagePath;
	NSString *Comments;
	NSString * NotifId;
	NSString *Reads;
	NSString *FileName;
	NSString *AttachId;

}


@property (nonatomic ,retain ) IBOutlet UIImageView * GCourseIcon;
@property (nonatomic ,retain ) IBOutlet UILabel * GPublishDate;
@property (nonatomic ,retain ) IBOutlet UILabel * GCourseTitle;
@property (nonatomic ,retain ) IBOutlet UITextView * GComments;
@property (nonatomic ,retain ) IBOutlet UIButton *showFile;

@property (nonatomic ,retain ) NSString *publishDate;
@property (nonatomic ,retain ) NSString *CourseIcon;
@property (nonatomic ,retain ) NSString *CourseTitle;
@property (nonatomic ,retain ) NSString *imagePath;
@property (nonatomic ,retain ) NSString *Comments;
@property (nonatomic ,retain ) NSString *NotifId;
@property (nonatomic ,retain ) NSString *Reads;
@property (nonatomic ,retain ) NSString *FileName;
@property (nonatomic ,retain ) NSString *AttachId;
-(IBAction) fileWebView;

@end