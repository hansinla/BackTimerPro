//
//  BTDataSource.m
//  BackTimerPro
//
//  Created by Hans van Riet on 5/13/14.
//  Copyright (c) 2014 Hans van Riet. All rights reserved.
//

#import "BTDataSource.h"

@implementation BTDataSource

-(int)numberOfRowsInTableView:(NSTableView *)tableView
{
    return 10;
}



-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    return [NSCalendarDate date];
}




@end
