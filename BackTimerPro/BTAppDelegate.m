//
//  BTAppDelegate.m
//  BackTimerPro
//
//  Created by Hans van Riet on 5/8/14.
//  Copyright (c) 2014 Hans van Riet. All rights reserved.
//

#import "BTAppDelegate.h"
#import "BTLineItem.h"

@implementation BTAppDelegate

#define TIME_INTERVAL  0.1

NSDateFormatter *formatter;
NSMutableArray *showRunDown;


#pragma mark - Application Lifecycle
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

-(void)awakeFromNib {
    
    //TTFileHandler *aHandler = [[TTFileHandler alloc]init];
    //[aHandler openDataFiles];
    
    NSTimer *updateTimer __attribute__((unused)) = [NSTimer scheduledTimerWithTimeInterval:TIME_INTERVAL
                                                                                    target:self
                                                                                  selector:@selector(showTime)
                                                                                  userInfo:nil
                                                                                   repeats:YES];
}

-(void)showTime {
    
    if (formatter == nil)
    {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm:ss"];
    }
//    NSLog(@"clockAdjustValue: %d", [_clockAdjust intValue]);
    
    NSString *dateString = [formatter stringFromDate:[[NSDate date] dateByAddingTimeInterval:[_clockAdjust intValue]]];
    [_timeLabel setStringValue:dateString];
}


-(IBAction)openDataFile:(id)sender
{
    
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    [panel setCanChooseDirectories:YES];
    [panel setAllowsMultipleSelection:NO];
    [panel setAllowedFileTypes:@[@"csv"]];
    [panel setMessage:@"Open rundown file (.csv)."];
    
    // This method displays the panel and returns immediately.
    // The completion handler is called when the user selects an
    // item or cancels the panel.
    [panel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [[panel URLs] objectAtIndex:0];
            [self readFile:theDoc];
        }
    }];
}

-(void)readFile:(NSURL *)theURL
{
    // Setup a number formatter to convert time string into Hour and Minute components
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSError *error;
    // Read in a file as a string with error checking
    NSString *readString = [NSString stringWithContentsOfURL:theURL
                                                    encoding:NSUTF8StringEncoding
                                                       error:&error];
    if (!readString)
    {
        NSLog(@"Error reading file: %@", error);
    }

    if (!showRunDown)
    {
        showRunDown = [[NSMutableArray alloc]init];
    }
    
    NSArray *items  = [[NSMutableArray alloc] init];
    
    // Break the raw file string (navDataFileString) into lines
    NSArray *runDownLineItems = [readString componentsSeparatedByString:@"\n"];
    

    
    for (NSString *lineItems in runDownLineItems)
    {
        // Show Item Object
        BTLineItem *anItem= [[BTLineItem alloc]init];
        
        // Break the flight line into components
        items   = [lineItems componentsSeparatedByString:@","];
        
        if ([items count] == 3 && ![[items objectAtIndex:0]  isEqual: @""]) {
            // Set the variables for the TTFlight object
            [anItem setItemNumber:[items objectAtIndex:0]];
            [anItem setItemDescription:[items objectAtIndex:1]];
            [anItem setItemDuration:[items objectAtIndex:2]];
            
            // For debugging
            NSLog(@"%@", anItem);
            
            [showRunDown addObject:anItem];
        }
    }
    NSLog(@"Show Run down loaded: %lu items.", [showRunDown count]);
}




@end
