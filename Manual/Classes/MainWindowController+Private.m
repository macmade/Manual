/*******************************************************************************
 * Copyright (c) 2013, Jean-David Gadina - www.xs-labs.com
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
 * @file        MainWindowController+Private.m
 * @copyright   (c) 2013-2014, Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

#import "MainWindowController+Private.h"
#import "MainWindowController+NSOutlineViewDelegate.h"

@implementation MainWindowController( Private )

- ( void )didEndSheet: ( NSWindow * )sheet returnCode: ( NSInteger )returnCode contextInfo: ( void * )contextInfo
{
    ( void )sheet;
    ( void )returnCode;
    ( void )contextInfo;
    
    [ sheet orderOut: self ];
}

- ( void )sectionsMenuSelectionDidChange: ( id )sender
{
    ( void )sender;
    
    _currentSection = [ ( NSPopUpButton * )sender selectedTag ];
    
    [ _outlineView reloadData ];
    [ _outlineView selectRowIndexes: [ NSIndexSet indexSetWithIndex: 0 ] byExtendingSelection: NO ];
    [ self outlineViewSelectionDidChange: nil ];
    
    self.window.title = [ NSString stringWithFormat: @"%@ - %@", NSLocalizedString( @"WindowTitle", nil ), _sectionsMenu.selectedItem.title ];
}

- ( void )mainWindowDidResize: ( NSNotification * )notification
{
    [ self outlineViewSelectionDidChange: notification ];
}

@end
