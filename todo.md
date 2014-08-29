#Todo Items

The items in this document outline work still to be done; the following sections outline the work-item structure. Note that "ToDo" items include bugs or new/changed features (bugs will normally be higher priority).

##Introduction

This simple "to do list" is to be used to not only track improvements or fixes to the code, but also as a placeholder for planned activities so that all developers involved are aware of what is being planned. Additions, changes, or deletions (hopefully first discussed before doing so on the latter) are welcome by any participants in the project.

The proposed priority scheme which would allow better handling of any "to do work" is as follows:

**URGENT**	this category will not exist in this project due to the fact it exists in Github.

**HIGH**	The identified work item is deemed to be high priority. If at all possible, the work item will be included in the next release of the project contents.

**MEDIUM**	the identified work is deemed to be medium priority. It will be included only if the developers in the project believe that it is important enough to spend time on (which should elevate it to HIGH priority)

**LOW**		the identified work item is deemed to be low priority. It will most likely only be included when escalated to a MEDIUM or a HIGH priority (or if the project developers involved are learning the code or just bored ;-) ).

##WORK ITEMS PLANNED TO DATE 

**TODO003**: Sort the "All Selections" drop-down so they are easier to read. (LOW)

**TODO004**: Determine/fix why "xcodebuild" man is not found when "xcode-select" is. Determine what else might be missing as well and fix that too. (MEDIUM)

**TODO005**: Determine/fix why the MacPorts "man port" is not found. (LOW)

**TODO006**: The "Print" function is truncating paragraph text on the right margin of the printed output. (HIGH)  

**TODO999**: There will be multiples of this "TODO" used to add/alter developer-oriented functionality.

##COMPLETED ITEMS TO DATE

**TODO001**: Add a print facility per accepted Apple UI conventions. (HIGH) 
	*This was already in place as of version 1.02 courtesy of the author but did not work in version 1.01 (the File > Print selection was greyed out and thus unelectable).* 
	
**TODO002**: Modify Edit > Find to hold the found selection highlighting longer than it is now (less than .5 sec or less so it seems). This will help denote the found item much better. (HIGH)  COMPLETED 2014/05/17

**TODO999**: Added Debug.h/m files to do \_\_PRETTY_FUNCTION\_\_ class/function tracing; this is quite useful in understanding how this code hangs together.  19May2014

##TEST PLAN

Presently, the test plan can be considered as very loosely planned. The currently assigned developer (Marty Turner) will test the project on Mountain Lion and Mavericks. Because It will take some time to get Snow Leopard and Lion reinstalled on his test system, it will only be tested on Mountain Lion and Mavericks for the immediate future.

The planned testing will involve manually testing the key features of the application. That is, simply navigating through each series of key user interface features and noting visually if they work as expected. There is currently no plan to create a series of documented test steps; the assumption will be that the developer or developers involved know enough about the functionality of the project to test it "reasonably" thorough. Although a good idea to formally document test procedures, it is not within the scope of the support of this project based on its current state as accessible in github.
