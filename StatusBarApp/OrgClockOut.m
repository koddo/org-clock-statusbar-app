//
//  OrgClockOut.m
//  StatusBarApp
//
//  Created by Alex Scherbanov on 11/09/14.
//  Copyright (c) 2014 egotv.ru. All rights reserved.
//

#import "OrgClockOut.h"

#import "AppDelegate.h"

@implementation OrgClockOut

-(id)performDefaultImplementation {

    NSStatusItem* statusBar = [(AppDelegate *)[[NSApplication sharedApplication] delegate] statusBar];

    statusBar.image = [(AppDelegate *)[[NSApplication sharedApplication] delegate] orgClockedOut];
    [statusBar.menu itemWithTag:0].title = @"nil";
    statusBar.toolTip = @"nil";  // TODO: some resource str
    
    return nil;
}


@end
