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
 
/* $Id$ */

#ifndef __WARNINGS_H__
#define __WARNINGS_H__

#ifndef __clang__

#error "Please consider using Clang as compiler!"

#else

#pragma clang diagnostic fatal "-Wabi"
#pragma clang diagnostic fatal "-Waddress-of-temporary"
#pragma clang diagnostic fatal "-Waddress"
#pragma clang diagnostic fatal "-Waggregate-return"
#pragma clang diagnostic fatal "-Wall"
#pragma clang diagnostic fatal "-Wambiguous-member-template"
//#pragma clang diagnostic fatal "-Warc-abi"
#pragma clang diagnostic fatal "-Warc-non-pod-memaccess"
#pragma clang diagnostic fatal "-Warc-retain-cycles"
#pragma clang diagnostic fatal "-Warc-unsafe-retained-assign"
#pragma clang diagnostic fatal "-Warc"
#pragma clang diagnostic fatal "-Watomic-properties"
#pragma clang diagnostic fatal "-Wattributes"
#pragma clang diagnostic fatal "-Wavailability"
#pragma clang diagnostic fatal "-Wbad-function-cast"
#pragma clang diagnostic fatal "-Wbind-to-temporary-copy"
#pragma clang diagnostic fatal "-Wbitwise-op-parentheses"
#pragma clang diagnostic fatal "-Wbool-conversions"
#pragma clang diagnostic fatal "-Wbuiltin-macro-redefined"
#pragma clang diagnostic fatal "-Wc++-compat"
#pragma clang diagnostic fatal "-Wc++0x-compat"
#pragma clang diagnostic fatal "-Wc++0x-extensions"
#pragma clang diagnostic fatal "-Wcast-align"
#pragma clang diagnostic fatal "-Wcast-qual"
#pragma clang diagnostic fatal "-Wchar-align"
#pragma clang diagnostic fatal "-Wchar-subscripts"
#pragma clang diagnostic fatal "-Wcomment"
#pragma clang diagnostic fatal "-Wcomments"
#pragma clang diagnostic fatal "-Wconditional-uninitialized"
#pragma clang diagnostic fatal "-Wconversion"
#pragma clang diagnostic fatal "-Wctor-dtor-privacy"
#pragma clang diagnostic fatal "-Wcustom-atomic-properties"
#pragma clang diagnostic fatal "-Wdeclaration-after-statement"
#pragma clang diagnostic fatal "-Wdelegating-ctor-cycles"
#pragma clang diagnostic fatal "-Wdelete-non-virtual-dtor"
#pragma clang diagnostic fatal "-Wdeprecated-declarations"
#pragma clang diagnostic fatal "-Wdeprecated-implementations"
#pragma clang diagnostic fatal "-Wdeprecated-writable-strings"
#pragma clang diagnostic fatal "-Wdeprecated"
#pragma clang diagnostic fatal "-Wdisabled-optimization"
#pragma clang diagnostic fatal "-Wdiscard-qual"
#pragma clang diagnostic fatal "-Wdiv-by-zero"
#pragma clang diagnostic fatal "-Wduplicate-method-arg"
#pragma clang diagnostic fatal "-Weffc++"
#pragma clang diagnostic fatal "-Wempty-body"
#pragma clang diagnostic fatal "-Wendif-labels"
#pragma clang diagnostic fatal "-Wexit-time-destructors"
#pragma clang diagnostic fatal "-Wextra-tokens"
#pragma clang diagnostic fatal "-Wextra"
#pragma clang diagnostic fatal "-Wformat-extra-args"
#pragma clang diagnostic fatal "-Wformat-nonliteral"
#pragma clang diagnostic fatal "-Wformat-zero-length"
#pragma clang diagnostic fatal "-Wformat"
#pragma clang diagnostic fatal "-Wformat=2"
#pragma clang diagnostic fatal "-Wfour-char-constants"
#pragma clang diagnostic fatal "-Wglobal-constructors"
#pragma clang diagnostic fatal "-Wgnu-designator"
#pragma clang diagnostic fatal "-Wgnu"
#pragma clang diagnostic fatal "-Wheader-hygiene"
#pragma clang diagnostic fatal "-Widiomatic-parentheses"
#pragma clang diagnostic fatal "-Wignored-qualifiers"
#pragma clang diagnostic fatal "-Wimplicit-atomic-properties"
#pragma clang diagnostic fatal "-Wimplicit-function-declaration"
#pragma clang diagnostic fatal "-Wimplicit-int"
#pragma clang diagnostic fatal "-Wimplicit"
#pragma clang diagnostic fatal "-Wimport"
#pragma clang diagnostic fatal "-Wincompatible-pointer-types"
#pragma clang diagnostic fatal "-Winit-self"
#pragma clang diagnostic fatal "-Winitializer-overrides"
#pragma clang diagnostic fatal "-Winline"
#pragma clang diagnostic fatal "-Wint-to-pointer-cast"
#pragma clang diagnostic fatal "-Winvalid-offsetof"
#pragma clang diagnostic fatal "-Winvalid-pch"
#pragma clang diagnostic fatal "-Wlarge-by-value-copy"
#pragma clang diagnostic fatal "-Wliteral-range"
#pragma clang diagnostic fatal "-Wlocal-type-template-args"
#pragma clang diagnostic fatal "-Wlogical-op-parentheses"
#pragma clang diagnostic fatal "-Wlong-long"
#pragma clang diagnostic fatal "-Wmain"
#pragma clang diagnostic fatal "-Wmicrosoft"
#pragma clang diagnostic fatal "-Wmismatched-tags"
#pragma clang diagnostic fatal "-Wmissing-braces"
#pragma clang diagnostic fatal "-Wmissing-declarations"
#pragma clang diagnostic fatal "-Wmissing-field-initializers"
#pragma clang diagnostic fatal "-Wmissing-format-attribute"
#pragma clang diagnostic fatal "-Wmissing-include-dirs"
#pragma clang diagnostic fatal "-Wmissing-noreturn"
#pragma clang diagnostic fatal "-Wmost"
#pragma clang diagnostic fatal "-Wmultichar"
#pragma clang diagnostic fatal "-Wnested-externs"
#pragma clang diagnostic fatal "-Wnewline-eof"
#pragma clang diagnostic fatal "-Wnon-gcc"
#pragma clang diagnostic fatal "-Wnon-virtual-dtor"
#pragma clang diagnostic fatal "-Wnonnull"
#pragma clang diagnostic fatal "-Wnonportable-cfstrings"
#pragma clang diagnostic fatal "-Wnull-dereference"
#pragma clang diagnostic fatal "-Wobjc-nonunified-exceptions"
#pragma clang diagnostic fatal "-Wold-style-cast"
#pragma clang diagnostic fatal "-Wold-style-definition"
#pragma clang diagnostic fatal "-Wout-of-line-declaration"
#pragma clang diagnostic fatal "-Woverflow"
#pragma clang diagnostic fatal "-Woverlength-strings"
#pragma clang diagnostic fatal "-Woverloaded-virtual"
#pragma clang diagnostic fatal "-Wpacked"
#pragma clang diagnostic fatal "-Wparentheses"
#pragma clang diagnostic fatal "-Wpointer-arith"
#pragma clang diagnostic fatal "-Wpointer-to-int-cast"
#pragma clang diagnostic fatal "-Wprotocol"
//#pragma clang diagnostic fatal "-Wreadonly-setter-attrs"
#pragma clang diagnostic fatal "-Wredundant-decls"
#pragma clang diagnostic fatal "-Wreorder"
#pragma clang diagnostic fatal "-Wreturn-type"
#pragma clang diagnostic fatal "-Wself-assign"
#pragma clang diagnostic fatal "-Wsemicolon-before-method-body"
#pragma clang diagnostic fatal "-Wsequence-point"
#pragma clang diagnostic fatal "-Wshadow"
#pragma clang diagnostic fatal "-Wshorten-64-to-32"
#pragma clang diagnostic fatal "-Wsign-compare"
#pragma clang diagnostic fatal "-Wsign-promo"
#pragma clang diagnostic fatal "-Wsizeof-array-argument"
#pragma clang diagnostic fatal "-Wstack-protector"
#pragma clang diagnostic fatal "-Wstrict-aliasing"
#pragma clang diagnostic fatal "-Wstrict-overflow"
#pragma clang diagnostic fatal "-Wstrict-prototypes"
#pragma clang diagnostic fatal "-Wstrict-selector-match"
#pragma clang diagnostic fatal "-Wsuper-class-method-mismatch"
#pragma clang diagnostic fatal "-Wswitch-default"
#pragma clang diagnostic fatal "-Wswitch-enum"
#pragma clang diagnostic fatal "-Wswitch"
#pragma clang diagnostic fatal "-Wsynth"
#pragma clang diagnostic fatal "-Wtautological-compare"
#pragma clang diagnostic fatal "-Wtrigraphs"
#pragma clang diagnostic fatal "-Wtype-limits"
#pragma clang diagnostic fatal "-Wundeclared-selector"
#pragma clang diagnostic fatal "-Wuninitialized"
#pragma clang diagnostic fatal "-Wunknown-pragmas"
#pragma clang diagnostic fatal "-Wunnamed-type-template-args"
#pragma clang diagnostic fatal "-Wunneeded-internal-declaration"
#pragma clang diagnostic fatal "-Wunneeded-member-function"
#pragma clang diagnostic fatal "-Wunused-argument"
#pragma clang diagnostic fatal "-Wunused-exception-parameter"
#pragma clang diagnostic fatal "-Wunused-function"
#pragma clang diagnostic fatal "-Wunused-label"
#pragma clang diagnostic fatal "-Wunused-member-function"
#pragma clang diagnostic fatal "-Wunused-parameter"
#pragma clang diagnostic fatal "-Wunused-value"
#pragma clang diagnostic fatal "-Wunused-variable"
#pragma clang diagnostic fatal "-Wunused"
#pragma clang diagnostic fatal "-Wused-but-marked-unused"
#pragma clang diagnostic fatal "-Wvector-conversions"
#pragma clang diagnostic fatal "-Wvla"
#pragma clang diagnostic fatal "-Wvolatile-register-var"
#pragma clang diagnostic fatal "-Wwrite-strings"

/* Not wanted: */

#pragma clang diagnostic ignored "-Wpadded"
#pragma clang diagnostic ignored "-Wselector"
#pragma clang diagnostic ignored "-Wvariadic-macros"

/*
 * Not recognized by Apple implementation:
 * 
 * #pragma clang diagnostic fatal "-Wdefault-arg-special-member"
 * #pragma clang diagnostic fatal "-Wauto-import"
 * #pragma clang diagnostic fatal "-Wbuiltin-requires-header"
 * #pragma clang diagnostic fatal "-Wc++0x-narrowing"
 * #pragma clang diagnostic fatal "-Wc++11-compat"
 * #pragma clang diagnostic fatal "-Wc++11-extensions"
 * #pragma clang diagnostic fatal "-Wc++11-narrowing"
 * #pragma clang diagnostic fatal "-Wc++98-compat-bind-to-temporary-copy"
 * #pragma clang diagnostic fatal "-Wc++98-compat-local-type-template-args"
 * #pragma clang diagnostic fatal "-Wc++98-compat-pedantic"
 * #pragma clang diagnostic fatal "-Wc++98-compat-unnamed-type-template-args"
 * #pragma clang diagnostic fatal "-Wc1x-extensions"
 * #pragma clang diagnostic fatal "-Wc99-extensions"
 * #pragma clang diagnostic fatal "-Wcatch-incomplete-type-extensions"
 * #pragma clang diagnostic fatal "-Wduplicate-method-match"
 * #pragma clang diagnostic fatal "-Wflexible-array-extensions"
 * #pragma clang diagnostic fatal "-Wmalformed-warning-check"
 * #pragma clang diagnostic fatal "-Wmissing-method-return-type"
 * #pragma clang diagnostic fatal "-Wmodule-build"
 * #pragma clang diagnostic fatal "-WNSObject-attribute"
 * #pragma clang diagnostic fatal "-Wnull-character"
 * #pragma clang diagnostic fatal "-Wobjc-missing-super-calls"
 * #pragma clang diagnostic fatal "-Wobjc-noncopy-retain-block-property"
 * #pragma clang diagnostic fatal "-Wobjc-property-implementation"
 * #pragma clang diagnostic fatal "-Wobjc-protocol-method-implementation"
 * #pragma clang diagnostic fatal "-Wobjc-readonly-with-setter-property"
 * #pragma clang diagnostic fatal "-Woverriding-method-mismatch"
 * #pragma clang diagnostic fatal "-Wsentinel"
 * #pragma clang diagnostic fatal "-Wunicode"
 * #pragma clang diagnostic fatal "-Wunused-comparison"
 * #pragma clang diagnostic fatal "-Wunused-result"
 * #pragma clang diagnostic fatal "-Wuser-defined-literals"
 */

#endif

#endif /* __WARNINGS_H__ */
