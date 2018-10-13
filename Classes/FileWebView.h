//
//  FileWebView.h
//  NewClassMoon
//
//  Created by montaser alsawy on ٢٤‏/١١‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FileWebView : UIViewController {
	IBOutlet UIWebView *webView;
	NSString *fileName;
	NSString *NotifId;
	NSString *AttachId;
}

@property (nonatomic,retain) IBOutlet UIWebView *webView;
@property (nonatomic,retain) NSString *fileName;
@property (nonatomic ,retain ) NSString *NotifId;
@property (nonatomic ,retain ) NSString *AttachId;

@end
