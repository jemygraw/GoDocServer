//
//  AppDelegate.m
//  GoDocServer
//
//  Created by jemy on 28/09/2017.
//  Copyright © 2017 Qiniu Cloud. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)showWndAction{
    NSLog(@"show window clicked");
    [NSApp activateIgnoringOtherApps:YES];
}

-(void)hideWndAction{
    NSLog(@"hide window clicked");
    [NSApp hide:self];
}

-(void) quitWndAction{
    NSLog(@"quit windows clicked");
    [NSApp terminate:self];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    //set status item
    self.statusItem=[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    NSImage *image=[NSImage imageNamed:@"statusIcon"];
    [self.statusItem setImage:image];
    [self.statusItem setToolTip:@"GoDocServer"];
    [self.statusItem setHighlightMode:YES];
    [self.statusItem setTarget:self];
    
    //add show window
    NSMenu *statusMenu=[[NSMenu alloc]initWithTitle:@"GoDocServer"];
    self.statusItem.menu=statusMenu;
    
    //add show menu
    NSMenuItem *showWndMenuItem=[[NSMenuItem alloc]initWithTitle:@"显示窗口" action:@selector(showWndAction) keyEquivalent:@"O"];
    [statusMenu addItem:showWndMenuItem];
    //add hide menu
    NSMenuItem *hideWndMenuitem=[[NSMenuItem alloc]initWithTitle:@"隐藏窗口" action: @selector(hideWndAction) keyEquivalent:@"H"];
    [statusMenu addItem:hideWndMenuitem];
    //add sep
    [statusMenu addItem:[NSMenuItem separatorItem]];
    //add quit menu
    NSMenuItem *exitWndMenuItem=[[NSMenuItem alloc]initWithTitle:@"退出" action:@selector(quitWndAction) keyEquivalent:@"Q"];
    [statusMenu addItem:exitWndMenuItem];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
