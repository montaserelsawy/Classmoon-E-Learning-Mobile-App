//
//  Settings.h
//  NewClassMoon
//
//  Created by montaser alsawy on ٢٥‏/١٠‏/٢٠١١.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Settings : UIViewController 
<UIActionSheetDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
	UIPickerView *numOfRows;
	NSMutableArray *pickerArray;
	NSUserDefaults *selectedNumOfRows;
}

@property (nonatomic ,retain) IBOutlet UIPickerView *numOfRows;

-(IBAction)resetKeychain:(id)sender;

@end
