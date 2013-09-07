/*

File: DetailViewController.h
Abstract: Creates a grouped table view to act as an inspector.

Version: 2.6


*/

#import <UIKit/UIkit.h>
#import <Foundation/Foundation.h>


@interface DetailViewController : UITableViewController {
	NSDictionary *detailItem;
	
	CGSize cellSize;
	
	NSXMLParser * rssParser;
	
	NSMutableArray * stories;
	
	
	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
	
	// it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink, * currentAudio, * currentMedia, * currentEnclosure;

}


@property (nonatomic, retain) NSDictionary *detailItem;

@end
