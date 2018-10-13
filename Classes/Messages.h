//
//  Messages.h
//  Login
//
//  Created by montaser alsawy on 8/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Messages : UIViewController 
<UITableViewDelegate ,UITableViewDataSource>
{
	IBOutlet UITableView *tblView;
	UIImageView *imageView;
	NSArray *titles;
	NSArray *publishDate;
	NSArray *CourseIcon;
	NSArray *Comments;
	NSArray *Reads;
	NSArray *FullName;
	NSArray *NotifId;
	NSString *imagePath;
}

@property (nonatomic, retain) IBOutlet IBOutlet UITableView *tblView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

-(NSString*) getUserId;

@end
