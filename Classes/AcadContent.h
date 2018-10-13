//
//  AcadContent.h
//  Login
//
//  Created by montaser alsawy on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AcadContent : UIViewController 
<UITableViewDelegate ,UITableViewDataSource>
{
	IBOutlet UITableView *tblView;
	UIImageView *imageView;
	NSArray *acad;
	NSArray *publishDate;
	NSArray *CourseIcon;
	NSArray *CourseTitle;
	NSArray *Comments;
	NSArray *Reads;
	NSArray *NotifId;
	NSArray *FilePath;
	NSArray *AttachId;
	NSString *imagePath;
}

@property (nonatomic, retain) IBOutlet UITableView *tblView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

-(NSString*) getUserId;

@end
