//
//  LoginViewController.h
//  Login
//
//  Created by montaser alsawy on 7/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UIScrollViewDelegate , UITextFieldDelegate>{
	IBOutlet UITextField *username;
	IBOutlet UITextField *password;
	IBOutlet UIButton *loginButton;
	IBOutlet UIImageView *window;
	IBOutlet UILabel *serverOutputLabel;
}

@property (nonatomic ,retain) UITextField *username;
@property (nonatomic ,retain) UITextField *password;
@property (nonatomic ,retain) UIButton *loginButton;
@property (nonatomic ,retain) UIImageView *window;
@property (nonatomic ,retain) UILabel *serverOutputLabel;


-(IBAction) login: (id) sender;
-(IBAction) makeKeyboardGoaway;
-(BOOL) connected;

@end

