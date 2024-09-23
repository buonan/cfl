//////////////////////////////////////////////////////////////////////////////
// Ce Framework Library for Windows CE
// 
// Written by BnKSoftware Inc.
// Copyright (c) 1998-2000 
//
#include "stdafx.h"
#include "ceplex.h"
#include "ceapp.h"
#include "cewin.h"

#ifdef _WIN32_WCE
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    LPWSTR lpCmdLine, int nCmdShow) 
#else
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    LPSTR lpCmdLine, int nCmdShow) 
#endif
{
    MSG msg;

	// If client didn't create a CeApp we quit!
	if (gpCeApp == 0)
		return -1;

    // Init application
    if (!gpCeApp->CeInitApp(hInstance))
		return -1;

#ifdef _WIN32_WCE
	// Check if notification started
	if (gpCeApp->FNotification(lpCmdLine))
		return 0;
#endif

    // Initialize this instance.
    if (!gpCeApp->CeInitInstance(hInstance, (LPCTSTR)lpCmdLine, nCmdShow))
		return -1;

	// Load accelerators if exists
	gpCeApp->m_hAccel = ::LoadAccelerators(hInstance, MAKEINTRESOURCE(gpCeApp->m_nAccelId));

    // Application message loop
    while (GetMessage(&msg, NULL, 0, 0)) 
	{
		// Need to check if ID_APP_EXIT so windows don't destroy themselves
		if ((msg.message == WM_COMMAND) && LOWORD(msg.wParam == ID_APP_EXIT))
			gpCeApp->OnAppExit();
		else
		{
			// Check for Modeless
			if ((gpCeApp->m_hActiveDlg == 0) || (!IsDialogMessage(gpCeApp->m_hActiveDlg, &msg)) /*||
				!PropSheet_IsDialogMessage(CePropertySheet::m_shWnd, &msg)*/) 
			{
				// Check for accelerators
				if (!TranslateAccelerator(gpCeApp->m_hwndMainWindow, gpCeApp->m_hAccel, &msg))
				{
					TranslateMessage(&msg);
					DispatchMessage(&msg);
				}
			}
		}
    }

    // Instance cleanup
    return gpCeApp->CeExitInstance(hInstance, msg.wParam);
}
