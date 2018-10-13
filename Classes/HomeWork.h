//
//  HomeWork.h
//  Login
//
//  Created by montaser alsawy on 8/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HomeWork : UIViewController	 
<UITableViewDelegate ,UITableViewDataSource>
{
	IBOutlet UITableView *tblView;
	UIImageView *imageView;
	NSArray *homework;
	NSArray *publishDate;
	NSArray *endDate;
	NSArray *CourseIcon;
	NSArray *Submited;
	NSString *imagePath;
	NSArray *assignID;
	NSArray *CourseTitle;
	NSArray *Comments;

}
@property (nonatomic, retain) IBOutlet UITableView *tblView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

-(NSString*) getUserId;
@end
