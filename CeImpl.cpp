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

int CeMainWindow::CountBands(REBARBANDINFO* prgRbbi)
{
	int nCount = -1;
	while (prgRbbi)
	{
		if (prgRbbi[++nCount].cbSize == 0)
			return nCount;
	}
	return nCount;
}

int CeMainWindow::CountButtons(TBBUTTON* prgTbbt)
{
	int nCount = -1;
	while (prgTbbt)
	{
		if (prgTbbt[++nCount].idCommand == -1)
			return nCount;
	}
	return nCount;
}

int CeMainWindow::CountTooltips(TCHAR** pprgTtip)
{
	int nCount = -1;
	while (pprgTtip)
	{
		if (pprgTtip[++nCount] == 0)
			return nCount;
	}
	return nCount;
}
