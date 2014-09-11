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
    self.orgClockedOut = [NSImage imageNamed:@"red square"];
    self.orgClockedIn = [NSImage imageNamed:@"black square"];
    self.statusBar.menu = self.statusMenu;
    self.statusBar.highlightMode = YES;

    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"redMeansClockedOut"]) {
    
    }
    [self loadPrefs];
    [self clockOut];
}

-(void) clockIn:(NSString*)taskName {
    self.statusBar.image = self.orgClockedIn;
    [self.statusBar.menu itemWithTag:1].title = taskName;
    self.statusBar.toolTip = taskName;
    self.status = YES;
}

-(void) clockOut {
    NSString* taskName = @"nil";
    self.statusBar.image = self.orgClockedOut;
    [self.statusBar.menu itemWithTag:1].title = taskName;
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
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"redMeansClockedOut"]) {
        [theItem setState: NSOnState];
        self.orgClockedOut = [NSImage imageNamed:@"red square"];
        self.orgClockedIn = [NSImage imageNamed:@"black square"];
    } else {
        [theItem setState: NSOffState];
        self.orgClockedOut = [NSImage imageNamed:@"black square"];
        self.orgClockedIn = [NSImage imageNamed:@"red square"];
    }
    [self refresh];
}

- (void)toggle {
    NSMenuItem * theItem = [self.statusBar.menu itemWithTag:2];   // set it manually in interface builder
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"redMeansClockedOut"]) {
        [theItem setState: NSOffState];
        self.orgClockedOut = [NSImage imageNamed:@"black square"];
        self.orgClockedIn = [NSImage imageNamed:@"red square"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"redMeansClockedOut"];
    } else {
        [theItem setState: NSOnState];
        self.orgClockedOut = [NSImage imageNamed:@"red square"];
        self.orgClockedIn = [NSImage imageNamed:@"black square"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"redMeansClockedOut"];
    }
    [self refresh];
}




@end
