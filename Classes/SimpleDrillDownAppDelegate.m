/*

File: SimpleDrillDownAppDelegate.m
Abstract: Application delegate that sets up the navigation controller and the
root view controller.

Version: 2.6

*/

#import "SimpleDrillDownAppDelegate.h"
#import "RootViewController.h"
#import "DataController.h"


@implementation SimpleDrillDownAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize rootViewController;
@synthesize dataController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // Create the data controller
    DataController *controller = [[DataController alloc] init];
    self.dataController = controller;
    [controller release];
    
	rootViewController.dataController = dataController;
    
    // Configure the window with its navicationController and then show it
    [window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [navigationController release];
	[rootViewController release];
    [window release];
    [dataController release];
    [super dealloc];
}

@end
