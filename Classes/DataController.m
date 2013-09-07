/*

File: DataController.m

Abstract:
A simple controller class responsible for managing the application's data.
Typically this object would be able to load and save a file containing the
appliction's data. This example illustrates just the basic minimum: it creates
an array containing information about some plays and provides simple accessor
methods for the array and its contents.

Version: 2.6


*/

#import "DataController.h"


@interface DataController ()
@property (nonatomic, copy, readwrite) NSMutableArray *list;
- (void)createDemoData;
@end


@implementation DataController

@synthesize list;


- (id)init {
    if (self = [super init]) {
        [self createDemoData];
    }
    return self;
}

// Custom set accessor to ensure the new list is mutable
- (void)setList:(NSMutableArray *)newList {
    if (list != newList) {
        [list release];
        list = [newList mutableCopy];
    }
}

// Accessor methods for list
- (unsigned)countOfList {
    return [list count];
}

- (id)objectInListAtIndex:(unsigned)theIndex {
    return [list objectAtIndex:theIndex];
}


- (void)dealloc {
    [list release];
    [super dealloc];
}


- (void)createDemoData {
    
    /*
     Create an array containing some demonstration data.
     Each data item is a dicionary that contains information about a play -- its list of characters, its genre, and its year of publication.  Typically the data would be comprised of instances of custom classes rather than dictionaries, but using dictionaries means fewer distractions in the example.
     */
    
    NSMutableArray *playList = [[NSMutableArray alloc] init];
    NSMutableDictionary *dictionary;
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Acts to Revelation Discussions", @"title", @"http://www.byub.org/newTestamentSeason2.rss", @"feed", @"three", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Book of Mormon Discussions", @"title", @"http://www.byub.org/bookofmormon.rss", @"feed", @"three", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release]; 
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"BYU Devotionals", @"title", @"http://www.byub.org/BYU_Devotionals.rss", @"feed", @"four", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"BYU Radio News", @"title", @"http://www.byuradio.org/byuradionews.rss", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"CES Firesides", @"title", @"http://feeds.lds.org/cesfiresides", @"feed", @"one", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Classic Speeches", @"title", @"http://speeches.byu.edu/rss/podcast1.xml", @"feed", @"four", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Discussions on the Old Testament", @"title", @"http://www.byub.org/oldtestament.rss", @"feed", @"three", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Doctrine and Covenants Discussions", @"title", @"http://www.byub.org/DoctrineAndCovenants.rss", @"feed", @"three", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];  
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"General Conference", @"title", @"http://feeds.lds.org/LDSGCComplete_eng", @"feed", @"one", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Gospel Teaching and Learning", @"title", @"http://www.byuradio.org/gt.rss", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
//	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Here's Y", @"title", @"http://www.classical89.org/hy/hy.rss", @"feed", @"two", @"format", nil];
//   [playList addObject:dictionary];
//    [dictionary release];	
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Insights Into Isaiah Discussions", @"title", @"http://www.byub.org/isaiah.rss", @"feed", @"three", @"format", nil];
	[playList addObject:dictionary];
    [dictionary release];  
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"LDS Voices", @"title", @"http://feeds2.feedburner.com/ldsvoices", @"feed", @"four", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
////	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Mormon Channel - Conversations", @"title", @"http://feeds.lds.org/LDSConversations", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Mormon Channel - Everything Creative", @"title", @"http://feeds.lds.org/EverythingCreative", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Mormon Channel - History Of Hymns", @"title", @"http://feeds.lds.org/HistoryOfHymns", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Mormon Channel - Into All The World", @"title", @"http://feeds.lds.org/LDSIntoAllTheWorld", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Mormon Channel - Legacy", @"title", @"http://feeds.lds.org/LDSLegacy", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Mormon Channel - Mormon Identity", @"title", @"http://feeds.lds.org/MormonIdentity", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Mormon Channel - Music With A Message", @"title", @"http://feeds.lds.org/MusicWithAMessage", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Mormon Channel - Scripture Stories", @"title", @"http://feeds.lds.org/ScriptureStories", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Mormon Channel - Stories From General Conference", @"title", @"http://feeds.lds.org/StoriesFromGenConf", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
////
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Mormon Messages - YouTube Channel", @"title", @"http://www.youtube.com/rss/user/MormonMessages/videos.rss", @"feed", @"five", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"New BYU Speeches", @"title", @"http://speeches.byu.edu/rss/podcast2.xml", @"feed", @"four", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Our Savior in the Gospels Discussions", @"title", @"http://www.byub.org/newTestamentSeason1.rss", @"feed", @"three", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];  
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Pearl of Great Price Discussions", @"title", @"http://www.byub.org/pearlofgreatprice.rss", @"feed", @"three", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Teachings of Presidents of the Church: Joseph Smith", @"title", @"http://feeds.lds.org/tptc_JS_mp3_eng", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"The Cricket and Seagull", @"title", @"http://skperry.libsyn.com/rss", @"feed", @"four", @"format", nil];
	[playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Thinking Aloud", @"title", @"http://www.classical89.org/thinkingaloud/thinkingaloud.rss", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
	dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Other Great Apps!", @"title", @"http://www.scoutic.com/rss", @"feed", @"two", @"format", nil];
    [playList addObject:dictionary];
    [dictionary release];
	
		
	self.list = playList;
    [playList release];	
}


@end



