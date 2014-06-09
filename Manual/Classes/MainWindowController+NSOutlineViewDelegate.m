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
 * @file        MainWindowController+NSOutlineViewDelegate.m
 * @copyright   (c) 2013-2014, Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

// uncomment this to log the class/method name in each method
//#define LOGFUNCNAME

#import "Debug.h" 
#import "MainWindowController+NSOutlineViewDelegate.h"
#import "ManualPage.h"

@implementation MainWindowController( NSOutlineViewDelegate )

- ( void )outlineViewSelectionDidChange: ( NSNotification * )notification
{
    NSLOG_FUNCNAME;
    
    NSCell                    * cell;
    ManualPage                * page;
    NSString                  * contents;
    NSMutableArray            * lines;
    NSString                  * line;
    NSMutableAttributedString * attributedLine;
    NSMutableAttributedString * attributedContents;
    
    ( void )notification;
    
    if( [ _cells count ] == 0 )
    {
        return;
    }
    
    cell               = [ _cells objectAtIndex: ( NSUInteger )[ _outlineView selectedRow ] ];
    page               = ( ManualPage * )cell.representedObject;
    contents           = [ page contentsForWidth: ( NSUInteger )( _textView.frame.size.width / 6 ) ];
    lines              = [ [ contents componentsSeparatedByString: @"\n" ] mutableCopy ];
    attributedContents = [ [ NSMutableAttributedString alloc ] init ];
    
    [ _label setStringValue: [ NSString stringWithFormat: @"%@ (%@) - %@", page.name, page.section, page.about ] ];
    
    for( line in lines )
    {
        attributedLine = [ [ NSMutableAttributedString alloc ] initWithString: [ line stringByAppendingString: @"\n" ] ];
        
        if( [ line length ] > 0 && ( [ line characterAtIndex: 0 ] == 9 || [ line characterAtIndex: 0 ] == 32 ) )
        {
            [ attributedLine removeAttribute: NSFontAttributeName range: NSMakeRange( 0, [ attributedLine length ] ) ];
            [ attributedLine addAttribute: NSFontAttributeName value: [ NSFont fontWithName: @"Menlo" size: ( CGFloat )10 ] range: NSMakeRange( 0, [ attributedLine length ] ) ];
        }
        else
        {
            [ attributedLine removeAttribute: NSFontAttributeName range: NSMakeRange( 0, [ attributedLine length ] ) ];
            [ attributedLine addAttribute: NSFontAttributeName value: [ NSFont boldSystemFontOfSize: ( CGFloat )12 ] range: NSMakeRange( 0, [ attributedLine length ] ) ];
        }
        
        [ attributedContents insertAttributedString: attributedLine atIndex: [ attributedContents length ] ];
        [ attributedLine release ];
    }
    
    [ _textView.textStorage setAttributedString: attributedContents ];
    
    // Make sure the highlight stays even though we have set incremental searching in the xib
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:_textView.selectedTextAttributes];
    [dict setObject:[NSColor blackColor] forKey:@"NSColor"];
    [dict setObject:[NSColor yellowColor] forKey:@"NSBackgroundColor"];
    _textView.selectedTextAttributes = dict;

    
    [ lines release ];
    [ attributedContents release ];
    
    if( _outlineViewShouldNotBecomeFirstResponder == NO )
    {
        [ _outlineView becomeFirstResponder ];
        [ self.window makeFirstResponder: _outlineView ];
    }
}

@end
