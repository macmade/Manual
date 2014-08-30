/*******************************************************************************
 * Copyright (c) 2012, Jean-David Gadina - www.xs-labs.com
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

// uncomment this to log the class/method name in each method
//#define LOGFUNCNAME

#import "Debug.h" 
#import "BackgroundView.h"

@implementation BackgroundView

- ( void )dealloc
{
    //NSLOG_FUNCNAME;
    
    [ _backgroundColor  release ];
    [ _borderColor      release ];
    
    [ super dealloc ];
}

- ( NSColor * )backgroundColor
{
    //NSLOG_FUNCNAME;
    
    @synchronized( self )
    {
        return _backgroundColor;
    }
}

- ( void )setBackgroundColor: ( NSColor * )color
{
    //NSLOG_FUNCNAME;
    
    @synchronized( self )
    {
        if( color != _backgroundColor )
        {
            [ _backgroundColor release ];
            
            _backgroundColor = [ color retain ];
            
            [ self setNeedsDisplay: YES ];
        }
    }
}

- ( NSColor * )borderColor
{
    //NSLOG_FUNCNAME;
    
    @synchronized( self )
    {
        return _borderColor;
    }
}

- ( void )setBorderColor: ( NSColor * )color
{
    //NSLOG_FUNCNAME;
    
    @synchronized( self )
    {
        if( color != _borderColor )
        {
            [ _borderColor release ];
            
            _borderColor = [ color retain ];
            
            [ self setNeedsDisplay: YES ];
        }
    }
}

- ( void )drawRect: ( NSRect )rect
{
    //NSLOG_FUNCNAME;
    
    if( _backgroundColor != nil )
    {
        [ _backgroundColor setFill ];
        
        NSRectFill( rect );
    }
    
    if( _borderColor != nil )
    {
        {
            NSBezierPath * path;
            NSGradient   * gradient;
            NSRect         subrect;
            
            subrect              = rect;
            subrect.origin.x    += 1;
            subrect.origin.y    += 1;
            subrect.size.width  -= 2;
            subrect.size.height -= 2;
            
            path = [ NSBezierPath bezierPathWithRect: rect ];
            
            [ path appendBezierPath: [ NSBezierPath bezierPathWithRect: subrect ] ];
            [ path setWindingRule: NSEvenOddWindingRule ];
            
            gradient = [ [ NSGradient alloc ] initWithColorsAndLocations: _borderColor, ( CGFloat )0, nil ];
            
            [ gradient drawInBezierPath: path angle: ( CGFloat )0 ];
            [ gradient release ];
        }
    }
    
    [ super drawRect: rect ];
}

@end
