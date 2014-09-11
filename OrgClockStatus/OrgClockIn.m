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

    [(AppDelegate *)[[NSApplication sharedApplication] delegate] clockIn:taskName];
    
    return nil;
}

@end
