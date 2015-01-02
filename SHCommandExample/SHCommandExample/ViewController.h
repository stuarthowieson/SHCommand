//
//  ViewController.h
//  SHCommandExample
//
//  Created by Stuart Howieson on 30/12/2014.
//  Copyright (c) 2014 Stuart Howieson. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SHCommand.h"

@interface ViewController : NSViewController <SHCommandDelegate>
{
    SHCommand*  m_command;
}

@property (weak) IBOutlet NSTextField *textCommand;
@property (weak) IBOutlet NSTextField *textArguments;
@property (weak) IBOutlet NSTextField *textInput;
@property (weak) IBOutlet NSTextField *textOutput;
@property (weak) IBOutlet NSProgressIndicator *progressExecuting;

- (IBAction)buttonExecutePressed:(id)sender;
- (IBAction)buttonProvidePressed:(id)sender;

@end

