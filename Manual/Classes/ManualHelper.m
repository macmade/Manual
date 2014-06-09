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
 * @file        ManualHelper.m
 * @copyright   (c) 2013-2014, Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

// uncomment this to log the class/method name in each method
//#define LOGFUNCNAME

#import "Debug.h" 
#import "ManualHelper.h"
#import "ManualPage.h"

static ManualHelper * __sharedInstance = nil;

@implementation ManualHelper

@synthesize sections = _sections;

+ ( ManualHelper * )sharedInstance
{
    NSLOG_FUNCNAME;
    
    @synchronized( self )
    {
        if( __sharedInstance == nil )
        {
            __sharedInstance = [ [ super allocWithZone: NULL ] init ];
        }
    }
    
    return __sharedInstance;
}

+ ( id )allocWithZone:( NSZone * )zone
{
    NSLOG_FUNCNAME;
    
    ( void )zone;
    
    @synchronized( self )
    {
        return [ [ self sharedInstance ] retain ];
    }
}

- ( id )copyWithZone:( NSZone * )zone
{
    NSLOG_FUNCNAME;
    
    ( void )zone;
    
    return self;
}

- ( id )retain
{
    NSLOG_FUNCNAME;
    
    return self;
}

- ( NSUInteger )retainCount
{
    NSLOG_FUNCNAME;
    
    return UINT_MAX;
}

- ( oneway void )release
{ NSLOG_FUNCNAME; }

- ( id )autorelease
{
    NSLOG_FUNCNAME;
    
    return self;
}

- ( id )init
{
    NSLOG_FUNCNAME;
    
    if( ( self = [ super init ] ) )
    {
        _sections = [ [ NSMutableDictionary dictionaryWithCapacity: 25 ] retain ];
    }
    
    return self;
}

- ( void )dealloc
{
    NSLOG_FUNCNAME;
    
    [ _sections release ];
    
    [ super dealloc ];
}

- ( void )getAllManualPages
{
    NSLOG_FUNCNAME;
    
    NSTask              * task;
    NSPipe              * p;
    NSData              * data;
    NSString            * str;
    NSArray             * lines;
    NSString            * line;
    NSString            * man;
    NSString            * section;
    ManualPage          * manual;
    NSRange               range;
    
    @autoreleasepool
    {
        task = [ NSTask new ];
        p    = [ NSPipe pipe ];
        
        [ task setLaunchPath: @"/bin/zsh" ];
        [ task setArguments: [ NSArray arrayWithObjects: @"-cl", @"apropos . | awk '{print $1}'", nil ] ];
        [ task setStandardOutput: p ];
        
        [ task launch ];
        
        data = [ [ p fileHandleForReading ] readDataToEndOfFile ];
        
        [ task waitUntilExit ];
        
        str   = [ [ NSString alloc ] initWithData: data encoding: NSUTF8StringEncoding ];
        lines = [ str componentsSeparatedByString: @"\n" ];
        lines = [ lines sortedArrayUsingSelector: @selector( localizedCaseInsensitiveCompare: ) ];
        
        for( line in lines )
        {
            if( [ line length ] == 0 )
            {
                continue;
            }
            
            range = [ line rangeOfString: @"(" options: NSBackwardsSearch ];
            
            @try
            {
                man     = [ line substringToIndex: range.location ];
                section = [ line substringFromIndex: range.location + 1 ];
                range   = [ section rangeOfString: @")" ];
                section = [ section substringToIndex: range.location ];
            }
            @catch( NSException * e )
            {
                ( void )e;
                
                continue;
            }
            
            if( [ _sections objectForKey: section ] == nil )
            {
                [ _sections setObject: [ NSMutableArray arrayWithCapacity: 100 ] forKey: section ];
            }
            
            manual = [ ManualPage manualWithName: man section: section ];
            
            [ [ _sections objectForKey: section ] addObject: manual ];
        }
    }
}

@end
