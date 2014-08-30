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
 * @file        ManualPage.m
 * @copyright   (c) 2013-2014, Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

// uncomment this to log the class/method name in each method
//#define LOGFUNCNAME

#import "Debug.h" 
#import "ManualPage.h"

@implementation ManualPage

@synthesize section = _section;
@synthesize name    = _name;


+ ( ManualPage * )manualWithName: ( NSString * )n section: ( NSString * )s
{
    //NSLOG_FUNCNAME;
    
    ManualPage * man;
    
    man = [ [ ManualPage alloc ] initWithName: n section: s ];
    
    return [ man autorelease ];
}

- ( id )init
{
    //NSLOG_FUNCNAME;
    
    if( ( self = [ super init ] ) )
    {
        _contentsWidth = 80;
    }
    
    return self;
}

- ( id )initWithName: ( NSString * )n section: ( NSString * )s
{
    //NSLOG_FUNCNAME;
    
    if( ( self = [ self init ] ) )
    {
        _section = [ s copy ];
        _name    = [ n copy ];
    }
    
    return self;
}

- ( void )dealloc
{
    //NSLOG_FUNCNAME;
    
    [ _section  release ];
    [ _name     release ];
    [ _about    release ];
    [ _contents release ];
    
    [ super dealloc ];
}

- ( NSString * )description
{
    //NSLOG_FUNCNAME;

    return [ [ super description ] stringByAppendingFormat: @" - %@ (%@)", _name, _section ];
}

- ( NSString * )contentsForWidth: ( NSUInteger )width
{
    //NSLOG_FUNCNAME;
    
    _contentsWidth = width;
    
    return self.contents;
}

- ( NSString * )contents
{
    //NSLOG_FUNCNAME;
    
    NSTask   * t;
    NSPipe   * p;
    NSData   * d;
    NSString * s;
    
    @autoreleasepool
    {
        t = [ NSTask new ];
        p = [ NSPipe pipe ];
        
        [ t setLaunchPath: @"/bin/zsh" ];
        [ t setArguments: [ NSArray arrayWithObjects: @"-c", [ NSString stringWithFormat: @"man %@ %@ | col -b | awk '{print $0}'", _section, _name ], nil ] ];
        [ t setStandardOutput: p ];
        [ t setEnvironment: [ NSDictionary dictionaryWithObjectsAndKeys: [ NSString stringWithFormat: @"%lu", _contentsWidth ], @"MANWIDTH", nil ] ];
        
        [ t launch ];
        
        d = [ [ p fileHandleForReading ] readDataToEndOfFile ];
        
        [ t waitUntilExit ];
        
        s = [ [ NSString alloc ] initWithData: d encoding: NSUTF8StringEncoding ];
        
        [ t release ];
        
        _contents = s;
        
        return _contents;
    }
}

- ( NSString * )about
{
    NSTask   * t;
    NSPipe   * p;
    NSData   * d;
    NSString * s;
    NSArray  * lines;
    NSRange    range;
    
    @autoreleasepool
    {
        if( _about != nil )
        {
            return _about;
        }
        
        t = [ NSTask new ];
        p = [ NSPipe pipe ];
        
        [ t setLaunchPath: @"/bin/zsh" ];
        [ t setArguments: [ NSArray arrayWithObjects: @"-c", [ NSString stringWithFormat: @"whatis ^%@\\(%@\\)", _name, _section ], nil ] ];
        [ t setStandardOutput: p ];
        
        [ t launch ];
        
        d = [ [ p fileHandleForReading ] readDataToEndOfFile ];
        
        [ t waitUntilExit ];
        
        s     = [ [ NSString alloc ] initWithData: d encoding: NSUTF8StringEncoding ];
        lines = [ s componentsSeparatedByString: @"\n" ];
        
        [ s release ];
        [ t release ];
        
        s     = [ lines objectAtIndex: 0 ];
        range = [ s rangeOfString: @"- " ];
        
        @try
        {
            s = [ s substringFromIndex: range.location + 1 ];
            s = [ s stringByTrimmingCharactersInSet: [ NSCharacterSet whitespaceCharacterSet ] ];
        }
        @catch( NSException * e )
        {
            ( void )e;
            
            s = nil;
        }
        
        _about = [ s copy ];
        
        return _about;
    }
}

@end
