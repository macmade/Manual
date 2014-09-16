#Todo Items 

The items in this document outline work still to be done (bugs or enhancements); the following sections outline the work-item structure. Note that "ToDo" items include bugs or new/changed features (bugs will normally be higher priority).

**Note** that as of 2014/09/01 a Bugzilla database has been created and will be maintained by Marty Turner on one of his local systems; from here on, BZ numbers will be included in work items. 

##Introduction

This simple "to do list" is to be used to not only track improvements or fixes to the code, but also as a placeholder for planned activities so that all developers involved are aware of what is being planned. Additions, changes, or deletions (hopefully first discussed before doing so on the latter) are welcome by any participants in the project.

The proposed priority scheme which would allow better handling of any "to do work" is as follows:

**URGENT**	this category will not exist in this project due to the fact it exists in Github.

**HIGH**	The identified work item is deemed to be high priority. If at all possible, the work item will be included in the next release of the project contents.

**MEDIUM**	the identified work is deemed to be medium priority. It will be included only if the developers in the project believe that it is important enough to spend time on (which should elevate it to HIGH priority)

**LOW**		the identified work item is deemed to be low priority. It will most likely only be included when escalated to a MEDIUM or a HIGH priority (or if the project developers involved are learning the code or just bored ;-) ).

##Open Work Items 

**TODO003**: Sort the "All Selections" drop-down so they are easier to read. (LOW)

**TODO004**: Determine/fix why "xcodebuild" man is not found when "xcode-select" is. Determine what else might be missing as well and fix that too. (MEDIUM)

**TODO005**: Determine/fix why the MacPorts "man port" is not found. (LOW)

##Completed Work Items

**TODO001**: Add a print facility per accepted Apple UI conventions. (HIGH) 
*This was already in place as of version 1.02 courtesy of the author but did not work in version 1.01 (the File > Print selection was greyed out and thus unelectable).* *Fixed in 1.0.2*.
	
**TODO002**: Modify Edit > Find to hold the found selection highlighting longer than it is now (less than .5 sec or less so it seems). This will help denote the found item much better. (HIGH)  COMPLETED 2014/05/17 *Fixed in 1.0.3*.

**TODO006**: The "Print" function is truncating paragraph text on the right margin of the printed output. **NOTE** that setting **MANWIDTH** other than its default is **NOT** a soliton to this problem as that causes print formatting problems.) (HIGH)  COMPLETED 20140830  *Fixed in 1.0.4*.

**TODO007** Print very narrow only on some displayed man pages after fix for
TODO006 (Bugzilla 9). While most man page text output continued to 
print correctly after TODO006, some (such as a2p/a2x), were printed out as
a very long/narrow column (small font) which was almost unreadable. (HIGH) COMPLETED 20140915 Bugzilla 9 "Fixed in 1.0.5"

##Test Plan

Presently, the test plan can be considered as very loosely planned. The currently assigned developer (Marty Turner) has tested each version release of this project on Snow Leopard (10.6), Lion (10.7), Mountain Lion (10.8), Mavericks (10.9) and Yosemite (10.10). As subsequent Mac OS X versions are released by Apple, they will be added to this list.

###Testing Scope
The planned testing involves manually testing and observation of key features of the Manual application. That is, simply navigating through each series of key user interface features and noting visually if they work as expected. There is currently no plan to create a series of documented test steps; the assumption will be that the developer or developers involved know enough about the functionality of the project to test it in a "reasonably" thorough manner. Although it is a good idea to formally document test procedures, it is not within the scope of the support of this project based on its current state as accessible in Github. 

**Note** that as of 2014/09/01 all bugs, features, and issues related to the project will be documented in a Bugzilla database; some means of making it available here will be performed as time permits (else, contact the developer). 
