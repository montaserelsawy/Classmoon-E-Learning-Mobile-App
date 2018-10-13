//
//  About.h
//  Login
//
//  Created by montaser alsawy on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface About : UIViewController {
	NSString *About;
	IBOutlet UITextView *aboutView;
}

@property (nonatomic ,retain) UITextView *aboutView;


@end
