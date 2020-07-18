Manual
======

[![Build Status](https://img.shields.io/travis/macmade/Manual.svg?branch=master&style=flat)](https://travis-ci.org/macmade/Manual)
[![Issues](http://img.shields.io/github/issues/macmade/Manual.svg?style=flat)](https://github.com/macmade/Manual/issues)
![Status](https://img.shields.io/badge/status-active-brightgreen.svg?style=flat)
![License](https://img.shields.io/badge/license-bsd-brightgreen.svg?style=flat)
[![Contact](https://img.shields.io/badge/contact-@macmade-blue.svg?style=flat)](https://twitter.com/macmade)  
[![Donate-Patreon](https://img.shields.io/badge/donate-patreon-yellow.svg?style=flat)](https://patreon.com/macmade)
[![Donate-Gratipay](https://img.shields.io/badge/donate-gratipay-yellow.svg?style=flat)](https://www.gratipay.com/macmade)
[![Donate-Paypal](https://img.shields.io/badge/donate-paypal-yellow.svg?style=flat)](https://paypal.me/xslabs)

About
-----

**Manual is a GUI front-end for viewing UNIX manual pages.**

Manual automatically searches your computer for all available manuals, and displays them in a nice way, ordered by sections.

**Features**
 - Live search for specific manual pages
 - Search and highlight in manual contents
 - Printing support
 - Filtering by sections

Screenshot
----------

![Screenshot](http://www.xs-labs.com/uploads/image/misc/manual.png)

Project Status
--------------

Manual used to be available on the AppStore, but was removed when the eosgarden.com website closed.

It's now available freely on GitHub, and is maintained by [**Marty Turner**](http://www.linkedin.com/in/martyturner), who kindly proposed himself for this task.  
Thanks Martin : )

License
-------

Manual is released under the terms of the [**BSD**](http://en.wikipedia.org/wiki/BSD_licenses) license.

Repository Info
----------------

    Owner:			Jean-David Gadina - XS-Labs
    Maintainer:		Marty Turner (Twitter @mdturner)
    Web:			www.xs-labs.com
    Blog:			www.noxeos.com
    Twitter:		@macmade
    GitHub:			github.com/macmade
    LinkedIn:		ch.linkedin.com/in/macmade/
    StackOverflow:	stackoverflow.com/users/182676/macmade

Installation
------------
If you would rather just run it rather than building Manual from its source, you can double click on the Manual.pkg file in the "Installation" directory and the installation of Manual will start (default /Applications on your Mac's main HDD). 

Man Pages Missing In Manual Displays
--------------------------------------------------------

If you run into problems where Manual does not find it can find with the "man"  command prompt  command, then you will need to perform a few steps per the following paragraphs to investigate why this is so.

1. At a command prompt enter the following command to determine where the man page that you are trying to locate is and if the “whatis” database knows about it (i.e. one that that is not available via the Manual application):

    man -w man-page-name  #shows the location where the man page should exist
    whatis man-page-name   # whatis should know about it too

2. If a man page does exist using the above man or whatis command output, then the problem is most likely related to an out of date "whatis" database or an improperly set up /private/etc/man.conf file which defines to the man, whatis, and apropos commands where to look for man pages you are searching for. Also, if you use the MANPATH environment variable to locate man pages which you have set up yourself, then you may need to include the man page you are looking for with all the rest that the system man page locations in /private/etc/man.conf. Using the following “makewhatis” command, you can rebuild the "whatis" database(s) using the man page search hierarchy defined /private/etc/man.conf. (Note that makewhatis defaults to only rebuilding what you specify to it or defaults defined in /private/etc/man.conf):
    
    /usr/libexec/makewhatis -v (the “v” outputs extra info which may help)

    Example man page locations:<p>
    /usr/share/man  (system man page default location)<p>
    /opt/share/man  (used by MacPorts etc.)<p>
    /Application/xcode.app…man (some versions of Xcode have newer man pages)

3. Once you have the man page lookup hierarchy set up to your expectations using the “makewhatis” command, then you can use the following "whatis"  at a command prompt to determine if you have actually fixed the problem of a missing man page within the Manual application:

    whatis man-page-name


Missing Man Page Example
---------------------------------------
Another problem the Manual application maintainer ran in to was that the Xcode “xcodebuild” man page while accessible via “man -w xcodebuild” was not found with the “whatis’ command. Since the Manual application uses the “whatis” command to locate man page content, the xcodebuild man page output was not present in Manual.It turned out that the first few lines of the xcodebuild man page were corrupted; this could be seen in /usr/libexec/makewhatis output using the "-v" (verbose) option. The visible results were a message from makewhatis saying it encountered "junk" output. Once corrected, the xcodebuild man page could be once again be viewed via whatis (and thus, with the Manual application).

Reporting Problems or Posing Queries 
----------------------------
Should you find the need to report a problem, please provide the following minimal documentation so that your reported problem/query can be more quickly and accurately answered:

1. Provide a concise and as accurate as possible description of the problem and make sure you state what your exception is regarding what you want done or answered.

2. If reporting a problem, please provide [screen shots](http://support.apple.com/kb/ht5775) of what you see as a problem. 

3. If reporting a problem or a query regarding how you think Manual might/should behave, then please provide a copy of your /Private/etc/man.conf file.

4. If reporting problem, please provide any contents you might have regarding the $MANPATH or related MAN environment variables (see man man for details).

5. If reporting a problem regarding a specific man page  or pages, then please provide a 'man -w man-page-name' text copy of the pages in question. 

    e.g. man -w sed<p>
    /usr/share/man/man1/sed.1
    
All of this relevant information should be provided when you first open your [issue](https://github.com/macmade/Manual/issues). 

Thanks in advance for your help; the information you provide should help accelerate a satisfactory response. 

Mac OS X Systems Verification 
------------------------------------
Manual has been successfully tested on Mac OS X versions 10.6 (Snow Leopard) through 10.15 (Catalina).
