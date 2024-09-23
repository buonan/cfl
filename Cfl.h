//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifndef _CFL_H
#define _CFL_H

#ifndef STRICT
#define STRICT
#endif
#include <windows.h>
#include <windowsx.h>
#include <ctype.h>

#if (_WIN32_WCE > 101)
 #include <wtypes.h>
#endif

#include <commctrl.h>
#include <tchar.h>
#include <winsock.h>

#if (_WIN32_WCE >= 211)
 #pragma comment(lib, "winsock.lib")
 #pragma comment(lib, "wininet.lib")
 #pragma comment(lib, "corelibc.lib")
#elif (_WIN32_WCE >= 201) || (_WIN32_WCE <= 210)
#if defined (_WIN32_WCE_EMULATION)
 #pragma comment(lib, "winsockm.lib")
 #pragma comment(lib, "wininetm.lib")
 #pragma comment(lib, "corelibc.lib")
#endif
#endif 

#define MAX_LEN 256					// Maximum string length

#include "ceplex.h"					// CePlex classes
#include "ceapp.h"					// CeApp class
#include "cewin.h"					// CeWindows classes
#include "cereg.h"					// CeRegKey classes
#include "cesocket.h"				// CeSocket classes
#include "cestr.h"					// CeStr classes
#include "cecrypt.h"                // Encrypttion functions

// So we don't forget to link to this library
#ifdef SH3
	#ifdef _DEBUG
		#pragma comment(lib, "cflsh3d.lib")		
	#else
		#pragma comment(lib, "cflsh3.lib")
	#endif
#elif defined (SH4)
	#ifdef _DEBUG
		#pragma comment(lib, "cflsh4d.lib")		
	#else
		#pragma comment(lib, "cflsh4.lib")
	#endif
#elif defined (MIPS)
	#ifdef _DEBUG
		#pragma comment(lib, "cflmipsd.lib")		
	#else
		#pragma comment(lib, "cflmips.lib")
	#endif
#elif defined (ARM)
	#ifdef _DEBUG
		#pragma comment(lib, "cflarmd.lib")		
	#else
		#pragma comment(lib, "cflarm.lib")
	#endif
#elif defined (_WIN32_WCE_EMULATION)
	#ifdef _DEBUG
		#pragma comment(lib, "cflemd.lib")		
	#else
		#pragma comment(lib, "cflem.lib")
	#endif
#elif !defined (_WIN32_WCE)
	#ifdef _DEBUG
		#pragma comment(lib, "cflx86d.lib")
	#else
		#pragma comment(lib, "cflx86.lib")
	#endif
#endif

#endif // _CFL_H