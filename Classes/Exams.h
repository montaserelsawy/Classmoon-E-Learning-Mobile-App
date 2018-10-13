//
//  Exams.h
//  Login
//
//  Created by montaser alsawy on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Exams : UIViewController 
<UITableViewDelegate ,UITableViewDataSource>
{
	IBOutlet UITableView *tblView;
	UIImageView *imageView;
	NSArray *exams;
	NSArray *publishDate;
	NSArray *endDate;
	NSArray *CourseIcon;
	NSArray *Submited;
	NSString *imagePath;
	NSArray *assignID;
	NSArray *CourseTitle;
	NSArray *Comments;
	NSArray *examPeriod;
}

@property (nonatomic, retain) IBOutlet UITableView *tblView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

-(NSString*) getUserId;

@end
