//////////////////////////////////////////////////////////////////////////////
// Ce Framework Library for Windows CE
// 
// Written by BnKSoftware Inc.
// Copyright (c) 1998-2000 
//
#include "stdafx.h"
#if (_WIN32_WCE == 201)
    #include <aygshell.h>
#endif
#include "ceapp.h"
#include "ceplex.h"
#include "cewin.h"
#include "cflmacro.h"
#include "resource.h"

//////////////////////////////////////////////////////////////////////////////
// CeApp - application class
// 
CeApp* gpCeApp = NULL;

CeApp::CeApp()
{
	m_hInst = 0;
	m_dwICC = 0;
	m_hwndMainWindow = 0;
	m_pMainWindow = 0;	
	m_pszAppName = 0;
	m_hActiveDlg = 0;
	m_nAccelId = 0;
	m_hAccel = 0;
	gpCeApp = this;
};

BOOL CeApp::CeInitApp(HINSTANCE hInstance) 
{
	BOOL bRet = TRUE;
 #if (_WIN32_WCE)
  #if (_WIN32_WCE > 101)
	if (m_dwICC == CFL_ICC_ALL_CLASSES)
	{
		INITCOMMONCONTROLSEX icc;
		icc.dwSize = sizeof(INITCOMMONCONTROLSEX);
		icc.dwICC = CFL_ICC_ALL_CLASSES;
		bRet = ::InitCommonControlsEx(&icc);
	}
	else if (m_dwICC)
	{
		INITCOMMONCONTROLSEX icc;
		icc.dwSize = sizeof(INITCOMMONCONTROLSEX);
		icc.dwICC = m_dwICC;		

		bRet = ::InitCommonControlsEx(&icc);
	}
  #endif // (_WIN32_WCE > 101)
#elif (WIN32) // (_WIN32_WCE)
		INITCOMMONCONTROLSEX icc;
		icc.dwSize = sizeof(INITCOMMONCONTROLSEX);
		icc.dwICC = m_dwICC;		

		bRet = ::InitCommonControlsEx(&icc);
#endif

	m_hInst = hInstance;
	return bRet;
}

BOOL CeApp::CeInitInstance(HINSTANCE hInstance, LPCTSTR lpCmdLine,
                   int nCmdShow) 
{
	m_hInst = hInstance;
	return TRUE;
}

int CeApp::CeExitInstance(HINSTANCE hInstance, int nDefRC)
{
	return nDefRC;
}

#ifdef _WIN32_WCE
BOOL CeApp::FNotification(LPWSTR lpCmdLine)
{
	INT i;
	HWND hwnd;
	HANDLE hNotify;
	TCHAR szText[128];
	if (*lpCmdLine)
	{
		LPWSTR pPtr;
		pPtr = lpCmdLine;
		for (i=0; i<128 && *lpCmdLine > TEXT(' '); i++)
			szText[i] = *pPtr++;
		szText[i] = TEXT('\0');
		
		if (lstrcmp(szText, APP_RUN_TO_HANDLE_NOTIFICATION) == 0) 
		{
			GetModuleFileName(m_hInst, szText, sizeof(szText));
#ifndef _WIN32_WCE_EMULATION
			CeHandleAppNotifications(szText);
#endif
			hNotify = (HANDLE)_wtol(pPtr);
			hwnd = FindWindow(NULL, m_pszAppName?m_pszAppName:0);
			if (hwnd)
			{
				// Notify app and exit
				return TRUE;
			}
		}
		else if ((lstrcmp(szText, APP_RUN_AT_TIME) == 0) ||
				(lstrcmp(szText, APP_RUN_AFTER_SYNC) == 0) ||
				(lstrcmp(szText, APP_RUN_AT_AC_POWER_ON) == 0) ||
				(lstrcmp(szText, APP_RUN_AT_AC_POWER_OFF) == 0) ||
				(lstrcmp(szText, APP_RUN_AT_NET_CONNECT) == 0) ||
				(lstrcmp(szText, APP_RUN_AT_NET_DISCONNECT) == 0) ||
				(lstrcmp(szText, APP_RUN_AT_DEVICE_CHANGE) == 0) ||
				(lstrcmp(szText, APP_RUN_AT_IR_DISCOVERY) == 0) ||
				(lstrcmp(szText, APP_RUN_AT_RS232_DETECT) == 0) ||
				(lstrcmp(szText, APP_RUN_AFTER_RESTORE) == 0))
		{
			hwnd = FindWindow(NULL, m_pszAppName?m_pszAppName:0);
			if (hwnd)
			{
				// TODO: Notify app and exit
				return TRUE;
			}
		}

	}
	return FALSE;
}

void CeApp::ShowSIP(bool fTrue)
{
#if (_WIN32_WCE == 201 || _WIN32_WCE == 300)
    SIPINFO sip;
    memset(&sip, 0, sizeof(SIPINFO));
    sip.cbSize = sizeof(SIPINFO);
    SHSipInfo(SPI_GETSIPINFO, 0, &sip, 0);

    if (fTrue) {
        sip.fdwFlags |= SIPF_ON;
        SHSipInfo(SPI_SETSIPINFO, 0, &sip, 0);
    }
    else {        
        if (sip.fdwFlags & SIPF_ON)
            sip.fdwFlags &= ~SIPF_ON;
        SHSipInfo(SPI_SETSIPINFO, 0, &sip, 0);
    }
#endif
}
#endif

BOOL CeApp::LoadHelpFile(TCHAR* pszHelpFile)
{
	if (pszHelpFile)
	{
		return CreateProcess(TEXT("PegHelp.exe"), pszHelpFile, NULL, NULL, FALSE, 0, NULL, NULL, NULL, NULL);
	}
	return FALSE;
}

void CeApp::OnAppExit()
{
	// We start the window destructions from the app level so 
	// windows don't destroy themselves.
	::PostMessage(gpCeApp->m_pMainWindow->m_hWnd, WM_CLOSE, 0, 0);
}
