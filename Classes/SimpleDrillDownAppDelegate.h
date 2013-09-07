/*

File: SimpleDrillDownAppDelegate.h
Abstract: Application delegate that sets up the navigation controller and the
root view controller.

Version: 2.6

*/

#import <UIKit/UIKit.h>

@class DataController;
@class RootViewController;

@interface SimpleDrillDownAppDelegate : NSObject <UIApplicationDelegate> {
	
	IBOutlet UIWindow *window;
	
	IBOutlet UINavigationController *navigationController;
	IBOutlet RootViewController *rootViewController;
	
    DataController *dataController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) RootViewController *rootViewController;

@property (nonatomic, retain) DataController *dataController;

@end
