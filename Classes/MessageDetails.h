//
//  MessageDetails.h
//  NewClassMoon
//
//  Created by montaser alsawy on ٢٠‏/١٠‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MessageDetails : UIViewController {
	
	IBOutlet UIImageView * GCourseIcon;
	IBOutlet UILabel * GPublishDate;
	IBOutlet UILabel * GFullName;
	IBOutlet UITextView * GComments;
	
	NSString *publishDate;
	NSString *CourseIcon;
	NSString *Comments;
	NSString *Reads;
	NSString *FullName;
	NSString *imagePath;
	NSString *NotifId;

	
}

@property (nonatomic ,retain ) IBOutlet UIImageView * GCourseIcon;
@property (nonatomic ,retain ) IBOutlet UILabel * GPublishDate;
@property (nonatomic ,retain ) IBOutlet UILabel * GFullName;
@property (nonatomic ,retain ) IBOutlet UITextView * GComments;

@property (nonatomic ,retain ) NSString *publishDate;
@property (nonatomic ,retain ) NSString *CourseIcon;
@property (nonatomic ,retain ) NSString *imagePath;
@property (nonatomic ,retain ) NSString *Comments;
@property (nonatomic ,retain ) NSString *Reads;
@property (nonatomic ,retain ) NSString *FullName;
@property (nonatomic ,retain ) NSString *NotifId;

@end