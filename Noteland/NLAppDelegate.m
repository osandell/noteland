//
//  NLAppDelegate.m
//  Noteland
//
//  Created by Brent Simmons on 6/25/14.
//  Copyright (c) 2014 Q Branch LLC. All rights reserved.
//

#import "NLAppDelegate.h"

@implementation NLAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSArray *windows = [[NSApplication sharedApplication] windows];
    if ([windows count] > 0) {
        NSWindow *firstWindow = [windows objectAtIndex:0];
        [firstWindow close];
    }
}

@end

