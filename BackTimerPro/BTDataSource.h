//
//  BTDataSource.h
//  BackTimerPro
//
//  Created by Hans van Riet on 5/13/14.
//  Copyright (c) 2014 Hans van Riet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTDataSource : NSObject

-(int)numberOfRowsInTableView:(NSTableView *)tableView;
-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;

@end
