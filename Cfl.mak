# Microsoft Developer Studio Generated NMAKE File, Based on cfl.dsp
!IF "$(CFG)" == ""
CFG=cfl - Win32 (WCE MIPS) Debug
!MESSAGE No configuration specified. Defaulting to cfl - Win32 (WCE MIPS) Debug.
!ENDIF 

!IF "$(CESubsystem)" == ""
CESubsystem=windowsce,2.0
!MESSAGE Variable CESubsystem not specified. Defaulting to windowsce,2.0
!ENDIF 

!IF "$(CEVersion)" == ""
CEVersion=200
!MESSAGE Variable CEVersion not specified. Defaulting to 200
!ENDIF 

!IF "$(CEConfigName)" == ""
CEConfigName=H/PC Ver. 2.00
!MESSAGE Variable CEConfigName not specified.  Defaulting to H/PC Ver. 2.00
!ENDIF 

!IF $(CEVersion) < 201
CECrt=L
CECrtDebug=Ld
CECrtMT=T
CECrtMTDebug=Td
CENoDefaultLib=corelibc.lib
CEx86Corelibc= 
!ELSE 
CECrt=C
CECrtDebug=C
CECrtMT=C
CECrtMTDebug=C
CENoDefaultLib=libc.lib /nodefaultlib:libcd.lib /nodefaultlib:libcmt.lib /nodefaultlib:libcmtd.lib /nodefaultlib:msvcrt.lib /nodefaultlib:msvcrtd.lib
CEx86Corelibc=corelibc.lib
!ENDIF 

!IF "$(CFG)" != "cfl - Win32 (WCE MIPS) Release" && "$(CFG)" != "cfl - Win32 (WCE MIPS) Debug" && "$(CFG)" != "cfl - Win32 (WCE SH4) Release" && "$(CFG)" != "cfl - Win32 (WCE SH4) Debug" && "$(CFG)" != "cfl - Win32 (WCE SH3) Release" && "$(CFG)" != "cfl - Win32 (WCE SH3) Debug" && "$(CFG)" != "cfl - Win32 (WCE ARM) Release" && "$(CFG)" != "cfl - Win32 (WCE ARM) Debug" && "$(CFG)" != "cfl - Win32 (WCE MIPSFP) Release" && "$(CFG)" != "cfl - Win32 (WCE MIPSFP) Debug" && "$(CFG)" != "cfl - Win32 (WCE x86) Release" && "$(CFG)" != "cfl - Win32 (WCE x86) Debug" && "$(CFG)" != "cfl - Win32 (WCE x86em) Release" && "$(CFG)" != "cfl - Win32 (WCE x86em) Debug" && "$(CFG)" != "cfl - Win32 (WCE PPC) Release" && "$(CFG)" != "cfl - Win32 (WCE PPC) Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
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
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"

OUTDIR=.\WMIPSRel
INTDIR=.\WMIPSRel
# Begin Custom Macros
OutDir=.\WMIPSRel
# End Custom Macros

ALL : "$(OUTDIR)\cflmips.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(OUTDIR)\cflmips.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrt) /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /QMRWCE /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflmips.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflmips.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WMIPSRel
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflmips.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"

OUTDIR=.\WMIPSDbg
INTDIR=.\WMIPSDbg
# Begin Custom Macros
OutDir=.\WMIPSDbg
# End Custom Macros

ALL : "$(OUTDIR)\cflmipsd.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\cflmipsd.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /M$(CECrtDebug) /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /QMRWCE /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflmipsd.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflmipsd.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WMIPSDbg
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflmipsd.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"

OUTDIR=.\WCESH4Rel
INTDIR=.\WCESH4Rel
# Begin Custom Macros
OutDir=.\WCESH4Rel
# End Custom Macros

ALL : "$(OUTDIR)\cflsh4.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(OUTDIR)\cflsh4.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflsh4.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflsh4.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WCESH4Rel
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflsh4.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"

OUTDIR=.\WCESH4Dbg
INTDIR=.\WCESH4Dbg
# Begin Custom Macros
OutDir=.\WCESH4Dbg
# End Custom Macros

ALL : "$(OUTDIR)\cflsh4d.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\cflsh4d.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /Qsh4 /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflsh4d.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflsh4d.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WCESH4Dbg
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflsh4d.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"

OUTDIR=.\WCESH3Rel
INTDIR=.\WCESH3Rel
# Begin Custom Macros
OutDir=.\WCESH3Rel
# End Custom Macros

ALL : "$(OUTDIR)\cflsh3.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(OUTDIR)\cflsh3.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrt) /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflsh3.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflsh3.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WCESH3Rel
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflsh3.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"

OUTDIR=.\WCESH3Dbg
INTDIR=.\WCESH3Dbg
# Begin Custom Macros
OutDir=.\WCESH3Dbg
# End Custom Macros

ALL : "$(OUTDIR)\cflsh3d.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\cflsh3d.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /M$(CECrtDebug) /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflsh3d.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflsh3d.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WCESH3Dbg
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflsh3d.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"

OUTDIR=.\WCEARMRel
INTDIR=.\WCEARMRel
# Begin Custom Macros
OutDir=.\WCEARMRel
# End Custom Macros

ALL : "$(OUTDIR)\cflarm.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(OUTDIR)\cflarm.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflarm.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflarm.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WCEARMRel
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflarm.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"

OUTDIR=.\WCEARMDbg
INTDIR=.\WCEARMDbg
# Begin Custom Macros
OutDir=.\WCEARMDbg
# End Custom Macros

ALL : "$(OUTDIR)\cflarmd.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\cflarmd.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=clarm.exe
CPP_PROJ=/nologo /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "ARM" /D "_ARM_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflarmd.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflarmd.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WCEARMDbg
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflarmd.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"

OUTDIR=.\WMIPSFPRel
INTDIR=.\WMIPSFPRel
# Begin Custom Macros
OutDir=.\WMIPSFPRel
# End Custom Macros

ALL : "$(OUTDIR)\cflmipsfp.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(OUTDIR)\cflmipsfp.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /QMFWCE /MC /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflmipsfp.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflmipsfp.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WMIPSFPRel
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflmipsfp.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"

OUTDIR=.\WMIPSFPDbg
INTDIR=.\WMIPSFPDbg
# Begin Custom Macros
OutDir=.\WMIPSFPDbg
# End Custom Macros

ALL : "$(OUTDIR)\cflmipsfpd.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\cflmipsfpd.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /QMFWCE /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflmipsfpd.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflmipsfpd.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WMIPSFPDbg
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflmipsfpd.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"

OUTDIR=.\WCEX86Rel
INTDIR=.\WCEX86Rel
# Begin Custom Macros
OutDir=.\WCEX86Rel
# End Custom Macros

ALL : "$(OUTDIR)\cflx86.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(OUTDIR)\cflx86.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /O2 /D "x86" /D "_i386_" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "NDEBUG" /D "_MBCS" /D "_LIB" /Fo"$(INTDIR)\\" /Gs8192 /GF /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflx86.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflx86.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WCEX86Rel
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflx86.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"

OUTDIR=.\WCEX86Dbg
INTDIR=.\WCEX86Dbg
# Begin Custom Macros
OutDir=.\WCEX86Dbg
# End Custom Macros

ALL : "$(OUTDIR)\cflx86d.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\cflx86d.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Zi /Od /D "x86" /D "_i386_" /D "_x86_" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "DEBUG" /D "_MBCS" /D "_LIB" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /Gs8192 /GF /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflx86d.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflx86d.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WCEX86Dbg
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflx86d.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"

OUTDIR=.\x86emRel
INTDIR=.\x86emRel
# Begin Custom Macros
OutDir=.\x86emRel
# End Custom Macros

ALL : "$(OUTDIR)\cflem.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(OUTDIR)\cflem.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /O2 /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflem.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflem.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\x86emRel
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflem.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"

OUTDIR=.\x86emDbg
INTDIR=.\x86emDbg
# Begin Custom Macros
OutDir=.\x86emDbg
# End Custom Macros

ALL : "$(OUTDIR)\cflemd.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(OUTDIR)\cflemd.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Z7 /Od /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflemd.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflemd.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\x86emDbg
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflemd.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"

OUTDIR=.\WCEPPCRel
INTDIR=.\WCEPPCRel
# Begin Custom Macros
OutDir=.\WCEPPCRel
# End Custom Macros

ALL : "$(OUTDIR)\cflppc.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(OUTDIR)\cflppc.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=clppc.exe
CPP_PROJ=/nologo /M$(CECrt) /W3 /O2 /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "PPC" /D "_PPC_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflppc.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflppc.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WCEPPCRel
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflppc.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"

OUTDIR=.\WCEPPCDbg
INTDIR=.\WCEPPCDbg
# Begin Custom Macros
OutDir=.\WCEPPCDbg
# End Custom Macros

ALL : "$(OUTDIR)\cflppcd.lib"


CLEAN :
	-@erase "$(INTDIR)\CeApp.obj"
	-@erase "$(INTDIR)\CeImpl.obj"
	-@erase "$(INTDIR)\CeMain.obj"
	-@erase "$(INTDIR)\CePlex.obj"
	-@erase "$(INTDIR)\CeReg.obj"
	-@erase "$(INTDIR)\CeSocket.obj"
	-@erase "$(INTDIR)\CeStr.obj"
	-@erase "$(INTDIR)\CeUte.obj"
	-@erase "$(INTDIR)\CeWin.obj"
	-@erase "$(INTDIR)\CeXml.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\cflppcd.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=clppc.exe
CPP_PROJ=/nologo /M$(CECrtDebug) /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "PPC" /D "_PPC_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\cfl.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cfl.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\cflppcd.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CeApp.obj" \
	"$(INTDIR)\CeImpl.obj" \
	"$(INTDIR)\CeMain.obj" \
	"$(INTDIR)\CePlex.obj" \
	"$(INTDIR)\CeReg.obj" \
	"$(INTDIR)\CeSocket.obj" \
	"$(INTDIR)\CeStr.obj" \
	"$(INTDIR)\CeUte.obj" \
	"$(INTDIR)\CeWin.obj" \
	"$(INTDIR)\CeXml.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\cflppcd.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\WCEPPCDbg
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\cflppcd.lib"
   copylibs.bat
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("cfl.dep")
!INCLUDE "cfl.dep"
!ELSE 
!MESSAGE Warning: cannot find "cfl.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "cfl - Win32 (WCE MIPS) Release" || "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug" || "$(CFG)" == "cfl - Win32 (WCE SH4) Release" || "$(CFG)" == "cfl - Win32 (WCE SH4) Debug" || "$(CFG)" == "cfl - Win32 (WCE SH3) Release" || "$(CFG)" == "cfl - Win32 (WCE SH3) Debug" || "$(CFG)" == "cfl - Win32 (WCE ARM) Release" || "$(CFG)" == "cfl - Win32 (WCE ARM) Debug" || "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release" || "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug" || "$(CFG)" == "cfl - Win32 (WCE x86) Release" || "$(CFG)" == "cfl - Win32 (WCE x86) Debug" || "$(CFG)" == "cfl - Win32 (WCE x86em) Release" || "$(CFG)" == "cfl - Win32 (WCE x86em) Debug" || "$(CFG)" == "cfl - Win32 (WCE PPC) Release" || "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"
SOURCE=.\CeApp.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"


"$(INTDIR)\CeApp.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\CeImpl.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"


"$(INTDIR)\CeImpl.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\CeMain.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"


"$(INTDIR)\CeMain.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\CePlex.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"


"$(INTDIR)\CePlex.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\CeReg.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"


"$(INTDIR)\CeReg.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\CeSocket.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"


"$(INTDIR)\CeSocket.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\CeStr.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"


"$(INTDIR)\CeStr.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\CeUte.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"


"$(INTDIR)\CeUte.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\CeWin.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"


"$(INTDIR)\CeWin.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\CeXml.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"


"$(INTDIR)\CeXml.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\stdafx.cpp

!IF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Release"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPS) Debug"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Release"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH4) Debug"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Release"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE SH3) Debug"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Release"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE ARM) Debug"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Release"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE MIPSFP) Debug"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Release"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86) Debug"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Release"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE x86em) Debug"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Release"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "cfl - Win32 (WCE PPC) Debug"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 


!ENDIF 

