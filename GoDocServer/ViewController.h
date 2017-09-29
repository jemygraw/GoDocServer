//
//  ViewController.h
//  GoDocServer
//
//  Created by jemy on 28/09/2017.
//  Copyright © 2017 Qiniu Cloud. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *hostTextField;
@property (weak) IBOutlet NSTextField *portTextField;
- (IBAction)actionButtonPressed:(id)sender;
@property (weak) IBOutlet NSTextFieldCell *gorootTextField;

@end

