//
//  BTAppDelegate.h
//  BackTimerPro
//
//  Created by Hans van Riet on 5/8/14.
//  Copyright (c) 2014 Hans van Riet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BTLineItem.h"

@interface BTAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *timeLabel;
@property (nonatomic, readwrite) int tapeDelayValue;
@property (nonatomic, readwrite) int clockAdjustValue;
@property (assign) IBOutlet NSTextField *tapeDelay;
@property (assign) IBOutlet NSTextField *clockAdjust;


-(IBAction)openDataFile:(id)sender;
-(void)readFile:(NSURL *)theURL;
-(void)showTime;

@end
