@echo off

set CommonCompilerFlags=-MTd -nologo -fp:fast -Gm- -GR- -EHa- -Od -Oi -WX -W4 -wd4201 -wd4100 -wd4189 -wd4505 -DCOBBLER_INTERNAL=1 -DCOBBLER_SLOW=1 -DCOBBLER_WIN32=1 -FC -Z7
set CommonLinkerFlags= -incremental:no -opt:ref user32.lib gdi32.lib winmm.lib opengl32.lib

REM TODO - can we just build both with one exe?

IF NOT EXIST ..\..\build mkdir ..\..\build
pushd ..\..\build

REM 32-bit build
REM cl %CommonCompilerFlags% ..\cobbler\code\win32_cobbler.cpp /link -subsystem:windows,5.1 %CommonLinkerFlags%

REM 64-bit build
del *.pdb > NUL 2> NUL
REM Optimization switches /O2
echo WAITING FOR PDB > lock.tmp
cl %CommonCompilerFlags% ..\cobbler\code\cobbler.cpp -Fmcobbler.map -LD /link -incremental:no -opt:ref -PDB:cobbler_%random%.pdb -EXPORT:GameGetSoundSamples -EXPORT:GameUpdateAndRender
del lock.tmp
cl %CommonCompilerFlags% ..\cobbler\code\win32_cobbler.cpp -Fmwin32_cobbler.map /link %CommonLinkerFlags%
popd
