//
//  OrgClockIn.m
//  OrgClockStatus
//
//  Created by Alex Scherbanov on 11/09/14.
//  Copyright (c) 2014 egotv.ru. All rights reserved.
//

#import "OrgClockIn.h"

#import "AppDelegate.h"

@implementation OrgClockIn

-(id)performDefaultImplementation {
    
    NSDictionary *args = [self evaluatedArguments];
    NSString *taskName = @"";
    if(args.count) {
        taskName = [args valueForKey:@""];
    } else {
        [self setScriptErrorNumber:-50];
        [self setScriptErrorString:@"A parameter is expected for the verb 'clockin', should be task name."];
    }

    NSStatusItem* statusBar = [(AppDelegate *)[[NSApplication sharedApplication] delegate] statusBar];
    NSImage* orgClockedIn = [(AppDelegate *)[[NSApplication sharedApplication] delegate] orgClockedIn];

    statusBar.image = orgClockedIn;
    [statusBar.menu itemWithTag:0].title = [NSString stringWithFormat:@"%@/%@/", @"org-clock-status: ", taskName];
    statusBar.toolTip = taskName;
    
    return nil;
}

@end
