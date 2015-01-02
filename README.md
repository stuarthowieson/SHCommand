SHCommand
=========

**SHCommand** is an Objective-C class that combines **NSTask** and **NSPipe** to allow simple command execution from within an Obejctive-C application.

An instance of **SHCommand** will pipe data from **stdout** and **stderr** to the instance's delegate and will pipe data into **stdin**.

Usage
-----

Setting up an **SHCommand** is really simple:

	SHCommand* command = [[SHCommand alloc] init];

	[command setExectuablePath:@"/usr/bin/which"];
	[command setArgumentsArray:@[@"which"]];
	[command setDelegate:...]

Alternatively, for a one-line setup:

	SHCommand* command = [SHCommand commandWithExecutablePath:@"/usr/bin/which" withArguments:@[@"which"] withDelegate:...];

Using it is even simpler:

	[command execute];

The command will run asynchronously and notify the delegate of events that occur. These events are consumed by implementing the **SHCommandDelegate** protocol and its methods within the command's delegate. These methods are:

	-(void) commandDidFinish:(SHCommand*)command withExitCode:(int)iExitCode;
	-(void) outputData:(NSData*)data providedByCommand:(SHCommand*)command;
	-(void) errorData:(NSData*)data providedByCommand:(SHCommand*)command;

If the command requires input, the following command can be used like so:

	[command provideInputData:[@"..." dataUsingEncoding:NSUTF8StringEncoding]];

If the execution state of the command needs to be checked:

	[command isExecuting];

Finally, if the execution of the commands needs to be stopped:

	[command stopExecuting];

**Note:** the above command will still trigger the commandDidFinish:withExitCode: callback if it is implemented within the delegate and the delegate has been set.

Example
-------

An example is included to show the usage of **SHCommand**.
