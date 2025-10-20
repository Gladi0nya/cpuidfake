            CpuID Fake version 1.01,  Aug. 08, 2010
            ---------------------------------------

Copyright (c) 2010 By Agner Fog. 
Gnu general public license http://www.gnu.org/licenses/gpl.html

This program can change the CPUID vendor string, family and model number on a
VIA Nano microprocessor. The program does not work on other processors.

The purpose is to test if any benchmark programs or other CPU-intensive programs
have different performance depending on the name of the processor.

The latest version of this program is available at
http://www.agner.org/optimize/cpuidfake.zip


System requirements:
--------------------
* Windows 2000 or later
* VIA Nano processor


Installation:
-------------
Unpack cpuidfake.zip to a new folder. 
A driver MSRDriver32.sys or MSRDriver64.sys is installed when the program is first run.


Uninstallation:
---------------
Run the program as administrator. Select U on the menu. Then restart the computer.


Instructions:
-------------
If you have 64-bit Windows Vista or Windows 7 then you have to press the F8 key
during startup and select "Disable Driver Signature Enforcement".

Run cpuidFake.exe as administrator.
When the main menu shows, enter the desired menu item. The program will show the
CPUID parameters before and after the change. If the operation was successful 
then you will see the changed CPUID parameters.

The program allows you to set the CPUID vendor string to an arbitrary 12-character 
string. The long CPUID name string can not be set arbitrarily.

To restore the original CPUID you have to restart the computer.

When you no longer want to use the CpuidFake program then it is highly recommended
that you uninstall the driver that the program has used. This is done by selecting U
on the menu. Restart the computer to restore the original CPUID parameters.


Technical explanation of the CpuidFake program:
-----------------------------------------------
This program uses a feature on the VIA Nano processor that is currently undocumented.
The vendor string can be stored in model specific registers (MSR) number 0x1206 and 0x1207.
The family and model number, etc. are stored in MSR 0x1204 bit 32-63. Bit 8 in MSR 0x1204
must be set to enable the alternative vendor string.

The MSRs are accessed through the driver MSRDriver32.sys or MSRDriver64.sys. 
This is the same driver that is used in my performance monitor test program 
(www.agner.org/optimize/testp.zip)

The source code is in cpuidFakeSource.zip. It is compiled with Microsoft Visual Studio
2008. You must turn off Unicode characters (Configuration properties -> General ->
Character set -> Not set). The code does not use precompiled headers.
The source code for the drivers is in DriverSource.zip.


Hints for use:
--------------
Programs that are made with Intel's compiler version 11 and earlier using automatic
CPU dispatching are likely to run fastest when the CPUID indicates an Intel processor
family 6. If the program runs significantly slower when the family number is different
from 6 and when the vendor string is different from "GenuineIntel" then you may suspect
that it has an unfair CPU dispatcher.

Programs that use Intel Math Kernel Library (MKL), Intel Vector Math Library (VML)
or Intel Short Vector Math Library (SVML) may likewise run faster when the vendor string
says "GenuineIntel". Different versions of the compiler and libraries may behave differently.

A difference in performance with different CPUID values does not necessarily imply that
the program is built with an Intel compiler or Intel function library.

I have provided technical details about the Intel CPU dispatchers in my C++ optimization 
manual at http://www.agner.org/optimize/#manual_cpp

The controversy is discussed in my blog at http://www.agner.org/optimize/blog/read.php?i=49


How to get a VIA Nano:
----------------------
The cheapest way to get a computer with a VIA Nano processor is to buy a VIA Mini-ITX 
board. It fits into a standard desktop cabinet. You may be able to reuse the hard disk, 
power supply, screen, keyboard and mouse from an old computer. The RAM cannot be reused
if it doesn't fit.
