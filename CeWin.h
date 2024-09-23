//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifndef _CEWIN_H
#define _CEWIN_H

// NOTE: If you are not using Visual C++ then you may need to include a header
//		 that defines ID_APP_EXIT and comment out the line below (this is the
//		 only dependency for MFC.

// Some common resource IDs ID_APP_EXIT
#include <afxres.h>

// Ce Framework Library macros
#include "cflmacro.h"

#define MAX_BARS		5
#define MAX_BANDS		5

typedef struct _CFL_TBBUTTON {
    int         nIndex;
    TBBUTTON    tbbt;
}CFL_TBBUTTON;

typedef struct _CFL_REBARBANDINFO {
    int             nOrder;
    REBARBANDINFO   rbbi;
}CFL_REBARBANDINFO;

typedef struct _CFL_TOOLTIP {
    int         nOrder;
    TCHAR*      pszTip;
}CFL_TOOLTIP;

//////////////////////////////////////////////////////////////////////////////
// CeWindow - basic window class
//  
class CeWindow
{
public:
    CeWindow();
    virtual ~CeWindow() { }
	static LRESULT CALLBACK CeWndProc(HWND hWnd, UINT wMsg, WPARAM wParam, 
                              LPARAM lParam);
	static BOOL CALLBACK CeDlgProc(HWND hDlg, UINT wMsg, WPARAM wParam,
							  LPARAM lParam);					
	static BOOL CALLBACK CeModalDlgProc(HWND hDlg, UINT uMsg, WPARAM wParam, 
                              LPARAM lParam);
	static BOOL CALLBACK CeSubClassProc(HWND hDlg, UINT uMsg, WPARAM wParam, 
                              LPARAM lParam);
	static BOOL CALLBACK CePropPageProc(HWND hDlg, UINT wMsg, WPARAM wParam,
							  LPARAM lParam);					
	
	CeApp*		m_pCeApp;					// Ptr to user static global object (only one)
	HINSTANCE	m_hInst;
	HWND		m_hParent;
    HWND		m_hWnd;				
	BOOL		m_fMenuLoop;
	WORD		m_nMenu;
    HMENU       m_hMenu;

	// Ctrls Subclasses
	WNDPROC m_poldwp;

	// Message Pumps
	LRESULT ProcessMessage(HWND, UINT, WPARAM, LPARAM, BOOL& bProcessed);
	LRESULT LoopMsg(const _HANDLE_MSG* prg, HWND hWnd, UINT uMsg, WPARAM wParam, 
						  LPARAM lParam, BOOL& bProcessed);
	LRESULT LoopCmd(const _HANDLE_CMD* prg, HWND hCtl, WORD wNotify, WORD wID, 
						BOOL& bProcessed);

	// User handlers
	const _HANDLE_MSG*	m_prgMsg;	
	const _HANDLE_CMD*	m_prgCmd;	

	// Base handlers
	const _HANDLE_MSG*	m_prgBaseMsg; 
	const _HANDLE_CMD*	m_prgBaseCmd; 

// Helpers
public:
	BOOL CenterWindow();
	_inline BOOL ShowWindow(int nShow)								{ return ::ShowWindow(m_hWnd, nShow); }
	_inline BOOL UpdateWindow()										{ return ::UpdateWindow(m_hWnd); }
	_inline BOOL MoveWindow(int x, int y, int nwidth, int nheight, 
		BOOL brepaint)												{ return ::MoveWindow(m_hWnd, x, y, nwidth, nheight, brepaint); }

// Virtual overides
public:
	// Windows
	virtual BOOL RegisterClass(HINSTANCE hInstance, LPCTSTR lpszAppName);
	virtual BOOL Create(LPCTSTR lpClass, LPCTSTR lpWindow, DWORD dwStyle, int x, int y,
						int cx, int cy, HWND hParent, HMENU hMenu, HINSTANCE hInstance, LPVOID lpvoid);
	virtual BOOL CreateEx(DWORD dwExStyle, LPCTSTR lpClass, LPCTSTR lpWindow, DWORD dwStyle, int x, int y,
						int cx, int cy, HWND hParent, HMENU hMenu, HINSTANCE hInstance, LPVOID lpvoid);

	// Subclassing
	virtual void SubClass(HWND hWnd=0);
	virtual void UnsubClass();

	// Checkboxes Radio
	void CheckDlgButton(HWND, int, UINT);
	UINT IsDlgButtonChecked(HWND, int);

	// Menus
	virtual BOOL PreMenus()
		{ return TRUE; }
	virtual BOOL PostMenus()
		{ return TRUE; }
    virtual void RestoreBandOrder()
        { return; }

	// Dialogs/FormView
	virtual BOOL Create(HINSTANCE hInstance, LPCTSTR lpTemplate, HWND hParent, LPVOID lpvoid);

// Message handlers
public:
	// Windows
	DECLARE_MSG(OnDestroy);
#ifndef _WIN32_WCE
	DECLARE_MSG(OnNcDestroy);
#endif
	DECLARE_MSG(OnCreate);	

	// Dialogs
	DECLARE_MSG(OnInitDialog);

#ifdef _DEBUG
public:
	static UINT	m_uBreakOnMsg;	// break on this message
#endif
};

//////////////////////////////////////////////////////////////////////////////
// CeMainWindow - main window class menus, rebars, etc...
//  
class CeMainWindow : public CeWindow
{
public:
	CeMainWindow();
    virtual BOOL FVerifyPassword() = 0;
    virtual void GetHost(CHAR *szHost) = 0;
    virtual void GetPort(CHAR *szPort) = 0;

	HWND		m_rghCBar[MAX_BARS];		// Support up to 5 CommandBars
	HWND		m_rghCBand[MAX_BANDS];		// Support up to 5 Rebar bands

#ifdef _WIN32_WCE
    COMMANDBANDSRESTOREINFO m_rgcbr[MAX_BANDS]; // Band order
#endif

	int				m_nCB;
    int             m_nVB;
	int				m_nCBImages;
	DWORD			m_dwCBFlags;
	HIMAGELIST		m_hImglist;		

	// Toolbar buttons/tooltips
	TBBUTTON*		    m_prgTbbt;	
	TCHAR**		        m_pprgTtip; 
	REBARBANDINFO*		m_prgRbbi;	

// Message handlers
public:
	// Windows
	DECLARE_MSG(OnDestroy);
#ifndef _WIN32_WCE
	DECLARE_MSG(OnNcDestroy);
#endif
	DECLARE_MSG(OnCreate);	

// Implementation
protected:
	int CountBands(REBARBANDINFO* prgRbbi);
	int CountButtons(TBBUTTON* prgTbbt);
	int CountTooltips(TCHAR** pprgTtip);
	int AddBands();
	int AddToolbar();
};

//////////////////////////////////////////////////////////////////////////////
// CeView - CE doesn't have MDI so child windows/views must derive from this
//  
class CeView : public CeWindow
{
public:
	CeView();
	virtual ~CeView() {}

// Virtual overides
public:
	virtual BOOL Create(LPCTSTR lpClass, LPCTSTR lpWindow, DWORD dwStyle, int x, int y,
						int cx, int cy, HWND hParent, HMENU hMenu, HINSTANCE hInstance, LPVOID lpvoid);
	
// Message handlers
public:
	DECLARE_MSG(OnDestroy);
	DECLARE_MSG(OnNcDestroy);
};

//////////////////////////////////////////////////////////////////////////////
// CeFormView - Child windows/views must derive from this
//  
class CeFormView : public CeView
{
public:
	CeFormView();
	virtual ~CeFormView() {}

// Virtual overides
public:
	virtual BOOL Create(HINSTANCE hInstance, LPCTSTR lpTemplate, HWND hParent, LPVOID lpvoid);

// Message handlers
public:
	DECLARE_MSG(OnDestroy);
	DECLARE_MSG(OnNcDestroy);
};

//////////////////////////////////////////////////////////////////////////////
// CeDialog - Modal/Modeless dialogs
//  
class CeDialog : public CeWindow
{
public:
	CeDialog();
	CeDialog(HINSTANCE hInst, HWND hWnd, int nIDD, BOOL fModal = TRUE);
	virtual ~CeDialog() {}

	int		m_nIDD;
	BOOL	m_fModal;

// Virtual overides
public:
	virtual int DoModal();
	virtual BOOL Create(HINSTANCE hInst, HWND hWnd, int nIDD, LPARAM lp);
	
// Message handlers
public:
	DECLARE_MSG(OnDestroy);

	DECLARE_CMD(OnOK);
	DECLARE_CMD(OnCancel);
};


//////////////////////////////////////////////////////////////////////////////
// CePropertyPage - Tabbed dialogs
//  
class CePropertyPage : public CeDialog
{
public:
	CePropertyPage(HINSTANCE hInst, HWND hWnd, int nIDD);
	~CePropertyPage();
	
	virtual void DoCreate() { /*nothing*/ };
	virtual void DoRelease() { /*nothing*/ };

	static UINT CALLBACK PropPageProc(HWND hwnd, UINT um, LPPROPSHEETPAGE ppsp);
	PROPSHEETPAGE	m_psp;
    HPROPSHEETPAGE  m_hpsp;
};


//////////////////////////////////////////////////////////////////////////////
// CePropertySheet - Tabbed dialogs 
//  
class CePropertySheet : public CeWindow
{
public:
	CePropertySheet(HINSTANCE hInst, HWND hWnd);
	~CePropertySheet();
	
	PROPSHEETHEADER			m_psh;
	int						m_nPages;
	CePlex<PROPSHEETPAGE>	m_rgpsp;
	HWND					m_hWndPsh;
    static HWND             m_shWnd;
    static INT CALLBACK PropSheetProc(HWND hwnd, UINT um, LPARAM lp);
    
// Helpers
public:
	BOOL Create();
	int DoModal();

	void AddPage(CePropertyPage* ppg);

// Message handlers
public:
};

//////////////////////////////////////////////////////////////////////////////
// CeWinCtrl - Subclasses control to get all messages
//  
class CeWinCtrl : public CeWindow
{
public:
	CeWinCtrl();
	~CeWinCtrl();

// Message handlers
public:
	DECLARE_MSG(OnDestroy);
	DECLARE_MSG(OnNcDestroy);
};

#endif // _CEWIN_H

