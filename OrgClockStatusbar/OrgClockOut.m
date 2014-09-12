//
//  OrgClockOut.m
//  OrgClockStatusbar
//
//  Created by Alex Scherbanov on 11/09/14.
//  Copyright (c) 2014 egotv.ru. All rights reserved.
//

#import "OrgClockOut.h"

#import "AppDelegate.h"

@implementation OrgClockOut

-(id)performDefaultImplementation {

    [(AppDelegate *)[[NSApplication sharedApplication] delegate] clockOut];
    
    return nil;
}


@end
