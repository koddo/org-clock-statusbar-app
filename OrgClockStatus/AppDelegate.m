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
    [self toggle];
    [self clockOut];
}

-(void) clockIn:(NSString*)taskName {
    self.statusBar.image = self.orgClockedIn;
    [self.statusBar.menu itemWithTag:1].title = taskName;
    self.statusBar.toolTip = taskName;
}

-(void) clockOut {
    NSString* taskName = @"nil";
    self.statusBar.image = self.orgClockedOut;
    [self.statusBar.menu itemWithTag:1].title = taskName;
    self.statusBar.toolTip = taskName;
}

-(IBAction)openGithubPage:(id)sender
{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"https://github.com/koddo/org-clock-status-app"]];
}

-(IBAction)toggleRedMeansClockedOut:(id)sender
{
    [self toggle];
}

- (void)toggle {
    NSMenuItem * theItem = [self.statusBar.menu itemWithTag:2];   // set it manually in interface builder
    
    if (theItem.state == NSOnState) {
        [theItem setState: NSOffState];
        self.orgClockedOut = [NSImage imageNamed:@"org clocked in"];
        self.orgClockedIn = [NSImage imageNamed:@"org clocked out"];
    } else {
        [theItem setState: NSOnState];
        self.orgClockedOut = [NSImage imageNamed:@"org clocked out"];
        self.orgClockedIn = [NSImage imageNamed:@"org clocked in"];
    }
}

@end
