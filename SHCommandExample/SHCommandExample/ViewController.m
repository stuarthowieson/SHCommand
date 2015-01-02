//
//  ViewController.m
//  SHCommandExample
//
//  Created by Stuart Howieson on 30/12/2014.
//  Copyright (c) 2014 Stuart Howieson. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) commandDidFinish:(SHCommand *)command withExitCode:(int)iExitCode
{
    [[self progressExecuting] stopAnimation:self];
    [[self progressExecuting] setHidden:YES];
    
    [[self textOutput] setStringValue:[NSString stringWithFormat:@"FINISHED: Exit Code %d", iExitCode]];
}

- (void) outputData:(NSData *)data providedByCommand:(SHCommand *)command
{
    NSString* szOutput = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    [[self textOutput] setStringValue:szOutput];
}

- (void) errorData:(NSData *)data providedByCommand:(SHCommand *)command
{
    NSLog(@"ERROR: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (IBAction)buttonExecutePressed:(id)sender
{
    NSArray* arrayArguments = nil;
    
    if ([[[self textArguments] stringValue] length] > 0)
    {
        arrayArguments = [[[self textArguments] stringValue] componentsSeparatedByString:@","];
    }
    
    if (m_command)
    {
        if ([m_command isExecuting])
        {
            [m_command stopExecuting];
        }
    }
    
    m_command = [SHCommand commandWithExecutablePath:[[self textCommand] stringValue] withArguments:arrayArguments withDelegate:self];
    [m_command execute];
    
    [[self progressExecuting] startAnimation:self];
    [[self progressExecuting] setHidden:NO];
}

- (IBAction)buttonProvidePressed:(id)sender
{
    if (m_command)
    {
        if ([m_command isExecuting])
        {
            [m_command provideInputData:[[[self textInput] stringValue] dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
}

@end
