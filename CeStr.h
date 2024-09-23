//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifndef _CESTR_H
#define _CESTR_H

TCHAR* shiftchars(TCHAR* pbuf, int cch);
bool IsNonWhiteSpace(TCHAR ch);
void removespaces(TCHAR* psz);
void reverse(TCHAR* pszText);
void ftot(double d, TCHAR sz[]);
TCHAR* xmlstrcpy(TCHAR* pszdst, TCHAR* pszsrc);
bool xmlstrcmp(TCHAR* pszsrc, TCHAR* pszcmp);
int xstrlen(LPCTSTR psz);
TCHAR* xstrcpy(TCHAR* pszd, LPCTSTR pszs);
TCHAR* xstrstr(TCHAR* pszstr, TCHAR* pszsubstr);
TCHAR* xstrrpl(TCHAR*& pszb, int csize, TCHAR* pszs, TCHAR* pszr);
bool xisalpha(int c);
bool xisascii(int c);
void xassert(bool exp);
void xitoa(int n, TCHAR* pszs, int nbase);
int xatoi(TCHAR* pszs);
double xatof(const TCHAR szs[]);

#endif // _CESTR_H