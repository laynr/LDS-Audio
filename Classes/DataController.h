/*

File: DataController.h

Abstract:
A simple controller class responsible for managing the application's data.
Typically this object would be able to load and save a file containing the
appliction's data. This example illustrates just the basic minimum: it creates
an array containing information about some plays and provides simple accessor
methods for the array and its contents.

Version: 2.6

*/

#import <UIKit/UIKit.h>


@interface DataController : NSObject {
    NSMutableArray *list;
}

- (unsigned)countOfList;
- (id)objectInListAtIndex:(unsigned)theIndex;

@end
