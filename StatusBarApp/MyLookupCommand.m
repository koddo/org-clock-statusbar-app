//
//  MyLookupCommand.m
//  StatusBarApp
//
//  Created by Alex Scherbanov on 11/09/14.
//  Copyright (c) 2014 egotv.ru. All rights reserved.
//

#import "MyLookupCommand.h"

#import "AppDelegate.h"

@implementation MyLookupCommand

-(id)performDefaultImplementation {
    
    // get the arguments
    NSDictionary *args = [self evaluatedArguments];
    NSString *stringToSearch = @"";
    if(args.count) {
        stringToSearch = [args valueForKey:@""];    // get the direct argument
    } else {
        // raise error
        [self setScriptErrorNumber:-50];
        [self setScriptErrorString:@"Parameter Error: A Parameter is expected for the verb 'lookup' (You have to specify _what_ you want to lookup!)."];
    }
    // Implement your code logic (in this example, I'm just posting an internal notification)
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppShouldLookupStringNotification" object:stringToSearch];
    
    
    NSLog(@"lookup: %@", stringToSearch);
    // $ osascript -e 'tell application "StatusBarApp" to lookup "first try"'
    
    [(AppDelegate *)[[NSApplication sharedApplication] delegate] statusBar].title = stringToSearch;
    
    return nil;
}

@end
