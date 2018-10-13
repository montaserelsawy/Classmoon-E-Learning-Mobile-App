//
//  Home.h
//  NewClassMoon
//
//  Created by montaser alsawy on ١٩‏/١٠‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Home : UIViewController {
	NSString *Home;
	UINavigationController * navController;
}

@property (nonatomic ,retain) IBOutlet UINavigationController * navController;

-(IBAction) examsBtn :(id) sender;
-(IBAction) acadBtn :(id) sender;
-(IBAction) homeworkBtn :(id) sender;
-(IBAction) msgBtn :(id) sender;
-(IBAction) videoBtn :(id) sender;
-(IBAction) gradesBtn :(id) sender;

-(BOOL) connected;
-(BOOL) loggedIn;


@end

