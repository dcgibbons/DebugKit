DebugKit - Debugging Tools for Cocoa
====================================

DebugKit is a framework (Mac OS X) or a static Cocoa library (iOS) containing
useful debugging tools that I find myself in need of regardless of what 
langauge or platform I am using.

In this initial version, the function use of this framework is for a utility 
to display the contents of a memory buffer in hexadecimal and printable ASCII
format, much like the hd or hexdump UNIX utilities. I find this type of display
invaluable when dealing with network protocols or when storing/loading
persistent binary data to/from storage.

The hexDump utilty is provided as a simple Objective-C function, but there are
also categories so that NSData and NSString objects can easily be dumped without
the overhead of extracting the underlying binary data from the objects.

I hope other developers can find this utility helpful in their own work.

Chad Gibbons
 Nuclear Bunny Studios, LLC
 June, 2012


Usage
-----

Using `hexDump` directly to display an array of bytes:

```objc
#import "DebugKit.h"
```

...

```objc
const char *str = "hello, world!";
NSLog(@"Dump:\n%@\n", hexDump(str, strlen(str)));
```

...

    2012-06-27 15:23:32.002 otest[41823:403] Dump:
    0000 68 65 6c 6c 6f 2c 20 77 6f 72 6c 64 21          hello, world!  


Using the `NSString+HexDump` category:

```objc
#import "DebugKit.h"
```

...

```objc
NSString *str = @"How now, brown cow.";
NSLog(@"Dump:\n%@\n", [str hexDump:NSUnicodeStringEncoding
```
