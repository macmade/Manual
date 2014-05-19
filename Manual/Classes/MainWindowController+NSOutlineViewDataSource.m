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
 * @file        MainWindowController+NSOutlineViewDataSource.m
 * @copyright   (c) 2013-2014, Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

#import "MainWindowController+NSOutlineViewDataSource.h"
#import "ManualHelper.h"
#import "ManualPage.h"
#import "ManualCell.h"
#import "Debug.h"

@implementation MainWindowController( NSOutlineViewDataSource )

- ( NSInteger )outlineView: ( NSOutlineView * )outlineView numberOfChildrenOfItem: ( id )item
{
    NSLOG_FUNCNAME;
    
    NSMutableArray * pages;
    NSDictionary   * sections;
    NSString       * section;
    ManualPage     * page;
    NSCell         * cell;
    NSRange          range;
    
    ( void )outlineView;
    
    [ _cells removeAllObjects ];
    
    if( item != nil )
    {
        return 0;
    }
    
    sections = [ [ ManualHelper sharedInstance ] sections ];
    
    if( _sectionsMenu.selectedTag == -1 )
    {
        pages = [ NSMutableArray arrayWithCapacity: 1000 ];
        
        for( section in sections )
        {
            [ pages addObjectsFromArray: [ sections objectForKey: section ] ];
            
            if( _currentSection != -1 )
            {
                [ pages sortUsingComparator: ^( id obj1, id obj2 )
                    {
                        ManualPage * p1;
                        ManualPage * p2;
                        
                        p1 = ( ManualPage * )obj1;
                        p2 = ( ManualPage * )obj2;
                        
                        return [ p1.name caseInsensitiveCompare: p2.name ];
                    }
                ];
            }
        }
    }
    else
    {
        pages = [ sections objectForKey: [ _sections objectAtIndex: ( NSUInteger )( _sectionsMenu.selectedTag ) ] ];
    }
    
    for( page in pages )
    {
        if( _searchField.stringValue.length > 0 )
        {
            range = [ page.name rangeOfString: _searchField.stringValue options: NSCaseInsensitiveSearch ];
            
            if( range.length == 0 )
            {
                continue;
            }
        }
        
        cell                   = [ ManualCell new ];
        cell.representedObject = page;
        
        [ _cells addObject: cell ];
        [ cell release ];
    }
    
    return ( NSInteger )[ _cells count ];
}

- ( BOOL )outlineView: ( NSOutlineView * )outlineView isItemExpandable: ( id )item
{
    NSLOG_FUNCNAME;
    
    ( void )outlineView;
    ( void )item;
    
    return NO;
}

- ( id )outlineView: ( NSOutlineView * )outlineView child: ( NSInteger )index ofItem: ( id )item
{
    NSLOG_FUNCNAME;
    
    ( void )outlineView;
    ( void )item;
    
    if( item != nil )
    {
        return nil;
    }
    
    return [ _cells objectAtIndex: ( NSUInteger )index ];
}

- ( id )outlineView: ( NSOutlineView * )outlineView objectValueForTableColumn: ( NSTableColumn * )tableColumn byItem: ( id )item
{
    NSLOG_FUNCNAME;
    
    NSCell     * cell;
    ManualPage * page;
    
    ( void )outlineView;
    ( void )tableColumn;
    
    cell = ( NSCell * )item;
    page = ( ManualPage * )cell.representedObject;
    
    if( [ _sectionsMenu selectedTag ] == -1 )
    {
        return [ NSString stringWithFormat: @"%@ (%@)", page.name, page.section ];
    }
    
    return page.name;
}

@end
