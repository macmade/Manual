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
 * @file        AboutWindowController.m
 * @copyright   (c) 2013-2014, Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

// uncomment this to log the class;method in a methods in this source file
//#define LOGFUNCNAME

#import "Debug.h"
#import "MainWindowController.h"
#import "MainWindowController+Private.h"
#import "MainWindowController+NSOutlineViewDelegate.h"
#import "MainWindowController+NSOutlineViewDataSource.h"
#import "MainWindowController+SearchFieldDelegate.h"
#import "ManualHelper.h"
#import "Debug.h"

@implementation MainWindowController

@synthesize loadingWindow = _loadingWindow;
@synthesize progressBar   = _progressBar;
@synthesize outlineView   = _outlineView;
@synthesize searchField   = _searchField;
@synthesize sectionsMenu  = _sectionsMenu;
@synthesize textView      = _textView;
@synthesize label         = _label;

- ( id )init
{
    NSLOG_FUNCNAME;
    
    if( ( self = [ super initWithWindowNibName: @"MainWindow" ] ) )
    {
        _cells          = [ [ NSMutableArray arrayWithCapacity: 1000 ] retain ];
        _currentSection = -10;
    }
    
    return self;
}

- ( void )dealloc
{
    NSLOG_FUNCNAME;
    
    [ _loadingWindow    release ];
    [ _progressBar      release ];
    [ _outlineView      release ];
    [ _searchField      release ];
    [ _sectionsMenu     release ];
    [ _textView         release ];
    [ _label            release ];
    [ _cells            release ];
    [ _sections         release ];
    
    [ super dealloc ];
}

- ( void )awakeFromNib
{
    NSLOG_FUNCNAME;
    
    [ _searchField      setDelegate: self ];
    [ _label            setStringValue: @"" ];
    [ _loadingWindow    setPreventsApplicationTerminationWhenModal: NO ];
    [ _progressBar      startAnimation: nil ];
    
    [ self.window setContentBorderThickness: ( CGFloat )25 forEdge: NSMinYEdge ];
    [ ( NSNotificationCenter * )[ NSNotificationCenter defaultCenter ] addObserver: self selector: @selector( mainWindowDidResize: ) name: NSWindowDidEndLiveResizeNotification object: self.window ];
}

- ( void )showWindow: ( id )sender
{
    NSLOG_FUNCNAME;
    
    [ super showWindow: sender ];
    [ NSApp beginSheet: _loadingWindow modalForWindow: self.window modalDelegate: self didEndSelector: @selector( didEndSheet: returnCode: contextInfo: ) contextInfo: nil ];
    
    dispatch_async
    (
        dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ),
        ^
        {
            NSString * section;
            NSString * sectionKey;
            NSString * sectionDescription;
            NSInteger  i;
            
            [ [ ManualHelper sharedInstance ] getAllManualPages ];
            
            [ _sectionsMenu setTarget: self ];
            [ _sectionsMenu setAction: @selector( sectionsMenuSelectionDidChange: ) ];
            [ _sectionsMenu addItemWithTitle: NSLocalizedString( @"AllSections", nil ) ];
            [ [ _sectionsMenu itemAtIndex: 0 ] setTag: -1 ];
            [ _sectionsMenu.menu addItem: [ NSMenuItem separatorItem ] ];
            
            _sections = [ [ [ [ [ ManualHelper sharedInstance ] sections ] allKeys ] sortedArrayUsingSelector: @selector( localizedCaseInsensitiveCompare: ) ] retain ];
            
            i = 0;
            
            for( section in _sections )
            {
                sectionKey         = [ NSString stringWithFormat: @"Section-%@", section ];
                sectionDescription = NSLocalizedString( sectionKey, nil );
                
                if( [ sectionDescription isEqualToString: sectionKey ] )
                {
                    sectionDescription = NSLocalizedString( @"UnknownSection", nil );
                }
                
                [ _sectionsMenu addItemWithTitle: [ NSString stringWithFormat: @"%@ - %@ (%lu)", sectionDescription, section, [ [ [ [ ManualHelper sharedInstance ] sections ] objectForKey: section ] count ] ] ];
                [ [ _sectionsMenu itemAtIndex: i + 2 ] setTag: i ];
                
                i++;
            }
            
            self.window.title = [ NSString stringWithFormat: @"%@ - %@", NSLocalizedString( @"WindowTitle", nil ), _sectionsMenu.selectedItem.title ];
            
            [ NSThread sleepForTimeInterval: 0.5 ];
            
            [ _outlineView performSelector: @selector( setDelegate: )   onThread: [ NSThread mainThread ] withObject: self waitUntilDone: YES ];
            [ _outlineView performSelector: @selector( setDataSource: ) onThread: [ NSThread mainThread ] withObject: self waitUntilDone: YES ];
            
            [ NSApp performSelector: @selector( endSheet: ) onThread: [ NSThread mainThread ] withObject: _loadingWindow waitUntilDone: NO ];
        }
    );
}

@end
