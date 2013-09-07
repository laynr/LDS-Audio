/*

File: RootViewController.m
Abstract: Creates a table view and serves as its delegate and data source.

Version: 2.6


*/

#import "RootViewController.h"
#import "DataController.h"
#import "DetailViewController.h"


@implementation RootViewController

@synthesize dataController;

- (void)awakeFromNib {
	self.title = NSLocalizedString(@"LDS Audio Aggregator", @"Master view navigation title");
	UIBarButtonItem *lButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:NULL];
	
	lButton.action = @selector(alertOKCancelAction);
	self.navigationItem.leftBarButtonItem = lButton;
	[lButton release];
}

// Standard table view data source and delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Only one section so return the number of items in the list
    return [dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
 /*   if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"MyIdentifier"] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.font = [UIFont systemFontOfSize:12];
		//cell.numberOfLines = <...an appriate number of lines...>
		//label.text = <...your text...>
		//[cell sizeToFit];
		//[cell addSubview:label];
		//[label release];
    }
    
    // Get the object to display and set the value in the cell
    NSDictionary *itemAtIndex = (NSDictionary *)[dataController objectInListAtIndex:indexPath.row];
    cell.text = [itemAtIndex objectForKey:@"title"];
	//cell.font = "10";
    return cell;
  }
  */
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"MyIdentifier"] autorelease];
		CGRect contentRect = CGRectMake(5.0f, 4.0f, 360.0f, 20.0f);
		UILabel *textView = [[UILabel alloc] initWithFrame:contentRect];
		
		textView.textColor = [UIColor blackColor];
		textView.font = [UIFont boldSystemFontOfSize:12];
		textView.tag = 1;
		[cell.contentView addSubview:textView];
		[textView release];
		
		CGRect contentRect2 = CGRectMake(10.0f, 24.0f, 360.0f, 18.0f);
		UILabel *textView2 = [[UILabel alloc] initWithFrame:contentRect2];
		
		textView2.textColor = [UIColor grayColor];
		textView2.font = [UIFont systemFontOfSize:9];
		textView2.tag = 2;
		[cell.contentView addSubview:textView2];
		[textView2 release];
	}
	NSDictionary *itemAtIndex = (NSDictionary *)[dataController objectInListAtIndex:indexPath.row];
	
	UILabel *txtView = (UILabel*)[cell viewWithTag:1];
	UILabel *txtView2 = (UILabel*)[cell viewWithTag:2];
	txtView.text =  [itemAtIndex objectForKey:@"title"];
	txtView2.text = [itemAtIndex objectForKey:@"feed"];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
     Create the detail view controller and set its inspected item to the currently-selected item
     */
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    detailViewController.detailItem = [dataController objectInListAtIndex:indexPath.row];
    
    // Push the detail view controller
    [[self navigationController] pushViewController:detailViewController animated:YES];
    [detailViewController release];
}

- (void)dealloc {
    
    [dataController release];
    [super dealloc];
}

- (void)jumpToEmail {
	//NSString * finalLink = @"http://www.cnn.com";
	// create the string that points to the correct Wikipedia page for the element name
	
	NSString *mystring = @"mailto:info@scoutic.com?subject=LDSAUDIO";
	
	if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:mystring]])
	{
		// there was an error trying to open the URL. for the moment we'll simply ignore it.
	}
}

- (void)alertOKCancelAction {
	// open a alert with an OK and cancel button
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please Rate App" message:@"If you like this app please take a moment to rate it. If you have questions or would like to report a broken link please email me.  Thank you."  delegate:self cancelButtonTitle:@"Rate app" otherButtonTitles:@"Email", nil];
	[alert show];
	[alert release];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	//NSString * finalLink = @"http://www.cnn.com";
	//NSString * finalLink = [[[UIApplication sharedApplication] delegate] tableView.title];
	NSString * finalLink = @"http://itunes.apple.com/us/app/lds-audio-aggregator/id298754316?mt=8";
	// the user clicked one of the OK/Cancel buttons
	if (buttonIndex == 0)
	{
		NSLog(finalLink);
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:finalLink]];
		NSLog(@"Safari");
		//return 0;
		
	}
	if (buttonIndex == 1)
	{
		NSLog(finalLink);
		[self jumpToEmail];
		NSLog(@"email");
		//return 1;
		
	}
	
}

@end
