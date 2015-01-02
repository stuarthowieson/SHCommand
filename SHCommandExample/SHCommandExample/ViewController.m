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
    
    SHCommand* cmd = [SHCommand commandWithExecutablePath:@"/usr/bin/say" withArguments:@[@"-v", @"vicki", @"Shall we go to bed, babe?"] withDelegate:self];
    [cmd execute];
}

- (void) commandDidFinish:(SHCommand *)command
{
    NSLog(@"DONE");
}

- (void) outputData:(NSData *)data providedByCommand:(SHCommand *)command
{
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (void) errorData:(NSData *)data providedByCommand:(SHCommand *)command
{
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

@end
