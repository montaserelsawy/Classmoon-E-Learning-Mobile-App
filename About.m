//
//  About.m
//  Login
//
//  Created by montaser alsawy on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "About.h"


@implementation About

@synthesize aboutView;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	NSString *serverOutput = [[NSString alloc] initWithString:@"In light of technical progress witnessed by the world, and the development of methods of education, diversity, and in an era of quantum leap accelerated in the field of electronic technology, we have developed a system Classera e-learning integrated and which constitutes a quantum unique in the methods of modern education, we contribute through the provision of service e-learning to cope with a high level of this age and are Pttorath aims to develop technological education to traditional education with the latest interactive electronic means and electronic methods of today. Our Vision: Provide interactive learning environment and advanced of our societies, and to harness all our technical and artistic capabilities, depending on our excellent engineers and experts and the best programmers, and all the expertise available locally and internationally in cooperation with our partners and listen to our customers for the betterment of the educational process and make it accessible and available to all segments of society, using technology solutions modern combines the quality of performance and ease of use and the best and latest technology today, until we reach a better educational outcomes and the highest scientific communication and knowledge and the highest degree of academic performance."];

	aboutView.text=serverOutput;
	[serverOutput release];
	[aboutView release];
	
	
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}


@end
