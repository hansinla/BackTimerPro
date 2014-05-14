//
//  BTLineItem.m
//  BackTimerPro
//
//  Created by Hans van Riet on 5/12/14.
//  Copyright (c) 2014 Hans van Riet. All rights reserved.
//

#import "BTLineItem.h"

@implementation BTLineItem


-(NSString *)description
{
    return [NSString stringWithFormat:@"Item Number: %@ Description: %@ Dur: %@\n", _itemNumber, _itemDescription, _itemDuration];
}

@end
