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
#include "resource.h"


//////////////////////////////////////////////////////////////////////////////
// CeWindow - base window class
// 
IMPLEMENT_MSG_HANDLER(CeWindow)
	ON_MSG(WM_CREATE, CeWindow::OnCreate)
	ON_MSG(WM_DESTROY, CeWindow::OnDestroy)
#ifndef _WIN32_WCE
	ON_MSG(WM_NCDESTROY, CeWindow::OnNcDestroy)
#endif
	ON_MSG(WM_INITDIALOG, CeWindow::OnInitDialog)
END_IMPLEMENT_MSG()

IMPLEMENT_CMD_HANDLER(CeWindow)
END_IMPLEMENT_CMD()

// These are our two types of handlers, OnMsg and OnCmd
PMSGFN pmfn = 0;
PCMDFN pcfn = 0;

#ifdef _DEBUG
// Set this to the message id and debugger 
// will break on that message
UINT CeWindow::m_uBreakOnMsg = -1;
#endif

CeWindow::CeWindow()
{ 
	m_pCeApp = gpCeApp;
	m_hInst = 0;
	m_hParent = 0;
	m_hWnd = 0;
	m_fMenuLoop = FALSE;
    m_hMenu = NULL;

	m_prgMsg = 0;
	m_prgCmd = 0;

	m_prgBaseMsg = CeWindow_rgMsg;
	m_prgBaseCmd = CeWindow_rgCmd;

	// We subclass controls to get all control messages
	// Here's where we store the old windowproc for subclassing
	m_poldwp = 0;
}

// Registers our main window's class
BOOL CeWindow::RegisterClass(HINSTANCE hInstance, LPCTSTR lpszAppName)
{
    WNDCLASS wc;

    // Register application main window class.
    wc.style = 0;												// Window style
    wc.lpfnWndProc = CeWndProc;									// Callback function
    wc.cbClsExtra = 0;											// Extra class data
    wc.cbWndExtra = 4;											// Extra window data
    wc.hInstance = hInstance;									// Owner handle
    wc.hIcon = NULL,											// Application icon
    wc.hbrBackground = (HBRUSH) GetStockObject (WHITE_BRUSH);	// Background color
#ifdef _WIN32_WCE
	wc.hCursor = NULL;											// WCE does not have mouse
    wc.lpszMenuName =  NULL;									// Menu name
#else
    wc.lpszMenuName =  MAKEINTRESOURCE(m_nMenu);	            // Menu name
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);					// Default cursor
#endif
    wc.lpszClassName = lpszAppName;								// Window class name
	ATOM atom;

    if ((atom = ::RegisterClass(&wc)) != 0) 
		return TRUE;

    return FALSE;
}

BOOL CeWindow::Create(LPCTSTR lpClass, LPCTSTR lpWindow, DWORD dwStyle, int x, int y,
						int cx, int cy, HWND hParent, HMENU hMenu, HINSTANCE hInstance, LPVOID lpvoid)
{
	m_hParent = hParent;

	// Create main window.
	if (m_hWnd = ::CreateWindow(						
						lpClass,			// Window class
						lpWindow,			// Window title
						 dwStyle,			// Style flags
						 x,					// x position
						 y,					// y position
						 cx,				// Initial width
						 cy,				// Initial height
						 hParent,           // Parent
						 hMenu,             // Menu, must be null
						 hInstance,         // Application instance
						 (LPVOID)lpvoid))   // Pointer to create parameters
	{
		// Standard show and update calls
		::ShowWindow(m_hWnd, SW_SHOW);
		::UpdateWindow(m_hWnd);
		return TRUE;
	}
	return FALSE;
}

BOOL CeWindow::CreateEx(DWORD dwExStyle, LPCTSTR lpClass, LPCTSTR lpWindow, DWORD dwStyle, int x, int y,
						int cx, int cy, HWND hParent, HMENU hMenu, HINSTANCE hInstance, LPVOID lpvoid)
{
	m_hParent = hParent;	
	// Create main window.
	if (m_hWnd = ::CreateWindowEx(
						dwExStyle,			// Extended Styles
						lpClass,			// Window class
						lpWindow,			// Window title
						 dwStyle,			// Style flags
						 x,					// x position
						 y,					// y position
						 cx,				// Initial width
						 cy,				// Initial height
						 hParent,           // Parent
						 hMenu,             // Menu, must be null
						 hInstance,         // Application instance
						 (LPVOID)lpvoid))   // Pointer to create parameters
	{
		// Standard show and update calls
		::ShowWindow(m_hWnd, SW_SHOW);
		::UpdateWindow(m_hWnd);
		return TRUE;
	}
	return FALSE;
}

BOOL CeWindow::Create(HINSTANCE hInstance, LPCTSTR lpTemplate, HWND hParent, LPVOID lpvoid)
{
	m_hInst = hInstance;
	m_hParent = hParent;
	// Create modeless dialog window
	m_hWnd = ::CreateDialogParam(m_hInst, lpTemplate, hParent, CeDlgProc, (LPARAM)this); 
	if (m_hWnd)
	{
		return TRUE;
	}

	// If your dialog cannot be created check if InitCommonControls has been called
	// and your control are properly registered.
	return FALSE;
}

BOOL CeWindow::CenterWindow()
{
	// NOTE: derived from ATL

	// determine owner window to center against
	HWND hWndCenter = ::GetParent(m_hWnd);

	// get coordinates of the window relative to its parent
	RECT rcDlg;
	::GetWindowRect(m_hWnd, &rcDlg);
	RECT rcArea;
	RECT rcCenter;
	HWND hWndParent;

	// center within parent client coordinates
	hWndParent = ::GetParent(m_hWnd);

	::GetClientRect(hWndParent, &rcArea);
	::GetClientRect(hWndCenter, &rcCenter);
	::MapWindowPoints(hWndCenter, hWndParent, (POINT*)&rcCenter, 2);

	int DlgWidth = rcDlg.right - rcDlg.left;
	int DlgHeight = rcDlg.bottom - rcDlg.top;

	// find dialog's upper left based on rcCenter
	int xLeft = (rcCenter.left + rcCenter.right) / 2 - DlgWidth / 2;
	int yTop = (rcCenter.top + rcCenter.bottom) / 2 - DlgHeight / 2;

	// if the dialog is outside the screen, move it inside
	if(xLeft < rcArea.left)
		xLeft = rcArea.left;
	else if(xLeft + DlgWidth > rcArea.right)
		xLeft = rcArea.right - DlgWidth;

	if(yTop < rcArea.top)
		yTop = rcArea.top;
	else if(yTop + DlgHeight > rcArea.bottom)
		yTop = rcArea.bottom - DlgHeight;

	// map screen coordinates to child coordinates
	return ::SetWindowPos(m_hWnd, NULL, xLeft, yTop, -1, -1,
		SWP_NOSIZE | SWP_NOZORDER | SWP_NOACTIVATE);

	return TRUE;
}

void CeWindow::CheckDlgButton(HWND hw, int id, UINT st)
{
	HWND hc = ::GetDlgItem(hw, id);
	::SendMessage(hc, BM_SETCHECK, st, 0);
}

UINT CeWindow::IsDlgButtonChecked(HWND hw, int id)
{
	HWND hc = ::GetDlgItem(hw, id);
	return ::SendMessage(hc, BM_GETCHECK, 0, 0);
}

LRESULT CeWindow::OnCreate(HWND hwnd, UINT msg, WPARAM wparam, LPARAM lp)
{
	return 0;
}

LRESULT CeWindow::OnDestroy(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp)
{
#ifdef _WIN32_WCE
	// The main window needs to PostQuitMessage. Child windows must derive from
	// CeView
	PostQuitMessage(0);
	SetWindowLong(hwnd, 0, (LONG)0);	// remove the deleted this ptr

	// BUG: Remember once we delete the main window contained
	//		objects basically are deleted so we need to remove
	//		the this ptr in the window long in dtors not in
	//		OnDestroy.  It just so happens memory isn't null
	//		that is still works.
	delete this;	
#endif
	return 0;
}

#ifndef _WIN32_WCE
LRESULT CeWindow::OnNcDestroy(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp)
{
	// The main window needs to PostQuitMessage. Child windows must derive from
	// CeView
	PostQuitMessage(0);
	SetWindowLong(hwnd, 0, (LONG)0);	// remove the deleted this ptr

	// BUG: Remember once we delete the main window contained
	//		objects basically are deleted so we need to remove
	//		the this ptr in the window long in dtors not in
	//		OnDestroy.  It just so happens memory isn't null
	//		that is still works.
	delete this;	
	return 0;
}
#endif

LRESULT CeWindow::OnInitDialog(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp)
{
	// This is not necessary but just in-case!
	m_hWnd = hwnd;

    // Create a Done button and size it.
#if (0 >= 300)
    SHINITDLGINFO shidi;
    shidi.dwMask = SHIDIM_FLAGS;
    shidi.dwFlags = SHIDIF_DONEBUTTON | SHIDIF_SIZEDLG;
    shidi.hDlg = hwnd;
    return SHInitDialog(&shidi);
#else
	return FALSE;	// FALSE do not set keyboard focus
#endif
}

#ifdef _DEBUG_LOG
void DebugOut(HWND hwnd, UINT uMsg, UINT uBreakMsg, WPARAM wp, LPARAM lp)
{
	TCHAR szDebug[255];
	TCHAR szClassName[255];
	GetClassName(hwnd, szClassName, 255);
	wsprintf(szDebug, TEXT("class = %s, msg = 0x%04x,wp = 0x%04x,lp = 0x%04x\n"), 
            szClassName, uMsg, wp, lp);
	OutputDebugString(szDebug);
	if (uMsg == uBreakMsg)
		DebugBreak();
}
#endif

BOOL CALLBACK CeWindow::CeModalDlgProc(HWND hDlg, UINT uMsg, WPARAM wp, 
                              LPARAM lp)
{
	BOOL bProcessed = FALSE;
	LRESULT lResult = 1;
	CeWindow* pThis = 0;

#ifdef _DEBUG_LOG
	DebugOut(hDlg, uMsg, m_uBreakOnMsg, wp, lp);
#endif

	// NOTE: if you mysteriously get a WM_DESTROY (0x0002) msg and never
	//		 get your WM_INITDIALOG msg, it maybe because you have a 
	//		 custom control on your dialog template that couldn't be 
	//		 created
	if (uMsg == WM_INITDIALOG)
	{		
		pThis = (CeWindow*) lp;
		SetWindowLong(hDlg, DWL_USER, (LPARAM)pThis);
		pThis->m_hWnd = hDlg;
        pThis->CeWindow::OnInitDialog(hDlg, uMsg, wp, lp);
	}

	pThis = (CeWindow*)::GetWindowLong(hDlg, DWL_USER);
	if (pThis == 0)
		return FALSE;	
	
	lResult = pThis->ProcessMessage(hDlg, uMsg, wp, lp, bProcessed);

    if (bProcessed)
        return lResult;

    return bProcessed;	
}

BOOL CALLBACK CeWindow::CeDlgProc(HWND hDlg, UINT uMsg, WPARAM wp, 
                              LPARAM lp)
{
	BOOL bProcessed = FALSE;
	LRESULT lResult = 1;
	CeWindow* pThis = 0;

#ifdef _DEBUG_LOG
	DebugOut(hDlg, uMsg, m_uBreakOnMsg, wp, lp);
#endif

	// NOTE: if you mysteriously get a WM_DESTROY (0x0002) msg and never
	//		 get your WM_INITDIALOG msg, it maybe because you have a 
	//		 custom control on your dialog template that couldn't be 
	//		 created
	if (uMsg == WM_INITDIALOG)
	{
		pThis = (CeWindow*) lp;
		SetWindowLong(hDlg, DWL_USER, (LPARAM)pThis);
		if (pThis)
		{
			// Just incase!
			pThis->m_pCeApp = gpCeApp;
			pThis->m_pCeApp->m_hActiveDlg = hDlg;
			pThis->m_hWnd = hDlg;
            pThis->CeWindow::OnInitDialog(hDlg, uMsg, wp, lp);
		}        
	}

	pThis = (CeWindow*)::GetWindowLong(hDlg, DWL_USER);
	if (pThis == 0)
		return FALSE;	
	
	lResult = pThis->ProcessMessage(hDlg, uMsg, wp, lp, bProcessed);

    if (bProcessed)
        return lResult;

    return bProcessed;	
}

BOOL CALLBACK CeWindow::CePropPageProc(HWND hDlg, UINT uMsg, WPARAM wp,
							  LPARAM lp)
{
	BOOL bProcessed = FALSE;
	LRESULT lResult = 1;
	CeWindow* pThis = 0;

#ifdef _DEBUG_LOG
	DebugOut(hDlg, uMsg, m_uBreakOnMsg, wp, lp);
#endif

	// NOTE: if you mysteriously get a WM_DESTROY (0x0002) msg and never
	//		 get your WM_INITDIALOG msg, it maybe because you have a 
	//		 custom control on your dialog template that couldn't be 
	//		 created
	if (uMsg == WM_INITDIALOG)
	{
		pThis = (CeWindow*)((PROPSHEETPAGE*)lp)->lParam;
		SetWindowLong(hDlg, DWL_USER, (LPARAM)pThis);
		if (pThis)
		{
			// Just incase!
			pThis->m_pCeApp = gpCeApp;
			pThis->m_pCeApp->m_hActiveDlg = hDlg;
			pThis->m_hWnd = hDlg;
            pThis->CeWindow::OnInitDialog(hDlg, uMsg, wp, lp);
		}
	}

	pThis = (CeWindow*)::GetWindowLong(hDlg, DWL_USER);
	if (pThis == 0)
		return FALSE;	
	
	lResult = pThis->ProcessMessage(hDlg, uMsg, wp, lp, bProcessed);

    if (bProcessed)
        return lResult;

    return bProcessed;	
}

LRESULT CALLBACK CeWindow::CeWndProc(HWND hWnd, UINT uMsg, WPARAM wp, 
                              LPARAM lp)
{
	BOOL bProcessed = FALSE;
	LRESULT lResult = 0;

#ifdef _DEBUG_LOG
	DebugOut(hWnd, uMsg, m_uBreakOnMsg, wp, lp);
#endif

	if (uMsg == WM_CREATE)		
	{
		LPCREATESTRUCT lpStruct = (LPCREATESTRUCT) lp;
		CeWindow* pThis = (CeWindow *) lpStruct->lpCreateParams;
		if (pThis)
			pThis->m_hWnd = hWnd;
		SetWindowLong(hWnd, 0, (LONG)pThis);
	}

	CeWindow* pThis = (CeWindow*)::GetWindowLong(hWnd, 0);
	if (pThis == 0)
		return DefWindowProc(hWnd, uMsg, wp, lp);	
	
	lResult = pThis->ProcessMessage(hWnd, uMsg, wp, lp, bProcessed);

	if (bProcessed && ((lResult == -1) || (lResult != 0)))
		return lResult;

    return DefWindowProc(hWnd, uMsg, wp, lp);	
}

BOOL CALLBACK CeWindow::CeSubClassProc(HWND hCtl, UINT uMsg, WPARAM wp, 
                              LPARAM lp)
{
	BOOL bProcessed = FALSE;
	LRESULT lResult = 0;
 #ifdef _DEBUG_LOG
	DebugOut(hCtl, uMsg, m_uBreakOnMsg, wp, lp);
 #endif

	// NOTE: CE 1.0 doesn't support GWL_USERDATA
	CeWindow* pThis = (CeWindow*)GetWindowLong(hCtl, GWL_USERDATA);
	if (pThis)
	{
		pThis->m_hWnd = hCtl;
		lResult = pThis->ProcessMessage(hCtl, uMsg, wp, lp, bProcessed);
	}

	if (bProcessed && ((lResult != 0) || (lResult == -1)))
		return lResult;

	// NOTE: CE 1.0 doesn't support GWL_USERDATA 
	if (pThis && GetWindowLong(hCtl, GWL_USERDATA) && GetWindowLong(hCtl, 0))
		return CallWindowProc(pThis->m_poldwp, hCtl, uMsg, wp, lp);

    return lResult;
}

// Check command map
LRESULT CeWindow::LoopCmd(const _HANDLE_CMD* prg, HWND hCtl, WORD wNotify, WORD wID, 
						  BOOL& bProcessed)
{
	LRESULT lResult = -1;
	int i = 0;
	if (prg == NULL)
		return lResult;

	while(prg[i].Fxn)
	{
		if (wID >= prg[i].wLoCmd && wID <= prg[i].wHiCmd)
		{
			pcfn = prg[i].Fxn;
			lResult = (this->*pcfn)(hCtl, wNotify, wID);
			bProcessed = TRUE;
			break;
		}
		i++;
	}
	return lResult;
}

// Checks message map
LRESULT CeWindow::LoopMsg(const _HANDLE_MSG* prg, HWND hWnd, UINT uMsg, WPARAM wp, 
						  LPARAM lp, BOOL& bProcessed)
{
	LRESULT lResult = -1;
	int i = 0;
	if (prg == NULL)
		return lResult;

	while(prg[i].Fxn)
	{
		if (uMsg >= prg[i].uLoMsg && uMsg <= prg[i].uHiMsg)
		{
			pmfn = prg[i].Fxn;
			lResult = (this->*pmfn)(hWnd, uMsg, wp, lp);
			bProcessed = TRUE;
			break;
		}
		i++;
	}
	return lResult;
}

// ProcessMessage first checks if derived class handles it, then checks
// the base class.  We support only parent-child message maps (2 levels) on CE.
LRESULT CeWindow::ProcessMessage(HWND hWnd, UINT uMsg, WPARAM wp, LPARAM lp, 
								 BOOL& bProcessed)
{
	LRESULT lResult = 0;

	// TODO: What should we do if people want to handle this message?
	//	     Special case WM_ENTERMENULOOP so we don't forward any other messages
	switch (uMsg)
	{
		case WM_ENTERMENULOOP:	
			m_fMenuLoop = TRUE;
			break;
		case WM_EXITMENULOOP:
			m_fMenuLoop = FALSE;
			break;
	}
	if (m_fMenuLoop)
		return 0;

	// WM_xxx
	if (uMsg != WM_COMMAND)
	{
		// Search this class
		lResult = LoopMsg(m_prgMsg, hWnd, uMsg, wp, lp, bProcessed);

		// Search base class
		if (!bProcessed)
			lResult = LoopMsg(m_prgBaseMsg, hWnd, uMsg, wp, lp, bProcessed);
	}
	else // WM_COMMAND
	{
		// Search cmd array
		WORD wNotify = HIWORD(wp);
		WORD wID = LOWORD(wp);
		HWND hCtl = (HWND)lp;

		if (wID == IDOK)
		{ 
			int i = 0;
			i++;
		}

		// Search this class
		lResult = LoopCmd(m_prgCmd, hCtl, wNotify, wID, bProcessed);

		// Search base class 
		if (!bProcessed)
			lResult = LoopCmd(m_prgBaseCmd, hCtl, wNotify, wID, bProcessed);
	}
	return lResult;
}

// We subclass child views to handle all the messages
void CeWindow::SubClass(HWND hWnd)
{
	// Subclass ourself
	if (hWnd == 0 && m_hWnd != 0)
		hWnd = m_hWnd;
	
	// Capture the hwnd
	m_hWnd = hWnd;
	m_poldwp = (WNDPROC)GetWindowLong(hWnd, GWL_WNDPROC);

	// We subclass the control window proc to get all messages
	// NOTE: CE 1.0 doesn't support GWL_USERDATA
	::SetWindowLong(hWnd, GWL_USERDATA, (LONG)this);

	// Set our window proc
	::SetWindowLong(hWnd, GWL_WNDPROC, (LONG)CeWindow::CeSubClassProc);
}

// Need to unsubclass
void CeWindow::UnsubClass()
{
	if (m_poldwp)
	{
		::SetWindowLong(m_hWnd, GWL_WNDPROC, (LPARAM)m_poldwp);

		// NOTE: CE 1.0 doesn't support GWL_USERDATA
		::SetWindowLong(m_hWnd, GWL_USERDATA, (LONG)0);

		m_poldwp = 0;
	}
}

//////////////////////////////////////////////////////////////////////////////
// CeMainWindow
// 
IMPLEMENT_TBBT_RANGE(CeMainWindow)
	// { iBitmap, idCmd, fsState, fsStyle, dwData, iString }
	RAWTBBT(0, 0, 0, TBSTYLE_SEP, 0, 0)
	TBBT(STD_CUT, STD_CUT)
	TBBT(STD_COPY, STD_COPY)
	TBBT(STD_PASTE, STD_PASTE)
	TBBT(STD_UNDO, STD_UNDO)
	TBBT(STD_REDOW, STD_REDOW)
	TBBT(STD_DELETE, STD_DELETE)	
	TBBT(STD_FILENEW, STD_FILENEW)
	TBBT(STD_FILEOPEN, STD_FILEOPEN)
	TBBT(STD_FILESAVE, STD_FILESAVE)
	TBBT(STD_PRINTPRE, STD_PRINTPRE)
	TBBT(STD_PROPERTIES, STD_PROPERTIES)
	TBBT(STD_HELP, STD_HELP)
	TBBT(STD_FIND, STD_FIND)
	TBBT(STD_REPLACE, STD_REPLACE)
	TBBT(STD_PRINT, STD_PRINT)
END_IMPLEMENT_TBBT()

IMPLEMENT_TTIP_RANGE(CeMainWindow)
	// { szTip }
	TEXT(""),
	TEXT("Cut"),
	TEXT("Copy"),
	TEXT("Paste"),
	TEXT("Undo"),
	TEXT("Redo"),
	TEXT("Delete"),	
	TEXT("FileNew"),
	TEXT("FileOpen"),
	TEXT("FileSave"),
	TEXT("Print preview"),
	TEXT("Properties"),
	TEXT("Help"),
	TEXT("Find"),
	TEXT("Replace"),
	TEXT("Print")
END_IMPLEMENT_TTIP()

IMPLEMENT_MSG_HANDLER(CeMainWindow)
	ON_MSG(WM_CREATE, CeMainWindow::OnCreate)
	ON_MSG(WM_DESTROY, CeMainWindow::OnDestroy)
#ifndef _WIN32_WCE
	ON_MSG(WM_NCDESTROY, CeMainWindow::OnNcDestroy)
#endif
END_IMPLEMENT_MSG()

IMPLEMENT_CMD_HANDLER(CeMainWindow)
END_IMPLEMENT_CMD()

CeMainWindow::CeMainWindow() : m_prgTbbt(0), m_pprgTtip(0), m_prgRbbi(0)
{
	memset(m_rghCBar, 0, sizeof(m_rghCBar));
	memset(m_rghCBand, 0, sizeof(m_rghCBand));
	m_nCBImages = 0;
	m_hImglist = 0;
	m_nMenu = 0;

#ifdef _WIN32_WCE
	m_nCB = IDB_STD_SMALL_COLOR;
    m_nVB = IDB_VIEW_SMALL_COLOR;
#if (_WIN32_WCE < 300)
	m_dwCBFlags = CMDBAR_OK|CMDBAR_HELP;
#else
	m_dwCBFlags = 0;
#endif
#else
	m_nCB = 0;
    m_nVB = 0;
	m_dwCBFlags = 0;
#endif // _WIN32_WCE

	m_prgTbbt = CeMainWindow_rgTbbt;
	m_pprgTtip = CeMainWindow_rgTtip;

	m_prgBaseMsg = CeMainWindow_rgMsg;
	m_prgBaseCmd = CeMainWindow_rgCmd;
}

#ifdef _WIN32_WCE
int CeMainWindow::AddBands()
{
    // Check if we have any bands to add
    //
	if (m_prgRbbi)
	{
		int nBands = CountBands(m_prgRbbi);
#if (_WIN32_WCE >= 300)
        BOOL fSuccess;
        SHMENUBARINFO mbi = {0};

        mbi.cbSize = sizeof(mbi);
        mbi.hInstRes = m_hInst;
        mbi.hwndParent = m_hWnd;
        mbi.nToolBarId = m_nMenu;
        mbi.nBmpId = 0;
        mbi.cBmpImages = 0;
        fSuccess = SHCreateMenuBar(&mbi);
        HWND hwndCmdBar = mbi.hwndMB;
        m_rghCBar[0] = mbi.hwndMB;
        m_hMenu = (HMENU)SendMessage((hwndCmdBar), SHCMBM_GETMENU, (WPARAM)0, (LPARAM)0);	
#else
		// Create CommandBand control
        //
		if (!(m_rghCBand[0] = CommandBands_Create(m_hInst, m_hWnd, IDC_CMDBAND, 
			RBS_SMARTLABELS|RBS_VARHEIGHT, m_hImglist)))
            return -1;
#endif
		// Call client to initialize CommandBars if any or if the dont want us to do any
        // default stuff like below
        //
        if (PreMenus()) {

		    // Add bands
		    if (!CommandBands_AddBands(m_rghCBand[0], m_hInst, nBands, m_prgRbbi))
                return -1;
		    
		    // TODO: We only support 1 menuband and 5 commandband at small 16x16
            //
		    int i = 0;
		    while (i < 5)
		    {
                // Get the CommandBar hwnds in the bands added
                //
			    m_rghCBar[i] = CommandBands_GetCommandBar(m_rghCBand[0], i);
			    i++;
		    }
            
            // Restore band order
            //
            RestoreBandOrder();


#if (_WIN32_WCE < 300)
		    // Insert menuband always starts at zero
            //
		    if (!CommandBar_InsertMenubar(m_rghCBar[0], m_hInst, m_nMenu, 0))
                return -1;
#endif
		    // Insert the CommandBars from the arrays
            //
		    if (m_prgTbbt)
		    {
			    int nButtons = CountButtons(m_prgTbbt);
			    HINSTANCE hInstCB = m_hInst;
			    int nImages = m_nCBImages;
			    if ((m_nCB == IDB_STD_SMALL_COLOR) || (m_nVB == IDB_VIEW_SMALL_COLOR))
			    {
				    if (m_nCB == IDB_STD_SMALL_COLOR)
					    nImages += STD_PRINT + 1;
				    if (m_nVB == IDB_VIEW_SMALL_COLOR)
					    nImages += VIEW_NEWFOLDER + 1;

				    hInstCB = HINST_COMMCTRL;
			    }

                // 1 because 0 is menu, 1 is the first toolbar
                // (we don't care if these fail)
			    CommandBar_AddBitmap(m_rghCBar[1], hInstCB, m_nCB, 0, 0, 0);
                CommandBar_AddBitmap(m_rghCBar[1], hInstCB, m_nVB, 0, 0, 0);

			    if (!CommandBar_AddButtons(m_rghCBar[1], nButtons, m_prgTbbt))
				    return -1;

			    // TODO: we only add tooltip for the first band, need to fix  this
                //
			    int nTtip = CountTooltips(m_pprgTtip);
			    if ((nTtip != -1) && !CommandBar_AddToolTips(m_rghCBar[1], nTtip, m_pprgTtip))
				    return -1;

			    LONG lStyle = ::SendMessage(m_rghCBar[1], TB_GETSTYLE, 0, 0);
			    lStyle |= TBSTYLE_TRANSPARENT;
			    ::SendMessage(m_rghCBar[1], TB_SETSTYLE, 0, lStyle);
		    }
        }

		// Add any additional things before Adornments
		PostMenus();
	}

	return 0;
}
#endif

#ifdef _WIN32_WCE
int CeMainWindow::AddToolbar()
{
#if (_WIN32_WCE >= 300)
    BOOL fSuccess;
    SHMENUBARINFO mbi = {0};
    HWND hwndCmdBar = NULL;

    mbi.cbSize = sizeof(mbi);
    mbi.hInstRes = m_hInst;
    mbi.hwndParent = m_hWnd;
    mbi.nToolBarId = m_nMenu;
    mbi.nBmpId = 0;
    mbi.cBmpImages = 0;
    if ( fSuccess = SHCreateMenuBar(&mbi) )
    {
        HWND hwndCmdBar = mbi.hwndMB;
        m_rghCBar[0] = mbi.hwndMB;
        m_hMenu = (HMENU)SendMessage((hwndCmdBar), SHCMBM_GETMENU, (WPARAM)0, (LPARAM)0);	
    }
    else
        GetLastError();
#else
	if (!(m_rghCBar[0] = CommandBar_Create(m_hInst, m_hWnd, IDC_CMDBAR)))
		return -1;
#endif

#if (_WIN32_WCE < 300)
	if (!CommandBar_InsertMenubar(m_rghCBar[0], m_hInst, m_nMenu, 0))
		return -1;
#endif
	
	HINSTANCE hInstCB = m_hInst;
	int nImages = m_nCBImages;
	if ((m_nCB == IDB_STD_SMALL_COLOR) || (m_nVB == IDB_VIEW_SMALL_COLOR))
	{
		if (m_nCB == IDB_STD_SMALL_COLOR)
			nImages += STD_PRINT + 1;
		if (m_nVB == IDB_VIEW_SMALL_COLOR)
			nImages += VIEW_NEWFOLDER + 1;

		hInstCB = HINST_COMMCTRL;
	}

	// Call client to initialize CommandBars if any
    //
	PreMenus();

#if (_WIN32_WCE == 300) 
  	if (!(m_rghCBar[1] = CommandBar_Create(m_hInst, m_hWnd, IDC_CMDBAR)))
		return -1;

    // POCKETPC HACK only way to move this toolbar for resize
    //
    int i = 0;
    while (m_rghCBar[i] && i < 5) 
        SetWindowLong(m_rghCBar[i++], GWL_STYLE, 0x56800842); 

	CommandBar_AddBitmap(m_rghCBar[1], hInstCB, m_nCB, nImages, 0, 0);
    CommandBar_AddBitmap(m_rghCBar[1], hInstCB, m_nVB, nImages, 0, 0);

	int nTbbt = CountButtons(m_prgTbbt);
	if ((nTbbt != -1) && !CommandBar_AddButtons(m_rghCBar[1], nTbbt, m_prgTbbt))
		return -1;

	int nTtip = CountTooltips(m_pprgTtip);
	if ((nTtip != -1) && !CommandBar_AddToolTips(m_rghCBar[1], nTtip, m_pprgTtip))
		return -1;
#else
	CommandBar_AddBitmap(m_rghCBar[0], hInstCB, m_nCB, nImages, 0, 0);
    CommandBar_AddBitmap(m_rghCBar[0], hInstCB, m_nVB, nImages, 0, 0);

	int nTbbt = CountButtons(m_prgTbbt);
	if ((nTbbt != -1) && !CommandBar_AddButtons(m_rghCBar[0], nTbbt, m_prgTbbt))
		return -1;

	int nTtip = CountTooltips(m_pprgTtip);
	if ((nTtip != -1) && !CommandBar_AddToolTips(m_rghCBar[0], nTtip, m_pprgTtip))
		return -1;
#endif

    // Add any additional things before Adornments
	PostMenus();

	return 0;
}
#endif

LRESULT CeMainWindow::OnCreate(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp)
{
	int nRet = 0;
#ifdef _WIN32_WCE
	// Add bands else add CommandBar
    //
	if (m_prgRbbi)
	{
		if (-1 == (nRet = AddBands()))
            return nRet;
		if (!CommandBands_AddAdornments(m_rghCBand[0], m_hInst, m_dwCBFlags, NULL))
			return -1;
	}
	else if (m_prgTbbt)
	{
		if (-1 == (nRet = AddToolbar()))
            return nRet;
		if (!CommandBar_AddAdornments(m_rghCBar[0], m_dwCBFlags, 0))
			return -1;
	}

#if (_WIN32_WCE < 300)
    // Store the hmenu away
    //
    m_hMenu = CommandBar_GetMenu(m_rghCBar[0], 0);
#endif
#endif // _WIN32_WCE

	return nRet;
}

LRESULT CeMainWindow::OnDestroy(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp)
{
#ifdef _WIN32_WCE
	// The main window needs to PostQuitMessage. Child windows must derive from
	// CeView
	PostQuitMessage(0);
	SetWindowLong(hwnd, 0, (LONG)0);	// remove the deleted this ptr

	// BUG: Remember once we delete the main window contained
	//		objects basically are deleted so we need to remove
	//		the this ptr in the window long in dtors not in
	//		OnDestroy.  It just so happens memory isn't null
	//		that is still works.
	delete this;	
#endif
	return 0;
}

#ifndef _WIN32_WCE
LRESULT CeMainWindow::OnNcDestroy(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp)
{
	// The main window needs to PostQuitMessage. Child windows must derive from
	// CeView
	PostQuitMessage(0);
	SetWindowLong(hwnd, 0, (LONG)0);	// remove the deleted this ptr

	// BUG: Remember once we delete the main window contained
	//		objects basically are deleted so we need to remove
	//		the this ptr in the window long in dtors not in
	//		OnDestroy.  It just so happens memory isn't null
	//		that is still works.
	delete this;	
	return 0;
}
#endif

//////////////////////////////////////////////////////////////////////////////
// CeView
// 
IMPLEMENT_MSG_HANDLER(CeView)
	ON_MSG(WM_DESTROY, CeView::OnDestroy)
#ifndef _WIN32_WCE
	ON_MSG(WM_NCDESTROY, CeView::OnNcDestroy)
#endif
END_IMPLEMENT_MSG()

CeView::CeView()
{
	m_prgBaseMsg = CeView_rgMsg;
}

BOOL CeView::Create(LPCTSTR lpClass, LPCTSTR lpWindow, DWORD dwStyle, int x, int y,
					int cx, int cy, HWND hParent, HMENU hMenu, HINSTANCE hInstance, LPVOID lpvoid)
{
	BOOL bRet = CeWindow::Create(lpClass, lpWindow, dwStyle, x, y, cx, cy, hParent, hMenu, hInstance, lpvoid);

	// Views are subclassed so we get all messages after wm_create
	SubClass();

	return bRet;
}

LRESULT CeView::OnDestroy(HWND hwnd, UINT uMsg, WPARAM, LPARAM)
{
#ifdef _WIN32_WCE
	// NOTE: Child windows delete itself. 
	// You must allocate on the heap!	

	// Unsubclass if necessary
	UnsubClass();

	delete this;
#endif
	return 0;
}

#ifndef _WIN32_WCE
LRESULT CeView::OnNcDestroy(HWND hwnd, UINT uMsg, WPARAM, LPARAM)
{
	// NOTE: Child windows delete itself. 
	// You must allocate on the heap!	

	// Unsubclass if necessary
	UnsubClass();

	delete this;
	return 0;
}
#endif

//////////////////////////////////////////////////////////////////////////////
// CeFormView - formview class
// 
IMPLEMENT_MSG_HANDLER(CeFormView)
	ON_MSG(WM_DESTROY, CeFormView::OnDestroy)
END_IMPLEMENT_MSG()

CeFormView::CeFormView()
{
	m_prgBaseMsg = CeFormView_rgMsg;
}

BOOL CeFormView::Create(HINSTANCE hInstance, LPCTSTR lpTemplate, HWND hParent, LPVOID lpvoid)
{
	return CeWindow::Create(hInstance, lpTemplate, hParent, lpvoid);
}

LRESULT CeFormView::OnDestroy(HWND hw, UINT um, WPARAM wp, LPARAM lp)
{
	// Need to release dialog resource for form views
	EndDialog(hw, 0);
	return 0;
}


//////////////////////////////////////////////////////////////////////////////
// CeDialog - dialog class
// 
IMPLEMENT_MSG_HANDLER(CeDialog)
	ON_MSG(WM_DESTROY, CeDialog::OnDestroy)
END_IMPLEMENT_MSG()

IMPLEMENT_CMD_HANDLER(CeDialog)
	ON_CMD(IDOK, CeDialog::OnOK)
	ON_CMD(IDCANCEL, CeDialog::OnCancel)
END_IMPLEMENT_CMD()

CeDialog::CeDialog()
{
	// Modeless - need to override this ctor
	m_fModal = FALSE;
	m_prgBaseCmd = CeDialog_rgCmd;
	m_prgBaseMsg = CeDialog_rgMsg;
}

CeDialog::CeDialog(HINSTANCE hInstance, HWND hParent, int nIDD, BOOL fModal)
{
	// Modal - need to override this ctor
	m_hInst = hInstance;
	m_hParent = hParent;
	m_nIDD = nIDD;
	m_fModal = fModal;	

	m_prgBaseCmd = CeDialog_rgCmd;
	m_prgBaseMsg = CeDialog_rgMsg;
}

LRESULT CeDialog::OnDestroy(HWND hwnd, UINT uMsg, WPARAM, LPARAM)
{
	// If we're not modal then client must delete this when done
	// 
	return 0;
}

int CeDialog::DoModal()
{
	return DialogBoxParam(m_hInst, MAKEINTRESOURCE(m_nIDD), m_hParent, 
			CeWindow::CeModalDlgProc, (LPARAM)this);
}

BOOL CeDialog::Create(HINSTANCE hInst, HWND hWnd, int nIDD, LPARAM lp)
{
	return CeWindow::Create(hInst, MAKEINTRESOURCE(nIDD), hWnd, (LPVOID)lp);
}

LRESULT CeDialog::OnCancel(HWND hctl, WORD wNotify, WORD wID)
{
	if (!m_fModal)
	{
		::DestroyWindow(m_hWnd);
		m_pCeApp->m_hActiveDlg = 0;
	}
	else
		EndDialog(m_hWnd, IDCANCEL);
	
	m_hWnd = 0;
	return 0;
}

LRESULT CeDialog::OnOK(HWND hctl, WORD wNotify, WORD wID)
{
	if (!m_fModal)
	{
		::DestroyWindow(m_hWnd);
		m_pCeApp->m_hActiveDlg = 0;
	}
	else
		EndDialog(m_hWnd, IDOK);

	m_hWnd = 0;
	return 0;
}


//////////////////////////////////////////////////////////////////////////////
// CeWinCtrl - controls class
// 
IMPLEMENT_MSG_HANDLER(CeWinCtrl)
	ON_MSG(WM_DESTROY, CeWinCtrl::OnDestroy)
#ifndef _WIN32_WCE
	ON_MSG(WM_NCDESTROY, CeWinCtrl::OnDestroy)
#endif
END_IMPLEMENT_MSG()

CeWinCtrl::CeWinCtrl()
{
	m_prgBaseMsg = CeWinCtrl_rgMsg;
}

// If a control object is contained in a window object it will get
// deleted when the wrapper object gets deleted, therefore deleting 
// contained objects first without calling OnDestroy
CeWinCtrl::~CeWinCtrl()
{
	// NOTE: CE 1.0 doesn't support GWL_USERDATA
	UnsubClass();  // just to make sure 
	::SetWindowLong(m_hWnd, GWL_USERDATA, (LONG)0);
}

LRESULT CeWinCtrl::OnDestroy(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp)
{
#ifdef _WIN32_WCE
	// We don't delete this because CeWinCtrl should be 
	// constructed on the stack as a member of a parent class

	// Need to unsubclasses
	UnsubClass();
#endif
	return 0;
}

#ifndef _WIN32_WCE
LRESULT CeWinCtrl::OnNcDestroy(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp)
{
	// We don't delete this because CeWinCtrl should be 
	// constructed on the stack as a member of a parent class

	// Need to unsubclasses
	UnsubClass();

	return 0;
}
#endif

//////////////////////////////////////////////////////////////////////////////
// CePropertySheet - Tabbed dialog
// 
IMPLEMENT_MSG_HANDLER(CePropertySheet)
END_IMPLEMENT_MSG()

IMPLEMENT_CMD_HANDLER(CePropertySheet)
END_IMPLEMENT_CMD()

CePropertySheet::CePropertySheet(HINSTANCE hInst, HWND hWnd)
{
	m_prgBaseCmd = CePropertySheet_rgCmd;
	m_prgBaseMsg = CePropertySheet_rgMsg;

	memset(&m_psh, 0, sizeof(PROPSHEETHEADER));
	m_psh.dwSize = sizeof(PROPSHEETHEADER);
	m_psh.dwFlags = PSH_PROPSHEETPAGE|PSH_USECALLBACK/*|PSH_WIZARD*/;
	m_psh.nStartPage = 0;
	m_psh.hInstance = hInst;
	m_psh.hwndParent = hWnd;
    m_psh.pfnCallback = PropSheetProc;
	
    m_hInst = hInst;
	m_nPages = 0;	
	m_hWndPsh = 0;
}

CePropertySheet::~CePropertySheet()
{
	UnsubClass(); // just to make sure 
	SetWindowLong(m_hWnd, 0, (LONG)0);	// remove the deleted this ptr
}

BOOL CePropertySheet::Create()
{
	m_psh.dwFlags &= PSH_MODELESS;
	m_psh.ppsp = m_rgpsp;
	m_psh.nPages = m_nPages;

	if ((HWND)-1 != (m_hWndPsh = (HWND)PropertySheet(&m_psh)))
		return TRUE;

	return FALSE;
}

int CePropertySheet::DoModal()
{
	m_psh.dwFlags &= ~PSH_MODELESS;
	m_psh.ppsp = m_rgpsp;
	m_psh.nPages = m_nPages;

	int nRet = PropertySheet(&m_psh);
	return nRet;
}

void CePropertySheet::AddPage(CePropertyPage* ppg)
{
	if (ppg)
		m_rgpsp[m_nPages++] = ppg->m_psp;
}

HWND CePropertySheet::m_shWnd = NULL;
INT CALLBACK CePropertySheet::PropSheetProc(HWND hwnd, UINT um, LPARAM lp)
{
    switch (um) {
    case WM_CREATE:
        m_shWnd = hwnd;
#if (_WIN32_WCE == 300)
        SHINITDLGINFO shidi;
        shidi.dwMask = SHIDIM_FLAGS;
        shidi.dwFlags = SHIDIF_DONEBUTTON | SHIDIF_SIZEDLG;
        shidi.hDlg = hwnd;
        SHInitDialog(&shidi);
#endif
        break;
	case WM_DESTROY:
		m_shWnd = NULL;
		break;
    }
    return 0;
}


//////////////////////////////////////////////////////////////////////////////
// CePropertyPage - Tabbed dialogs
//  
IMPLEMENT_MSG_HANDLER(CePropertyPage)
END_IMPLEMENT_MSG()

IMPLEMENT_CMD_HANDLER(CePropertyPage)
END_IMPLEMENT_CMD()

CePropertyPage::CePropertyPage(HINSTANCE hInst, HWND hWnd, int nIDD)
{
	m_prgBaseCmd = CePropertyPage_rgCmd;
	m_prgBaseMsg = CePropertyPage_rgMsg;

	memset(&m_psp, 0, sizeof(PROPSHEETPAGE));
	m_psp.dwSize = sizeof(PROPSHEETPAGE);
	m_psp.hInstance = hInst;
	m_psp.lParam = (LPARAM)this;

	m_psp.dwFlags = PSP_USETITLE|PSP_USECALLBACK|PSP_PREMATURE;
	m_psp.pfnCallback = PropPageProc;

	m_psp.pszTemplate = MAKEINTRESOURCE(nIDD);
	m_psp.pfnDlgProc = CeWindow::CePropPageProc;

	m_hInst = hInst;
	m_hParent = hWnd;
    m_hpsp = 0;
}

CePropertyPage::~CePropertyPage()
{
	UnsubClass(); // just to make sure 
	SetWindowLong(m_hWnd, 0, (LONG)0);	// remove the deleted this ptr
}

// Handles calling pages on create/destroy for init and ok, you can also
// init in OnInitDialog
UINT CALLBACK CePropertyPage::PropPageProc(HWND hwnd, UINT um, LPPROPSHEETPAGE ppsp)
{
	// We store the this in lparam so call via this*
	if (ppsp)
	{
		switch (um)
		{
		case PSPCB_CREATE:
			((CePropertyPage*)(ppsp->lParam))->DoCreate();
			return 1;
		case PSPCB_RELEASE:
			((CePropertyPage*)(ppsp->lParam))->DoRelease();
			return 0;
		}
	}
	return 0;
}
