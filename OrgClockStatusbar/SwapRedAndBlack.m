//
//  SwapRedAndBlack.m
//  OrgClockStatusbar
//
//  Created by Alex Scherbanov on 12/09/14.
//  Copyright (c) 2014 egotv.ru. All rights reserved.
//

#import "SwapRedAndBlack.h"

#import "AppDelegate.h"

@implementation SwapRedAndBlack

-(id)performDefaultImplementation {
    return [(AppDelegate *)[[NSApplication sharedApplication] delegate] toggle];;
}

@end
