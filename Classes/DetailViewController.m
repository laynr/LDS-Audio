/*

File: DetailViewController.m
Abstract: Creates a grouped table view to act as an inspector.

Version: 2.6

*/

#import "DetailViewController.h"

@implementation DetailViewController

@synthesize detailItem;


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Navigation logic
	
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	NSLog(@"link type: %@",  [(NSDictionary *)detailItem objectForKey:@"format"]);
	
	
	//NSString * storyLink = @"http://byuradio.org/newsaudiofiles/November%2025th.mp3";
	if ([[(NSDictionary *)detailItem objectForKey:@"format"] isEqual:@"one"]){
		NSString * storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"media"];
		NSArray *storyLinkArray = [storyLink componentsSeparatedByString: @"http:"];
		NSLog(@"link type: %@",storyLink);
		storyLink = [storyLinkArray objectAtIndex: 2];
		storyLinkArray = [storyLink componentsSeparatedByString: @".mp3"];
		storyLink = [storyLinkArray objectAtIndex: 0];
		storyLink = [NSString stringWithFormat: @"http:%@.mp3",storyLink];
		NSLog(@"link type: %@",storyLink);
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
		NSLog(@"mp3: %@", storyLink);
		self.title = storyLink;
		NSLog(@"new value: %@",  [(NSDictionary *)detailItem objectForKey:@"format"]);
		[self alertOKCancelAction];
		// open in Safari
		//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:storyLink]];
	} 
	if ([[(NSDictionary *)detailItem objectForKey:@"format"] isEqual:@"two"]) {
		NSString * storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
		NSLog(@"mp3: %@", storyLink);
		self.title = storyLink;
		[self alertOKCancelAction];
		// open in Safari
		//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:storyLink]];
	} 
	if ([[(NSDictionary *)detailItem objectForKey:@"format"] isEqual:@"three"]){
		NSString * storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"audio"];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
		NSLog(@"mp3: %@", storyLink);
		self.title = storyLink;
		[self alertOKCancelAction];
		// open in Safari
		//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:storyLink]];
	}
	if ([[(NSDictionary *)detailItem objectForKey:@"format"] isEqual:@"four"]){
		NSString * storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"url"];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
		NSLog(@"mp3: %@", storyLink);
		self.title = storyLink;
		[self alertOKCancelAction];
		// open in Safari
		//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:storyLink]];
	}	
	if ([[(NSDictionary *)detailItem objectForKey:@"format"] isEqual:@"five"]) {
		NSString * storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
		storyLink = [storyLink stringByReplacingOccurrencesOfString:@"http://youtube.com/?v=" withString:@""];
		NSLog(@"mp3: %@", storyLink);
		
		// open in Safari	
		//NSString *VID = [NSString stringWithFormat: @"http://www.youtube.com/watch?v=%@",storyLink];
		//NSLog(@"vid: %@", VID);
		self.title = storyLink;
		[self alertOKCancelAction];
		// open in Safari
		//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:storyLink]];
	}	
	NSLog (@"title: %@", self.title);
}

- (void)viewDidLoad {
	UIBarButtonItem *rButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:NULL];
	
	rButton.action = @selector(refreshAction);
	self.navigationItem.rightBarButtonItem = rButton;
	[rButton release];
}	

- (void)refreshAction { 
	// open a alert with an OK and cancel button
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Updated" message:@"The newest content for this selection has been loaded." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
	[errorAlert release];
	
	NSLog(@"refreshAction");
	[stories removeAllObjects];
	[self.tableView reloadData];
	
	NSLog(@"downloading new copy");
	
	
	NSString  *URL = [(NSDictionary *)detailItem objectForKey:@"feed"];
	NSArray *urlArray = [URL componentsSeparatedByString: @"/"];
	NSString *fileName = [urlArray lastObject];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:fileName];
	
	NSArray *addressArray = [[NSString stringWithContentsOfFile:path] componentsSeparatedByString:@"\n"];
	
	
	NSString *urlAddress3 = [NSString stringWithFormat: @"%@",URL];
	NSURL *theURL3 = [[NSURL alloc] initWithString:urlAddress3];
	NSString *csvDir = [NSString stringWithContentsOfURL:theURL3  encoding:NSUTF8StringEncoding error:nil];
	[csvDir writeToFile:path atomically:YES encoding:NSUnicodeStringEncoding error:NULL];
	
	NSLog(path);
	
	[self parseXMLFileAtURL:path];	
	[self.tableView reloadData];
	

} 

- (void)viewWillAppear:(BOOL)animated {
	

	
	//	NSString * path = [(NSDictionary *)detailItem objectForKey:@"feed"];
	//	[self parseXMLFileAtURL:path];	
	
	///////
	NSString  *URL = [(NSDictionary *)detailItem objectForKey:@"feed"];
	NSArray *urlArray = [URL componentsSeparatedByString: @"/"];
	NSString *fileName = [urlArray lastObject];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:fileName];
	
	NSArray *addressArray = [[NSString stringWithContentsOfFile:path] componentsSeparatedByString:@"\n"];
	
	if (addressArray){
		NSLog(@"found local copy and using it");
	} else {	
		NSLog(@"downloading new copy");
		NSString *urlAddress3 = [NSString stringWithFormat: @"%@",URL];
		NSURL *theURL3 = [[NSURL alloc] initWithString:urlAddress3];
		NSString *csvDir = [NSString stringWithContentsOfURL:theURL3  encoding:NSUTF8StringEncoding error:nil];
		[csvDir writeToFile:path atomically:YES encoding:NSUnicodeStringEncoding error:NULL];
	}
	NSLog(path);
	
	[self parseXMLFileAtURL:path];	
	
	
	///////
	
    // Update the view with current data before it is displayed
    [super viewWillAppear:animated];
    
    // Scroll the table view to the top before it appears
    [self.tableView reloadData];
    [self.tableView setContentOffset:CGPointZero animated:NO];
    self.title = [(NSDictionary *)detailItem objectForKey:@"title"];
	
	
}


// Standard table view data source and delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger rows = 0;
	//rows = [[detailItem objectForKey:@"mainCharacters"] count];
	rows = [stories count];
    return rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"tvc";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
/*    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.font = [UIFont systemFontOfSize:12];
    }
    
    
    // Set the text in the cell for the section/row
    
    NSString *cellText = nil;
    
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	cellText = [[stories objectAtIndex: storyIndex] objectForKey: @"title"];
   
	cell.text = cellText;
	NSLog(@"adding story: %@,%@", cell.text,cellText);


	
    return cell;
 */
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"MyIdentifier"] autorelease];
		CGRect contentRect = CGRectMake(28.0f, 4.0f, 260.0f, 20.0f);
		UILabel *textView = [[UILabel alloc] initWithFrame:contentRect];
		
		textView.textColor = [UIColor blackColor];
		textView.font = [UIFont boldSystemFontOfSize:12];
		textView.tag = 1;
		[cell.contentView addSubview:textView];
		[textView release];
		
		CGRect contentRect2 = CGRectMake(28.0f, 24.0f, 260.0f, 18.0f);
		UILabel *textView2 = [[UILabel alloc] initWithFrame:contentRect2];
		
		textView2.textColor = [UIColor grayColor];
		textView2.font = [UIFont systemFontOfSize:9];
		textView2.tag = 2;
		[cell.contentView addSubview:textView2];
		[textView2 release];
	}
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];

	UILabel *txtView = (UILabel*)[cell viewWithTag:1];
	UILabel *txtView2 = (UILabel*)[cell viewWithTag:2];
	txtView.text =  [[stories objectAtIndex: storyIndex] objectForKey: @"title"];
	txtView2.text = [[stories objectAtIndex: storyIndex] objectForKey: @"date"];
	return cell;
}

//////////////////////////////////

- (void)parserDidStartDocument:(NSXMLParser *)parser{	
	NSLog(@"found file and started parsing");
	
}

- (void)parseXMLFileAtURL:(NSString *)path
{	
	stories = [[NSMutableArray alloc] init];
	
	NSData *Data = [[NSData alloc] initWithContentsOfFile:path];
	rssParser = [[NSXMLParser alloc] initWithData:Data];
	
    //you must then convert the path to a proper NSURL or it won't work
    ////NSURL *xmlURL = [NSURL URLWithString:URL];
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
    ////rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [rssParser setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	
    [rssParser parse];
	
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{			
    //NSLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches...
		item = [[NSMutableDictionary alloc] init];
		currentTitle = [[NSMutableString alloc] init];
		currentDate = [[NSMutableString alloc] init];
		currentSummary = [[NSMutableString alloc] init];
		currentLink = [[NSMutableString alloc] init];
		currentAudio = [[NSMutableString alloc] init];
		currentMedia = [[NSMutableString alloc] init];
		currentEnclosure = [[NSMutableString alloc] init];
	}
	
	if ([elementName isEqualToString:@"enclosure"]) {
		//NSLog([attributeDict valueForKey:@"url"]);
		currentEnclosure = [attributeDict valueForKey:@"url"];
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{     
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...
		[item setObject:currentTitle forKey:@"title"];
		[item setObject:currentLink forKey:@"link"];
		[item setObject:currentSummary forKey:@"summary"];
		[item setObject:currentDate forKey:@"date"];
		[item setObject:currentAudio forKey:@"audio"];
		[item setObject:currentMedia forKey:@"media"];
		[item setObject:currentEnclosure forKey:@"url"];
		
		[stories addObject:[item copy]];
		
		NSLog(@"adding story: %@", currentTitle);
		//NSLog(@"adding Link: %@", currentLink);
		//NSLog(@"adding Audio: %@", currentAudio);
		//NSLog(@"adding Media: %@", currentMedia);
		//NSLog(@"adding story: %@", stories);
	}
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//NSLog(@"found characters: %@", string);
	// save the characters for the current item...
	if ([currentElement isEqualToString:@"title"]) {
		[currentTitle appendString:string];
	} else if ([currentElement isEqualToString:@"link"]) {
		[currentLink appendString:string];
	} else if ([currentElement isEqualToString:@"description"]) {
		[currentSummary appendString:string];
	} else if ([currentElement isEqualToString:@"pubDate"]) {
		[currentDate appendString:string];
	} else if ([currentElement isEqualToString:@"guid"]) {
		[currentAudio appendString:string];
	} else {
		[currentMedia appendString:string];
	}
	
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	NSLog(@"all done!");
	NSLog(@"stories array has %d items", [stories count]);
	//[newsTable reloadData];
}
///////////////////////
- (void)jumpToEmail {
	//NSString * finalLink = @"http://www.cnn.com";
	// create the string that points to the correct Wikipedia page for the element name
	NSString * finalLink = self.title;
	NSString *HTML = [NSString stringWithFormat:@"%@",finalLink];
	NSString *Greeting = [NSString stringWithFormat:@"Here is a link to an article you might find interesting:\n\nLink: "];
	
	NSString *urlEncodedGreeting = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)Greeting, NULL, CFSTR(";/?:@&=+$,"), kCFStringEncodingUTF8);
	NSString *urlEncodedHTML = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)HTML, NULL, CFSTR(";/?:@&=+$,"), kCFStringEncodingUTF8);
	NSString *mystring = [NSString stringWithFormat: @"mailto:?subject=Article&body=%@%@",urlEncodedGreeting,urlEncodedHTML];
	
	if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:mystring]])
	{
		// there was an error trying to open the URL. for the moment we'll simply ignore it.
	}
}

- (void)alertOKCancelAction {
	// open a alert with an OK and cancel button
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Listen or Share" message:@"Choose what you would like to do with this selection."  delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Listen", @"Share",nil];
	[alert show];
	[alert release];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	//NSString * finalLink = @"http://www.cnn.com";
	//NSString * finalLink = [[[UIApplication sharedApplication] delegate] tableView.title];
	NSString * finalLink = self.title;
	// the user clicked one of the OK/Cancel buttons
	if (buttonIndex == 1)
	{
		NSLog(finalLink);
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:finalLink]];
		NSLog(@"Safari");
		//return 0;

	}
	if (buttonIndex == 2)
	{
		NSLog(finalLink);
		[self jumpToEmail];
		NSLog(@"email");
		//return 1;

	}
	
}

@end
