//
//  ViewController.m
//  GoDocServer
//
//  Created by jemy on 28/09/2017.
//  Copyright © 2017 Qiniu Cloud. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [super setTitle:@"GoDocServer"];
    [self.gorootTextField setStringValue:@"/usr/local/go"];
    [self.hostTextField setStringValue:@"localhost"];
    [self.portTextField setStringValue:@"6060"];
}

-(void) viewWillDisappear{
    NSLog(@"window will disappear");
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

-(void) updateStatus:(NSTask *)task{
    [task waitUntilExit];
    int status=[task terminationStatus];
    NSLog(@"%d",status);
    if(status){
        NSLog(@"start new process failed");
    }else{
        NSLog(@"start new process success");
    }
}


- (IBAction)actionButtonPressed:(id)sender {
    NSString *host=[self.hostTextField stringValue];
    NSInteger port=[self.portTextField integerValue];
    NSString *goRoot=[self.gorootTextField stringValue];
    NSString *godocCmd=[NSString stringWithFormat:@"%@/bin/godoc",goRoot];
    NSLog(@"%@",godocCmd);
    NSTask *godocTask=[NSTask new];
    [godocTask setLaunchPath:godocCmd];
    [godocTask setArguments:@[[NSString stringWithFormat:@"-http=%@:%ld",host,port]]];
    [godocTask launch];
    BOOL isRunning=[godocTask isRunning];
    if (isRunning){
        NSLog(@"godoc is running");
        NSURL *docURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%ld",host,port]];
        BOOL status=[[NSWorkspace sharedWorkspace]openURL:docURL];
        if(!status){
            NSLog(@"open url failed: %@",[docURL description]);
        }
    }else{
        NSLog(@"godoc is not running");
    }
    [self performSelectorOnMainThread:@selector(updateStatus:) withObject:godocTask waitUntilDone:YES];
}


@end
