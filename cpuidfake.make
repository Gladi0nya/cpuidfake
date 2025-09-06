#                       CPUIDFAKE.MAKE                      2010-01-22 Agner Fog

# Makefile for cpuidfake.zip program. See instructions.txt for details

cpuidfake.zip: cpuidFake.exe Instructions.txt MSRDriver32.sys MSRDriver64.sys \
  cpuidFakeSource.zip DriverSource.zip
  wzzip $@ $?

cpuidFakeSource.zip: cpuidFake.cpp cpuidfake.h MSRDriver.h \
  cpuidfake.make MakeCpuidFake.bat \
  cpuidFake.sln cpuidFake.vcproj cpuidFake.suo cpuidFake.vcproj.N-E24107E603DC4.A.user
  wzzip $@ $?
