//
//  AppDelegate.m
//  OrgClockStatus
//
//  Created by Alex Scherbanov on 11/09/14.
//  Copyright (c) 2014 egotv.ru. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

@synthesize statusBar = _statusBar;

- (void) awakeFromNib {
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    // self.statusBar.title = @"Text";
    self.orgClockedOut = [NSImage imageNamed:@"org clocked out"];
    self.orgClockedIn = [NSImage imageNamed:@"org clocked in"];
    self.statusBar.menu = self.statusMenu;
    self.statusBar.highlightMode = YES;

    self.statusBar.image = self.orgClockedOut;
    [self.statusBar.menu itemWithTag:0].title = @"org-clock-status: nil";
    self.statusBar.toolTip = @"org-clock-status: nil";
}

-(IBAction)openGithubPage:(id)sender
{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"https://github.com/koddo/org-clock-status-app"]];
}

-(IBAction)toggleColors:(id)sender
{
    
}

@end
