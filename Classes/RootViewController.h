/*

File: RootViewController.h
Abstract: Creates a table view and serves as its delegate and data source.

Version: 2.6


*/

#import <UIKit/UIKit.h>

@class DataController;

@interface RootViewController : UITableViewController {
    DataController *dataController;
}


@property (nonatomic, retain) DataController *dataController;

@end
