//
//  FileWebView.m
//  NewClassMoon
//
//  Created by montaser alsawy on ٢٤‏/١١‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FileWebView.h"
#import "Globals.h"

@implementation FileWebView

@synthesize webView,fileName,NotifId,AttachId;


- (void)viewDidLoad {
	NSString *ext = [[fileName lastPathComponent] pathExtension];
	//NSLog(@"%@",ext);
	NSString *fileURL = [NSString stringWithFormat:@"%@%@.%@", FILE_URL_UPLOADS ,self.AttachId,ext];
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:fileURL]]];
	
	NSLog(@"%@",fileURL);
    
	[super viewDidLoad];
}


- (void)dealloc {			
    [super dealloc];
	[webView release];
}


@end
