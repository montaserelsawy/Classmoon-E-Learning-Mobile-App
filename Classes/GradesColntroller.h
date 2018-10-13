//
//  GradesColntroller.h
//  NewClassMoon
//
//  Created by montaser alsawy on ٢٩‏/١١‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GradesColntroller : UIViewController 
<UITableViewDelegate ,UITableViewDataSource>
{
	IBOutlet UITableView *tblView;
	UIImageView *imageView;
	NSArray *titles;
	NSArray *publishDate;
	NSArray *CourseIcon;
	NSArray *CourseTitle;
	NSArray *AssignType;
	NSArray *MainMark;
	NSArray *SubMark;
	NSArray *SubRead;
	NSArray *StudentID;
	NSString *imagePath;
}
	
@property (nonatomic, retain) IBOutlet IBOutlet UITableView *tblView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
	
-(NSString*) getUserId;
	
@end
