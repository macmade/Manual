/*******************************************************************************
 * Copyright (c) 2013-2014, Jean-David Gadina - www.xs-labs.com
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *  -   Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *  -   Redistributions in binary form must reproduce the above copyright
 *      notice, this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 *  -   Neither the name of 'Jean-David Gadina' nor the names of its
 *      contributors may be used to endorse or promote products derived from
 *      this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 ******************************************************************************/

/*!
 * @file        ApplicationDelegate.m
 * @copyright   (c) 2013-2014, Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

// uncomment this to log the class;method in a methods in this source file
//#define LOGFUNCNAME

#import "Debug.h"
#import "ApplicationDelegate.h"
#import "AboutWindowController.h"
#import "MainWindowController.h"

@implementation ApplicationDelegate

- ( void )dealloc
{
    //NSLOG_FUNCNAME;
    [ _aboutWindowController    release ];
    [ _mainWindowController     release ];
    
    [ super dealloc ];
}

- ( void )applicationDidFinishLaunching: ( NSNotification * )notification
{
    //NSLOG_FUNCNAME;
    
    //TODO006 - attempt to stop right margin truncation when printed
    //TODO007 - setVerticalPagination needed to be NSAutoPagination
    NSPrintInfo *currentNSPrintInfo = [NSPrintInfo sharedPrintInfo];
    [currentNSPrintInfo setHorizontalPagination:NSFitPagination];
    [currentNSPrintInfo setVerticalPagination:NSAutoPagination];
    
    ( void )notification;
    
    _mainWindowController = [ MainWindowController new ];
    
    [ _mainWindowController.window center ];
    [ _mainWindowController showWindow: nil ];
}

- ( NSApplicationTerminateReply )applicationShouldTerminate: ( NSApplication * )sender
{
    //NSLOG_FUNCNAME;
    
    ( void )sender;
    
    return NSTerminateNow;
}

- ( BOOL )applicationShouldTerminateAfterLastWindowClosed: ( NSApplication * )sender
{
    //NSLOG_FUNCNAME;
    
    ( void )sender;
    
    return YES;
}

- ( IBAction)showAboutWindow: ( id )sender
{
    //NSLOG_FUNCNAME; 
    
    if( _aboutWindowController == nil )
    {
        _aboutWindowController = [ AboutWindowController new ];
    }
    
    [ _aboutWindowController.window center  ];
    [ _aboutWindowController showWindow: sender ];
}

- ( BOOL )applicationWillTerminate: ( NSApplication * )sender
{
    //NSLOG_FUNCNAME;
    
    ( void )sender;
    
    return YES;
}

- ( BOOL )applicationDidHide: ( NSApplication * )sender
{
    //NSLOG_FUNCNAME;
    
    ( void )sender;
    
    return YES;
}

- ( BOOL )applicationDidUnhide: ( NSApplication * )sender
{
    //NSLOG_FUNCNAME;
    
    ( void )sender;
    
    return YES;
}

- ( BOOL )applicationDidResignActive: ( NSApplication * )sender
{
    //NSLOG_FUNCNAME;
    
    ( void )sender;
    
    return YES;
}

- ( BOOL )applicationDidBecomeActive: ( NSApplication * )sender
{
    //NSLOG_FUNCNAME;
    
    ( void )sender;
    
    return YES;
}


@end
