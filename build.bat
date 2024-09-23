@echo off

set CETOOLS=C:\Windows CE Tools
set CEVersion=
set CESubsystem=
set CEConfigName=
set PATH=C:\Program Files\Microsoft Visual Studio\VC98\Bin;C:\Program Files\Microsoft Visual Studio\Common\MSDev98\Bin;%windir%;

if "%1" == "hpc" goto HPC
if "%1" == "HPC" goto HPC

if "%1" == "hpcpro" goto HPCPRO
if "%1" == "HPCPRO" goto HPCPRO

if "%1" == "ppc" goto PPC
if "%1" == "PPC" goto PPC

goto END

REM *****************************************************
REM *** HPC Version 2.00 (MIPS, SH3) ***
:HPC
set PATH=%path%;%CETOOLS%\wce200\bin;
set INCLUDE=d:\myprojects\wince\include;%CETOOLS%\WCE200\MS HPC\include;%CETOOLS%\WCE200\MS HPC\mfc\include;%include%;

:HPCMIPS
set LIB=%CETOOLS%\WCE200\MS HPC\lib\mips;%lib%;
set LIB=d:\myprojects\wince\lib;%lib%;
set CFG=cfl - Win32 (WCE MIPS) Release
nmake /a /f cfl.mak CEVersion=200 CESubsystem=windowsce,2.0 CEConfigName="H/PC Ver. 2.00"
echo Done MIPS HPC Build
goto END

:HPCSH3
set LIB=%CETOOLS%\WCE200\MS HPC\lib\sh3;%lib%;
set LIB=d:\myprojects\wince\lib;%lib%;
set CFG=cfl - Win32 (WCE SH3) Release
nmake /a /f cfl.mak CEVersion=200 CESubsystem=windowsce,2.0 CEConfigName="H/PC Ver. 2.00"
echo Done SH3 HPC Build
goto END


REM *****************************************************
REM *** HPCPRO Version 2.11 (MIPS, SH3, SH4, ARM) ***
:HPCPRO
set PATH=%path%;%CETOOLS%\WCE211\bin;
set INCLUDE=d:\myprojects\wince\include;%CETOOLS%\WCE211\MS HPC Pro\include;%CETOOLS%\WCE211\MS HPC\mfc\include;%include%;

:HPCPROMIPS
set LIB=%CETOOLS%\WCE211\MS HPC Pro\lib\mips;%lib%;
set LIB=d:\myprojects\wince\lib;%lib%;
nmake /a /f cfl.mak CFG="cfl - Win32 (WCE MIPS) Release" CEVersion=211 CESubsystem=windowsce,2.0 CEConfigName="H/PC Pro 2.11"
echo Done MIPS HPCPRO Build
goto END

:HPCPROSH3
set LIB=%CETOOLS%\WCE211\MS HPC Pro\lib\sh3;%lib%;
set LIB=d:\myprojects\wince\lib;%lib%;
nmake /a /f cfl.mak CFG="cfl - Win32 (WCE SH3) Release" CEVersion=211 CESubsystem=windowsce,2.0 CEConfigName="H/PC Pro 2.11"
echo Done SH3 HPCPRO Build
goto END

:HPCSH4
set LIB=%CETOOLS%\WCE211\MS HPC\lib\sh4;%lib%;
set LIB=d:\myprojects\wince\lib;%lib%;
nmake /a /f cfl.mak CFG="cfl - Win32 (WCE SH4) Release" CEVersion=211 CESubsystem=windowsce,2.0 CEConfigName="H/PC Pro 2.11"
echo Done SH4 HPC Build
goto END

:HPCARM
set LIB=%CETOOLS%\WCE211\MS HPC\lib\arm;%lib%;
set LIB=d:\myprojects\wince\lib;%lib%;
nmake /a /f cfl.mak CFG="cfl - Win32 (WCE ARM) Release" CEVersion=211 CESubsystem=windowsce,2.0 CEConfigName="H/PC Pro 2.11"
echo Done ARM HPC Build
goto END


REM *****************************************************
REM *** PPCPRO Version 2.01 (MIPS, SH3) ***
:PPC
set CEVersion=201
set CESubsystem=windowsce,2.0
set CEConfigName=Palm-size PC 2.01
set CFG=HtmlEdit - Win32 (WCE MIPS) Release
set PATH=%path%;%CETOOLS%\wce201\bin;
set INCLUDE=d:\myprojects\wince\include;%CETOOLS%\WCE201\ms palm size pc\include;%CETOOLS%\WCE201\ms palm size pc\mfc\include;%include%;

set LIB=%CETOOLS%\WCE201\ms palm size pc\lib\mips;%lib%;
set LIB=d:\myprojects\wince\lib;%lib%;
set CFG=cfl - Win32 (WCE MIPS) Release
nmake /a /f cfl.mak CEVersion=201 CESubsystem=windowsce,2.0 CEConfigName="Palm-size PC 2.01"
echo Done MIPS PPC Build

set LIB=%CETOOLS%\WCE201\ms palm size pc\lib\sh3;%lib%;
set LIB=d:\myprojects\wince\lib;%lib%;
set CFG=cfl - Win32 (WCE SH3) Release
nmake /a /f cfl.mak CEVersion=201 CESubsystem=windowsce,2.0 CEConfigName="Palm-size PC 2.01"
echo Done SH3 PPC Build
goto END


:End
set CETOOLS=C:\Windows CE Tools
set CEVersion=
set CESubsystem=
set CEConfigName=
set include=
set lib=
set path=c:\winnt4;c:\winnt4\system32
echo Finished!