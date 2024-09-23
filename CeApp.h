//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifndef _CEAPP_H
#define _CEAPP_H

// Forward decl
class CeWindow;

//////////////////////////////////////////////////////////////////////////////
// CeApp
//
class CeApp 
{
public:
    CeApp();
    ~CeApp(){};

    HINSTANCE m_hInst;
	DWORD	  m_dwICC;

	// Main Window 
	HWND	  m_hwndMainWindow;
	CeWindow* m_pMainWindow;
	TCHAR*	  m_pszAppName;

	// Active Dialog
	HWND	  m_hActiveDlg;

	// Acclerator
	int		  m_nAccelId;
	HACCEL	  m_hAccel;

// Virtual overrides
public:
	virtual BOOL CeInitApp(HINSTANCE);
	virtual BOOL CeInitInstance(HINSTANCE hInstance, LPCTSTR lpCmdLine,
                   int nCmdShow);
	virtual int CeExitInstance(HINSTANCE hInstance, int nDefRC);
#ifdef _WIN32_WCE
	virtual BOOL FNotification(LPWSTR lpCmdLine);
    void ShowSIP(bool fTrue);
#endif
	virtual void OnAppExit();

// Member functions
public:
	BOOL LoadHelpFile(TCHAR* pszHelpFile);
};

// *** There should be only one ***
extern CeApp* gpCeApp;

#endif // _CEAPP_H