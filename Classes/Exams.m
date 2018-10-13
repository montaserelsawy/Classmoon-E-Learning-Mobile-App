//
//  Exams.m
//  Login
//
//  Created by montaser alsawy on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Exams.h"
#import "ExamDetails.h"
#import "JSON.h"
#import "asyncimageview.h"
#import "Globals.h"

#define USE_CUSTOM_DRAWING 1
#define IMAGE_WIDTH 48
#define IMAGE_HIEGHT 65

@implementation Exams

@synthesize tblView , imageView;


- (NSMutableArray*)JSONArray:(NSArray *)Jarray JSONField:(NSString *)field{
	
	NSMutableArray * tempMutArray = [[[NSMutableArray alloc] init] autorelease];
	int i;
	for (i=0; i<[Jarray count]; i++) {
		[tempMutArray addObject:[[Jarray objectAtIndex:i] objectForKey:field]];
	}
	
	return [tempMutArray copy];
}

- (NSArray*) JSONConnect:(NSString *)path{
	
	SBJSON *parser = [[[SBJSON alloc] init] autorelease];
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
	
	// Perform request and get JSON back as a NSData object
	NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	
	// Get JSON as a NSString from NSData response
	NSString *json_string = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
	
	NSArray *statuses = [parser objectWithString:json_string error:nil];
	
	return statuses;
}

- (NSString*) getUserId {
	NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
	NSString *userid = [defaults objectForKey:@"UserId"];
	return userid;
}

- (NSString*) getAPIValue {
	NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
	NSString *APIValue = [defaults objectForKey:@"APIValue"];
	return APIValue;
}

-(void) getDataJSON {
	
	NSString * JSONurl =[NSString stringWithFormat:@"%@?user_id=%@&module=exam&limit=%@",API_URL_LINK,[self getUserId],[self getAPIValue]];
	//connect to JSON
	NSArray *JSONArray = [self JSONConnect:JSONurl];
	//GET fields		
	exams= [self JSONArray:JSONArray JSONField:@"assignment_title"];
	publishDate= [self JSONArray:JSONArray JSONField:@"assignment_publishing_datetime"];
	endDate= [self JSONArray:JSONArray JSONField:@"assignment_due_datetime"];
	CourseIcon= [self JSONArray:JSONArray JSONField:@"course_icon"];
	Submited= [self JSONArray:JSONArray JSONField:@"submission_id"];
	CourseTitle= [self JSONArray:JSONArray JSONField:@"course_title"];
	Comments= [self JSONArray:JSONArray JSONField:@"assignment_comments"];
	examPeriod= [self JSONArray:JSONArray JSONField:@"exam_time_limit"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [exams count];
}

+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
#if USE_CUSTOM_DRAWING
	const NSInteger TOP_LABEL_TAG = 1001;
	const NSInteger BOTTOM_LABEL_TAG = 1002;
	const NSInteger RIGHT_LABEL_TAG = 1003;
	const NSInteger BULLET_LABEL_TAG = 1004;
	const NSInteger COURSETITLE_LABEL_TAG = 1005;
	UILabel *topLabel;
	UILabel *bottomLabel;
	UILabel *rightLabel;
	UILabel *bulletLabel;
	UILabel *courTitle;
#endif
	
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		//
		// Create the cell.
		//
		cell =
		[[[UITableViewCell alloc]
		  initWithFrame:CGRectZero
		  reuseIdentifier:CellIdentifier]
		 autorelease];
		
#if USE_CUSTOM_DRAWING
		UIImage *indicatorImage = [UIImage imageNamed:@"indicator.png"];
		cell.accessoryView =
		[[[UIImageView alloc]
		  initWithImage:indicatorImage]
		 autorelease];
		
		
		const CGFloat LABEL_HEIGHT = 20;
		const CGFloat LABEL_WIDTH = 150;
		UIImage *image = [UIImage imageNamed:@"imageA.png"];
		
		//
		// Create the label for the top row of text
		//
		topLabel =
		[[[UILabel alloc]
		  initWithFrame:
		  CGRectMake(
					 image.size.width + 2.0 * cell.indentationWidth,
					 0.5 * (tableView.rowHeight - 2 * LABEL_HEIGHT),
					 LABEL_WIDTH,
					 LABEL_HEIGHT)]
		 autorelease];
		[cell.contentView addSubview:topLabel];
		
		//
		// Configure the properties for the text that are the same on every row
		//
		topLabel.tag = TOP_LABEL_TAG;
		topLabel.backgroundColor = [UIColor clearColor];
		topLabel.textColor = [UIColor whiteColor];
		topLabel.highlightedTextColor = [UIColor blackColor];
		topLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
		
		//--------------------------------------------------------------------
		
		//
		// Create the label for the right row of text
		//
		rightLabel =
		[[[UILabel alloc]
		  initWithFrame:
		  CGRectMake(
					 image.size.width + 16.0 * cell.indentationWidth,
					 0.5 * (tableView.rowHeight - 2 * LABEL_HEIGHT),
					 tableView.bounds.size.width -
					 image.size.width - 4.0 * cell.indentationWidth
					 - indicatorImage.size.width,
					 LABEL_HEIGHT)]
		 autorelease];
		[cell.contentView addSubview:rightLabel];
		
		//
		// Configure the properties for the text that are the same on every row
		//
		rightLabel.tag = RIGHT_LABEL_TAG;
		rightLabel.backgroundColor = [UIColor clearColor];
		rightLabel.textColor = [UIColor whiteColor];
		rightLabel.highlightedTextColor = [UIColor blackColor];
		rightLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize] -5];
		
		//--------------------------------------------------------------------
		
		//
		// Create the label for the bullet row of text
		//
		bulletLabel =
		[[[UILabel alloc]
		  initWithFrame:
		  CGRectMake(
					 image.size.width + 21.0 * cell.indentationWidth,
					 0.5 * (tableView.rowHeight - 2 * LABEL_HEIGHT) + LABEL_HEIGHT + 8,
					 tableView.bounds.size.width -
					 image.size.width - 4.0 * cell.indentationWidth
					 - indicatorImage.size.width,
					 LABEL_HEIGHT)]
		 autorelease];
		[cell.contentView addSubview:bulletLabel];
		
		//
		// Configure the properties for the text that are the same on every row
		//
		bulletLabel.tag = BULLET_LABEL_TAG;
		bulletLabel.backgroundColor = [UIColor clearColor];
		bulletLabel.textColor = [UIColor orangeColor];
		bulletLabel.highlightedTextColor = [UIColor orangeColor];
		bulletLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize] + 20];
		
		//--------------------------------------------------------------------
		
		
		//
		// Create the label for the buttom row of text
		//
		bottomLabel =
		[[[UILabel alloc]
		  initWithFrame:
		  CGRectMake(
					 image.size.width + 2.0 * cell.indentationWidth,
					 0.5 * (tableView.rowHeight - 2 * LABEL_HEIGHT) + LABEL_HEIGHT,
					 tableView.bounds.size.width -
					 image.size.width - 4.0 * cell.indentationWidth
					 - indicatorImage.size.width,
					 LABEL_HEIGHT)]
		 autorelease];
		[cell.contentView addSubview:bottomLabel];
		
		//
		// Configure the properties for the text that are the same on every row
		//
		bottomLabel.tag = BOTTOM_LABEL_TAG;
		bottomLabel.backgroundColor = [UIColor clearColor];
		bottomLabel.textColor = [UIColor yellowColor];
		bottomLabel.highlightedTextColor = [UIColor blackColor];
		bottomLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize] - 5];
		
		//
		// Create the label for the course title
		//
		courTitle =
		[[[UILabel alloc]
		  initWithFrame:
		  CGRectMake(
					 image.size.width - 4 * cell.indentationWidth,
					 0.5 * (tableView.rowHeight - 1.5 * LABEL_HEIGHT) + LABEL_HEIGHT + 20,
					 tableView.bounds.size.width -
					 image.size.width - 4.0 * cell.indentationWidth
					 - indicatorImage.size.width,
					 LABEL_HEIGHT)]
		 autorelease];
		[cell.contentView addSubview:courTitle];
		
		//
		// Configure the properties for the text that are the same on every row
		//
		courTitle.tag = COURSETITLE_LABEL_TAG;
		courTitle.backgroundColor = [UIColor clearColor];
		courTitle.textColor = [UIColor yellowColor];
		courTitle.highlightedTextColor = [UIColor blackColor];
		courTitle.font = [UIFont systemFontOfSize:[UIFont labelFontSize] - 5];
		
		
		//
		// Create a background image view.
		//
		cell.backgroundView =
		[[[UIImageView alloc] init] autorelease];
		cell.selectedBackgroundView =
		[[[UIImageView alloc] init] autorelease];
#endif
	}
	
#if USE_CUSTOM_DRAWING
	else
	{
		//start cashing images
		AsyncImageView* oldImage = (AsyncImageView*)
		[cell.contentView viewWithTag:999];
		[oldImage removeFromSuperview];
		
		topLabel = (UILabel *)[cell viewWithTag:TOP_LABEL_TAG];
		bottomLabel = (UILabel *)[cell viewWithTag:BOTTOM_LABEL_TAG];
		rightLabel = (UILabel *)[cell viewWithTag:RIGHT_LABEL_TAG];
		bulletLabel = (UILabel *)[cell viewWithTag:BULLET_LABEL_TAG];
		courTitle = (UILabel *)[cell viewWithTag:COURSETITLE_LABEL_TAG];
	}
	
	//continue cashing images
	CGRect frame;
	frame.size.width=IMAGE_WIDTH; frame.size.height=IMAGE_HIEGHT;
	frame.origin.x=15; frame.origin.y=20;
	AsyncImageView* asyncImage = [[[AsyncImageView alloc]
								   initWithFrame:frame] autorelease];
	asyncImage.tag = 999;
	
	
	// Showing Course icon on each cell
	if ([[CourseIcon objectAtIndex:indexPath.row]  isEqualToString: @"default"] ) {
		imagePath = [NSString stringWithFormat:@"%@course_default.png",IMAGE_URL_48];
	} else {
		imagePath = [NSString stringWithFormat:@"%@%@",IMAGE_URL_48,[CourseIcon objectAtIndex:indexPath.row]];
		NSLog(@"%@",imagePath);
	}
	NSString * imageURL = imagePath; 
	NSURL* url = [[NSURL alloc] initWithString:imageURL];
	
	[asyncImage loadImageFromURL:url];
	
	[cell.contentView addSubview:asyncImage];
	[url release];
	//END cashing images
	
	topLabel.text = [exams objectAtIndex:indexPath.row];
	
	NSString * endDateString = [NSString stringWithFormat:@"Due: %@",[endDate objectAtIndex:indexPath.row]];
	endDateString = [endDateString substringToIndex:15];
	bottomLabel.text = endDateString;
	
	NSString *publishDateString = [NSString stringWithFormat:@"%@",[publishDate objectAtIndex:indexPath.row]];
	publishDateString = [publishDateString substringToIndex:10];
	rightLabel.text = publishDateString;
	
	if ([Submited objectAtIndex:indexPath.row]==[NSNull null]) {
		bulletLabel.text = @"\u2022";
	} else {
		bulletLabel.text = @"";
	}
	courTitle.text = [CourseTitle objectAtIndex:indexPath.row];
	//cell.textLabel.text = [exams	objectAtIndex:indexPath.row];
	//
	// Set the background and selected background images for the text.
	// Since we will round the corners at the top and bottom of sections, we
	// need to conditionally choose the images based on the row index and the
	// number of rows in the section.
	//
	UIImage *rowBackground;
	UIImage *selectionBackground;
	NSInteger sectionRows = [tableView numberOfRowsInSection:[indexPath section]];
	NSInteger row = [indexPath row];
	if (row == 0 && row == sectionRows - 1)
	{
		rowBackground = [UIImage imageNamed:@"topAndBottomRow.png"];
		selectionBackground = [UIImage imageNamed:@"topAndBottomRowSelected.png"];
	}
	else if (row == 0)
	{
		rowBackground = [UIImage imageNamed:@"topRow.png"];
		selectionBackground = [UIImage imageNamed:@"topRowSelected.png"];
	}
	else if (row == sectionRows - 1)
	{
		rowBackground = [UIImage imageNamed:@"bottomRow.png"];
		selectionBackground = [UIImage imageNamed:@"bottomRowSelected.png"];
	}
	else
	{
		rowBackground = [UIImage imageNamed:@"middleRow.png"];
		selectionBackground = [UIImage imageNamed:@"middleRowSelected.png"];
	}
	((UIImageView *)cell.backgroundView).image = rowBackground;
	((UIImageView *)cell.selectedBackgroundView).image = selectionBackground;
	
#else
	cell.textLabel.text = [exams objectAtIndex:indexPath.row];
#endif
	
	
	
	return cell;
	
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	ExamDetails * details = [[ExamDetails alloc] init];
	details.title = [exams objectAtIndex:indexPath.row];
	details.publishDate= [publishDate objectAtIndex:indexPath.row];
	details.endDate= [endDate objectAtIndex:indexPath.row];
	details.CourseIcon= [CourseIcon objectAtIndex:indexPath.row];
	details.CourseTitle= [CourseTitle objectAtIndex:indexPath.row];
	details.Comments= [Comments objectAtIndex:indexPath.row];
	details.examPeriod = [examPeriod objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:details animated:YES];
	
	[details release];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
		
	[self getDataJSON];
	
	self.title = @"Exam";
		
	tblView.separatorStyle = UITableViewCellSeparatorStyleNone;
	tblView.rowHeight = 100;
	tblView.backgroundColor = [UIColor clearColor];
	imageView.image = [UIImage imageNamed:@"gradientBackground.png"];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
