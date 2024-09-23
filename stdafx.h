//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifndef STRICT
#define STRICT
#endif

#include <windows.h>                 // For all that Windows stuff
#include <winuser.h>				 // 
#include <commctrl.h>                // Command bar includes
#ifdef _WIN32 
#include <tchar.h>
#endif
#ifdef _WIN32_WCE
#include <notify.h>					 // Notification 
#if (_WIN32_WCE > 201)
#include <aygshell.h>                // Shell stuff
#endif
#endif
#include <prsht.h>					 // Property sheet
#include <winsock.h>				 // Sockets
#include <stdlib.h>
#include <ctype.h>

#define MAX_LEN 256					 // Maximum string length

