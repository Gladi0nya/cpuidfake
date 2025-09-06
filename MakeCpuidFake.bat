path C:\Program Files\Microsoft Visual Studio 9.0\VC\bin;%path%
nmake /R /FcpuidFake.make
if errorlevel 1 pause

