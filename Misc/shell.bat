@echo off

REM
REM  To run this at startup, use this as your shortcut target:
REM  %windir%\system32\cmd.exe /k C:\Users\david\Desktop\stoof\cobbler\cobbler\misc\shell.bat
REM

call "E:\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x64
set path=C:\Users\david\Desktop\stoof\cobbler\cobbler\misc;%path%
set _NO_DEBUG_HEAP=1
