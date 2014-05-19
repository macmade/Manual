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
 * @header      MainWindowController+NSOutlineViewDelegate.h
 * @copyright   (c) 2013, Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

//
//  Debug.h
//  Manual
//
//  Created by Marty Turner on 19/05/2014.
//  Copyright (c) 2014 DigiDNA. All rights reserved.
//

//
//  There are four basic ways to use the LOGFUNCNAME/NSLOG_FUNCAME macros:
//
//  1. At the top of a source-file.  This will cause all functions in the .m file
//     to emit their function names using NSLog in the console output window.
//     Note that by default the LOGFUNCNAME macro has been defined in all
//     functions within this project.
//
//  2. Set LOGFUNCNAME just in a given function.  This can allow you to see
//     function call traffic in oft unused functions thus allowing them to be
//     traced when called.
//
//  3. Unset LOGFUNCNAME in functions that are frequently called.  This will
//     lessen the output to the console (and speed up the execution of the
//     program).
//
//  4. Set or Unset LOGFUNCNAME at the top of the source file.  This will allow
//     seeing (or not0 call to all functions in the source file.
//
//  TBD Note too that defining a DEBUG or RELEASE build in the project will
//     turn on or off respectively LOGFUNCNAME output for the entire project.
//     For performance reasons, it is best to NOT use function call logging in a
//     production (i.e.  RELASE) build.
//

#import <Foundation/Foundation.h>

@interface Debug : NSObject

#if defined (LOGFUNCNAME)
#define NSLOG_FUNCNAME NSLog(@"%s", __PRETTY_FUNCTION__)
#else
#define NSLOG_FUNCNAME
#endif

@end
