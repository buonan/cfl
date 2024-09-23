# Microsoft Developer Studio Project File - Name="cfl" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (WCE x86) Static Library" 0x8304
# TARGTYPE "Win32 (WCE SH4) Static Library" 0x8604
# TARGTYPE "Win32 (WCE MIPS) Static Library" 0x8204
# TARGTYPE "Win32 (WCE x86em) Static Library" 0x7f04
# TARGTYPE "Win32 (WCE MIPSFP) Static Library" 0x8704
# TARGTYPE "Win32 (WCE ARM) Static Library" 0x8504
# TARGTYPE "Win32 (WCE SH3) Static Library" 0x8104
# TARGTYPE "Win32 (WCE PPC) Static Library" 0x8404

CFG=cfl - Win32 (WCE MIPS) Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "cfl.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "cfl.mak" CFG="cfl - Win32 (WCE MIPS) Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "cfl - Win32 (WCE MIPS) Release" (based on "Win32 (WCE MIPS) Static Library")
!MESSAGE "cfl - Win32 (WCE MIPS) Debug" (based on "Win32 (WCE MIPS) Static Library")
!MESSAGE "cfl - Win32 (WCE SH4) Release" (based on "Win32 (WCE SH4) Static Library")
!MESSAGE "cfl - Win32 (WCE SH4) Debug" (based on "Win32 (WCE SH4) Static Library")
!MESSAGE "cfl - Win32 (WCE SH3) Release" (based on "Win32 (WCE SH3) Static Library")
!MESSAGE "cfl - Win32 (WCE SH3) Debug" (based on "Win32 (WCE SH3) Static Library")
!MESSAGE "cfl - Win32 (WCE ARM) Release" (based on "Win32 (WCE ARM) Static Library")
!MESSAGE "cfl - Win32 (WCE ARM) Debug" (based on "Win32 (WCE ARM) Static Library")
!MESSAGE "cfl - Win32 (WCE MIPSFP) Release" (based on "Win32 (WCE MIPSFP) Static Library")
!MESSAGE "cfl - Win32 (WCE MIPSFP) Debug" (based on "Win32 (WCE MIPSFP) Static Library")
!MESSAGE "cfl - Win32 (WCE x86) Release" (based on "Win32 (WCE x86) Static Library")
!MESSAGE "cfl - Win32 (WCE x86) Debug" (based on "Win32 (WCE x86) Static Library")
!MESSAGE "cfl - Win32 (WCE x86em) Release" (based on "Win32 (WCE x86em) Static Library")
!MESSAGE "cfl - Win32 (WCE x86em) Debug" (based on "Win32 (WCE x86em) Static Library")
!MESSAGE "cfl - Win32 (WCE PPC) Release" (based on "Win32 (WCE PPC) Static Library")
!MESSAGE "cfl - Win32 (WCE PPC) Debug" (based on "Win32 (WCE PPC) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/Cfl", BAAAAAAA"
# PROP Scc_LocalPath "H/PC Pro 2.11"
# PROP WCE_FormatVersion "6.0"

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WMIPSRel"
# PROP BASE Intermediate_Dir "WMIPSRel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WMIPSRel"
# PROP Intermediate_Dir "WMIPSRel"
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /M$(CECrt) /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /QMRWCE /c
# ADD CPP /nologo /M$(CECrt) /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /QMRWCE /QMOC /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WMIPSRel\cflmips.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WMIPSDbg"
# PROP BASE Intermediate_Dir "WMIPSDbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WMIPSDbg"
# PROP Intermediate_Dir "WMIPSDbg"
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /M$(CECrtDebug) /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /QMRWCE /c
# ADD CPP /nologo /M$(CECrtDebug) /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /QMRWCE /QMOC /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WMIPSDbg\cflmipsd.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCESH4Rel"
# PROP BASE Intermediate_Dir "WCESH4Rel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WCESH4Rel"
# PROP Intermediate_Dir "WCESH4Rel"
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /Qsh4 /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
# ADD CPP /nologo /Qsh4 /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WCESH4Rel\cflsh4.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WCESH4Dbg"
# PROP BASE Intermediate_Dir "WCESH4Dbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WCESH4Dbg"
# PROP Intermediate_Dir "WCESH4Dbg"
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /Qsh4 /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
# ADD CPP /nologo /Qsh4 /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WCESH4Dbg\cflsh4d.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCESH3Rel"
# PROP BASE Intermediate_Dir "WCESH3Rel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WCESH3Rel"
# PROP Intermediate_Dir "WCESH3Rel"
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /M$(CECrt) /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
# ADD CPP /nologo /M$(CECrt) /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WCESH3Rel\cflsh3.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WCESH3Dbg"
# PROP BASE Intermediate_Dir "WCESH3Dbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WCESH3Dbg"
# PROP Intermediate_Dir "WCESH3Dbg"
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /M$(CECrtDebug) /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
# ADD CPP /nologo /M$(CECrtDebug) /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WCESH3Dbg\cflsh3d.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCEARMRel"
# PROP BASE Intermediate_Dir "WCEARMRel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WCEARMRel"
# PROP Intermediate_Dir "WCEARMRel"
# PROP Target_Dir ""
CPP=clarm.exe
# ADD BASE CPP /nologo /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
# ADD CPP /nologo /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WCEARMRel\cflarm.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WCEARMDbg"
# PROP BASE Intermediate_Dir "WCEARMDbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WCEARMDbg"
# PROP Intermediate_Dir "WCEARMDbg"
# PROP Target_Dir ""
CPP=clarm.exe
# ADD BASE CPP /nologo /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
# ADD CPP /nologo /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WCEARMDbg\cflarmd.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WMIPSFPRel"
# PROP BASE Intermediate_Dir "WMIPSFPRel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WMIPSFPRel"
# PROP Intermediate_Dir "WMIPSFPRel"
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /QMFWCE /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
# ADD CPP /nologo /QMFWCE /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WMIPSFPRel\cflmipsfp.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WMIPSFPDbg"
# PROP BASE Intermediate_Dir "WMIPSFPDbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WMIPSFPDbg"
# PROP Intermediate_Dir "WMIPSFPDbg"
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /QMFWCE /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
# ADD CPP /nologo /QMFWCE /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WMIPSFPDbg\cflmipsfpd.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCEX86Rel"
# PROP BASE Intermediate_Dir "WCEX86Rel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WCEX86Rel"
# PROP Intermediate_Dir "WCEX86Rel"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /ML /W3 /O2 /D "x86" /D "_i386_" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "NDEBUG" /D "_MBCS" /D "_LIB" /Gs8192 /GF /c
# ADD CPP /nologo /ML /W3 /O2 /D "x86" /D "_i386_" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "NDEBUG" /D "_MBCS" /D "_LIB" /Gs8192 /GF /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WCEX86Rel\cflx86.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WCEX86Dbg"
# PROP BASE Intermediate_Dir "WCEX86Dbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WCEX86Dbg"
# PROP Intermediate_Dir "WCEX86Dbg"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MLd /W3 /Zi /Od /D "x86" /D "_i386_" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "DEBUG" /D "_MBCS" /D "_LIB" /Gs8192 /GF /c
# ADD CPP /nologo /MLd /W3 /Zi /Od /D "x86" /D "_i386_" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "DEBUG" /D "_MBCS" /D "_LIB" /Gs8192 /GF /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WCEX86Dbg\cflx86d.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "x86emRel"
# PROP BASE Intermediate_Dir "x86emRel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "x86emRel"
# PROP Intermediate_Dir "x86emRel"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /ML /W3 /O2 /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "_LIB" /YX /c
# ADD CPP /nologo /ML /W3 /O2 /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "_LIB" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"x86emRel\cflem.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "x86emDbg"
# PROP BASE Intermediate_Dir "x86emDbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "x86emDbg"
# PROP Intermediate_Dir "x86emDbg"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MLd /W3 /Z7 /Od /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "_LIB" /YX /c
# ADD CPP /nologo /MLd /W3 /Zi /Od /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "_LIB" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"x86emDbg\cflemd.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCEPPCRel"
# PROP BASE Intermediate_Dir "WCEPPCRel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WCEPPCRel"
# PROP Intermediate_Dir "WCEPPCRel"
# PROP Target_Dir ""
CPP=clppc.exe
# ADD BASE CPP /nologo /M$(CECrt) /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "PPC" /D "_PPC_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
# ADD CPP /nologo /M$(CECrt) /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "PPC" /D "_PPC_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WCEPPCRel\cflppc.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WCEPPCDbg"
# PROP BASE Intermediate_Dir "WCEPPCDbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WCEPPCDbg"
# PROP Intermediate_Dir "WCEPPCDbg"
# PROP Target_Dir ""
CPP=clppc.exe
# ADD BASE CPP /nologo /M$(CECrtDebug) /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "PPC" /D "_PPC_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
# ADD CPP /nologo /M$(CECrtDebug) /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "PPC" /D "_PPC_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"WCEPPCDbg\cflppcd.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copylibs.bat
# End Special Build Tool

!ENDIF 

# Begin Target

# Name "cfl - Win32 (WCE MIPS) Release"
# Name "cfl - Win32 (WCE MIPS) Debug"
# Name "cfl - Win32 (WCE SH4) Release"
# Name "cfl - Win32 (WCE SH4) Debug"
# Name "cfl - Win32 (WCE SH3) Release"
# Name "cfl - Win32 (WCE SH3) Debug"
# Name "cfl - Win32 (WCE ARM) Release"
# Name "cfl - Win32 (WCE ARM) Debug"
# Name "cfl - Win32 (WCE MIPSFP) Release"
# Name "cfl - Win32 (WCE MIPSFP) Debug"
# Name "cfl - Win32 (WCE x86) Release"
# Name "cfl - Win32 (WCE x86) Debug"
# Name "cfl - Win32 (WCE x86em) Release"
# Name "cfl - Win32 (WCE x86em) Debug"
# Name "cfl - Win32 (WCE PPC) Release"
# Name "cfl - Win32 (WCE PPC) Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\CeApp.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEAPP=\
	".\otify.h"\
	".\ygshell.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEAPP=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEAPP=\
	".\otify.h"\
	".\ygshell.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEAPP=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEAPP=\
	".\otify.h"\
	".\ygshell.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"aygshell.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

DEP_CPP_CEAPP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CeImpl.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEIMP=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEIMP=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEIMP=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEIMP=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEIMP=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

DEP_CPP_CEIMP=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CeMain.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEMAI=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEMAI=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEMAI=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEMAI=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEMAI=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

DEP_CPP_CEMAI=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CePlex.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEPLE=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEPLE=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEPLE=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEPLE=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEPLE=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

DEP_CPP_CEPLE=\
	".\CePlex.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CeReg.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEREG=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEREG=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEREG=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEREG=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEREG=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

DEP_CPP_CEREG=\
	".\CeReg.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CeSocket.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	
NODEP_CPP_CESOC=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	
NODEP_CPP_CESOC=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	
NODEP_CPP_CESOC=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	
NODEP_CPP_CESOC=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	
NODEP_CPP_CESOC=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

DEP_CPP_CESOC=\
	".\CeSocket.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CeStr.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	
NODEP_CPP_CESTR=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	
NODEP_CPP_CESTR=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	
NODEP_CPP_CESTR=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	
NODEP_CPP_CESTR=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	
NODEP_CPP_CESTR=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

DEP_CPP_CESTR=\
	".\CeStr.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CeUte.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEUTE=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEUTE=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEUTE=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEUTE=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEUTE=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

DEP_CPP_CEUTE=\
	".\CeSocket.h"\
	".\CeStr.h"\
	".\CeUte.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CeWin.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEWIN=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEWIN=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEWIN=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEWIN=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEWIN=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

DEP_CPP_CEWIN=\
	".\CeApp.h"\
	".\CePlex.h"\
	".\CeWin.h"\
	".\cflmacro.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CeXml.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEXML=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEXML=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEXML=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEXML=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
NODEP_CPP_CEXML=\
	".\otify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

DEP_CPP_CEXML=\
	".\CeStr.h"\
	".\CeXml.h"\
	".\stdafx.h"\
	
# ADD CPP /Yu"stdafx.h"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Cfl.rc
# End Source File
# Begin Source File

SOURCE=.\stdafx.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	
NODEP_CPP_STDAF=\
	".\otify.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	
NODEP_CPP_STDAF=\
	".\otify.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	
NODEP_CPP_STDAF=\
	".\otify.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	
NODEP_CPP_STDAF=\
	".\otify.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	
# ADD BASE CPP /QMFWCE
# ADD CPP /QMFWCE /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	
NODEP_CPP_STDAF=\
	".\otify.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	{$(INCLUDE)}"notify.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	
# ADD CPP /Yc"stdafx.h"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

DEP_CPP_STDAF=\
	".\stdafx.h"\
	
# ADD CPP /Yc"stdafx.h"

!ENDIF 

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\CeApp.h
# End Source File
# Begin Source File

SOURCE=.\CeComm.h
# End Source File
# Begin Source File

SOURCE=.\CePlex.h
# End Source File
# Begin Source File

SOURCE=.\CeReg.h
# End Source File
# Begin Source File

SOURCE=.\CeSocket.h
# End Source File
# Begin Source File

SOURCE=.\CeSort.h
# End Source File
# Begin Source File

SOURCE=.\CeStr.h
# End Source File
# Begin Source File

SOURCE=.\CeUte.h
# End Source File
# Begin Source File

SOURCE=.\CeWin.h
# End Source File
# Begin Source File

SOURCE=.\CeXml.h
# End Source File
# Begin Source File

SOURCE=.\Cfl.h
# End Source File
# Begin Source File

SOURCE=.\cflmacro.h
# End Source File
# Begin Source File

SOURCE=.\cflres.h
# End Source File
# Begin Source File

SOURCE=.\resource.h
# End Source File
# Begin Source File

SOURCE=.\stdafx.h
# End Source File
# End Group
# End Target
# End Project
