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
    self.orgClockedOut = [NSImage imageNamed:@"black box"];
    self.orgClockedIn = [NSImage imageNamed:@"red box"];
    self.statusBar.menu = self.statusMenu;
    self.statusBar.highlightMode = YES;

    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"swapRedAndBlack"]) {
    
    }
    [self loadPrefs];
    [self clockOut];
}

-(NSString*) currentTaskName:(NSString*)taskName {
    return [NSString stringWithFormat:@"Current task: %@", taskName];
}

-(void) clockIn:(NSString*)taskName {
    self.statusBar.image = self.orgClockedIn;
    [self.statusBar.menu itemWithTag:1].title = [self currentTaskName: taskName];
    self.statusBar.toolTip = taskName;
    self.status = YES;
}

-(void) clockOut {
    NSString* taskName = @"nil";
    self.statusBar.image = self.orgClockedOut;
    [self.statusBar.menu itemWithTag:1].title = [self currentTaskName: taskName];
    self.statusBar.toolTip = taskName;
    self.status = NO;
}

-(void) refresh {
    if (self.status) {
        [ self clockIn : [self.statusBar.menu itemWithTag:1].title ];
    } else {
        [ self clockOut ];
    }
}

-(IBAction)openGithubPage:(id)sender
{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"https://github.com/koddo/org-clock-status-app"]];
}

-(IBAction)toggleRedMeansClockedOut:(id)sender
{
    [self toggle];
}

- (void)loadPrefs {
    NSMenuItem * theItem = [self.statusBar.menu itemWithTag:2];   // set it manually in interface builder
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"swapRedAndBlack"]) {
        [theItem setState: NSOnState];
        self.orgClockedOut = [NSImage imageNamed:@"black box"];
        self.orgClockedIn = [NSImage imageNamed:@"red box"];
    } else {
        [theItem setState: NSOffState];
        self.orgClockedOut = [NSImage imageNamed:@"red box"];
        self.orgClockedIn = [NSImage imageNamed:@"black box"];
    }
    [self refresh];
}

- (void)toggle {
    NSMenuItem * theItem = [self.statusBar.menu itemWithTag:2];   // set it manually in interface builder
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"swapRedAndBlack"]) {
        [theItem setState: NSOffState];
        self.orgClockedOut = [NSImage imageNamed:@"red box"];
        self.orgClockedIn = [NSImage imageNamed:@"black box"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"swapRedAndBlack"];
    } else {
        [theItem setState: NSOnState];
        self.orgClockedOut = [NSImage imageNamed:@"black box"];
        self.orgClockedIn = [NSImage imageNamed:@"red box"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"swapRedAndBlack"];
    }
    [self refresh];
}




@end
