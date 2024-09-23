//////////////////////////////////////////////////////////////////////////////
// Ce Framework Library for Windows CE
// 
// Written by BnKSoftware Inc.
// Copyright (c) 1998-2000 
//
#ifndef _CFLMACRO_H
#define _CFLMACRO_H

// Forward decl
class CeWindow;

//////////////////////////////////////////////////////////////////////////////
// Macros for message/command handlers
//
#define dim(x) (sizeof(x) / sizeof(x[0])) 

typedef LRESULT (CeWindow::*PMSGFN)(HWND, UINT, WPARAM, LPARAM);
struct _HANDLE_MSG {
	UINT uLoMsg;
    UINT uHiMsg;
	PMSGFN Fxn;
};

typedef LRESULT (CeWindow::*PCMDFN)(HWND, WORD, WORD);
struct _HANDLE_CMD {
	WORD wLoCmd;
    WORD wHiCmd;
	PCMDFN Fxn;
};

#define IMPLEMENT_MSG_HANDLER(className) \
	const _HANDLE_MSG className##_rgMsg[] = { 
#define END_IMPLEMENT_MSG()	\
	0, 0 }; 

#define IMPLEMENT_CMD_HANDLER(className) \
	const _HANDLE_CMD className##_rgCmd[] = { 
#define END_IMPLEMENT_CMD()	\
	0, 0 }; 

#define ON_MSG(msg, handler) \
msg, msg, (LRESULT(CeWindow::*)(HWND, UINT, WPARAM, LPARAM))&handler, 

#define ON_MSG_RANGE(lomsg, himsg, handler) \
lomsg, himsg, (LRESULT(CeWindow::*)(HWND, UINT, WPARAM, LPARAM))&handler, 

#define ON_CMD(cmd, handler) \
cmd, cmd, (LRESULT(CeWindow::*)(HWND, WORD, WORD))&handler, 

#define ON_CMD_RANGE(locmd, hicmd, handler) \
locmd, hicmd, (LRESULT(CeWindow::*)(HWND, WORD, WORD))&handler, 

#define DECLARE_MSG(handler) \
	LRESULT handler(HWND, UINT, WPARAM, LPARAM)

#define DECLARE_CMD(handler) \
	LRESULT handler(HWND, WORD, WORD)

// Toolbar Buttons
#define IMPLEMENT_TBBT_RANGE(className) \
	TBBUTTON className##_rgTbbt[] = { 
#define END_IMPLEMENT_TBBT() \
	{ 0, -1, 0, 0, 0, 0 } }; 

#define RAWTBBT(bi, cmd, st, style, ud, sz) \
	{ bi, cmd, st, style, ud, sz }, 

// Toolbar Tooltips
#define TBBT(ibm, cmd) \
	{ ibm, cmd, TBSTATE_ENABLED, TBSTYLE_BUTTON, 0, 0 }, 

#define IMPLEMENT_TTIP_RANGE(className) \
	TCHAR* className##_rgTtip[] = { 
#define END_IMPLEMENT_TTIP() \
	, 0 };

// Rebar Buttons
#define IMPLEMENT_RBBI_RANGE(className) \
REBARBANDINFO className##_rgRbbi[] = { 
#define END_IMPLEMENT_RBBI() \
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };

#define RBBI(fm, fs, crf, crb, lpsz, cch, image, hwnd, cxmin, cymin, cx, hbmb, wid) \
	{ sizeof(REBARBANDINFO), fm, fs, crf, crb, lpsz, cch, image, hwnd, cxmin, cymin, cx, hbmb, wid}, 

// CFL 
#define IDC_CMDBAR	0x0032
#define IDC_CMDBAND 0x0033
// you can add more IDC_ here...

#ifdef _WIN32_WCE_EMULATION
#define CFL_ICC_ALL_CLASSES  (ICC_LISTVIEW_CLASSES|ICC_TREEVIEW_CLASSES|ICC_TAB_CLASSES|ICC_UPDOWN_CLASS|ICC_PROGRESS_CLASS|ICC_DATE_CLASSES|ICC_COOL_CLASSES)
#else
#define CFL_ICC_ALL_CLASSES  (ICC_LISTVIEW_CLASSES|ICC_TREEVIEW_CLASSES|ICC_BAR_CLASSES|ICC_TAB_CLASSES|ICC_UPDOWN_CLASS|ICC_PROGRESS_CLASS|ICC_DATE_CLASSES|ICC_COOL_CLASSES)
#endif 

#define LOADSTR(id)	(LPCTSTR)LoadString(m_hInst, id, NULL, 0)

#endif // _CFLMACRO_H