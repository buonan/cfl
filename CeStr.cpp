//////////////////////////////////////////////////////////////////////////////
// Ce Framework Library for Windows CE
// 
// Written by BnKSoftware Inc.
// Copyright (c) 1998-2000 
// All rights reserved.
// BUG: Compile with /QMOC to use old float comparision

#include "stdafx.h"
#include <tchar.h>
#include "cestr.h"

// shifts pbuf by cch and returns insertion ptr, we 
// don't realloc 
TCHAR* shiftchars(TCHAR* pbuf, int cch)
{
	TCHAR *pr, *ps = pbuf;
	int len = xstrlen(ps);

	// shift right
	if (cch > 0)
	{
		pbuf = pbuf + len; 
		while (pbuf >= ps)
		{
			*(pbuf+cch) = *pbuf;
			pbuf--;
		}	
		return pbuf + cch + 1;
	}
	else if (cch < 0)
	{
		// shift left
		cch = -cch;
		pr = ps;
		ps = ps + len + 1; 
		while (pbuf < ps && (*(pbuf+cch-1) != TEXT('\0')))
		{
			*pbuf = *(pbuf+cch-1);
			pbuf++;
		}
		*pbuf = TEXT('\0');
		return pr;

	}
	return NULL;
}

// is lf cr hi
bool IsNonWhiteSpace(TCHAR ch)
{
	// cr == 0x0D
	// lf == 0x0A
	// |  == 0x09
	if ((ch == 0x0A) || (ch == 0x0D) || (ch == 0x09))
		return false;

	return true;
}

// is 'A'-'Z' or 'a'-'z' or '0'-'9'
bool xisalpha(int c)
{
	if ( ((unsigned)c >= 0x41 && (unsigned)c <= 0x5a) ||
		 ((unsigned)c >= 0x61 && (unsigned)c <= 0x7a) ||
		 ((unsigned)c >= 0x30 && (unsigned)c <= 0x39))
		return true;
	return false;
}

// is ascii '0x0 - 0x7F'
bool xisascii(int c)
{
	if ((unsigned)c >= 0x00 && (unsigned)c <= 0x7f)
		return true;
	return false;
}

void removespaces(TCHAR* psz)
{
	TCHAR* pszWalk = psz;
	while (pszWalk && *pszWalk != TEXT('\0'))
	{
		if (*pszWalk == TEXT('{') || *pszWalk == TEXT('}'))
			*pszWalk = TEXT(' ');
		if (*pszWalk != TEXT(' '))
			*psz++ = *pszWalk;
		*pszWalk++;
	}
	*psz++ = TEXT('\0');
}

void reverse(TCHAR* pszText)
{
	if (pszText)
	{
		int j = lstrlen(pszText) - 1;
		for (int i = 0; i < j; i++, j--)
		{
			TCHAR ch = pszText[i];
			pszText[i] = pszText[j];
			pszText[j] = ch;
		}
	}
}


void ftot(double d, TCHAR sz[])
{
#if 1
    INT Decimal = 0, Sign = 0, i = 0;
    CHAR* pBuffer = NULL;
    TCHAR szResult[255], *pNumber = NULL;

    pBuffer = _fcvt(d, 2, &Decimal, &Sign);
    MultiByteToWideChar(CP_ACP, 0, pBuffer, 255, szResult, 255); 
    pNumber = szResult;
    if (Sign)
        sz[0] = TEXT('-');
    while (pNumber && *pNumber != TEXT('\0')) {
        if (Decimal == i)
            sz[i] = TEXT('.');
        else 
            sz[i] = *pNumber++;
        i++;
    }
    sz[i] = TEXT('\0');

#else
	int bSign, i;
	bSign = (d < 0?1:0);

	// Get rid of sign
	if (bSign)
		d = -d;

	// Intentional conversion to strip out fraction to
	// get rid of .00 
	double dTemp = d*1000;
	dTemp += 0.0001;
	double Num = dTemp;
	i = 0;
	do {
		sz[i++] = (Num % 10) + TEXT('0');		
		// Put back the '.'
		if (i == 3)
			sz[i++] = TEXT('.');
	} while ((Num /=10) > 0);

	if (bSign)
		sz[i++] = TEXT('-');
	sz[i] = TEXT('\0');
	reverse(sz);
#endif    
}

// copy pszsrc to pszdst
TCHAR* xmlstrcpy(TCHAR* pszdst, TCHAR* pszsrc)
{
	TCHAR* psz = pszdst;
    while (pszsrc && *pszsrc != TEXT('\0'))
		*psz++ = *pszsrc++;

	*psz++ = TEXT('\0');	
	return pszdst;
}

// compare case sensitive pszcmp with pszsrc
bool xmlstrcmp(TCHAR* pszsrc, TCHAR* pszcmp)
{
	while (pszsrc && pszcmp && (*pszsrc != TEXT('\0')) && (*pszcmp != TEXT('\0')))
	{
		if (*pszsrc != *pszcmp)
			return false;
		pszsrc++;
		pszcmp++;
	}

	return true;
}

int xstrlen(LPCTSTR psz)
{
	int len = 0;
	while (psz && *psz != TEXT('\0'))
	{
		len++;
		psz++;
	}
	return len;
}

TCHAR* xstrcpy(TCHAR* pszd, LPCTSTR pszs)
{
	TCHAR* pszh = pszd;
	while (pszd && pszs && *pszs != TEXT('\0'))
		*pszd++ = *pszs++;

	*pszd++ = TEXT('\0');
	return pszh;
}

// find substring in string
TCHAR* xstrstr(TCHAR* pszstr, TCHAR* pszsubstr)
{
	int len = xstrlen(pszsubstr);	
	TCHAR *pszSub = pszsubstr, *pszStart = pszstr;
	TCHAR *pszMatch = NULL;

Again:
	int match = 0;
	// look for a match
	while (pszstr && *pszstr != *pszSub && *pszstr != TEXT('\0'))
		pszstr++;
	
	pszStart = pszstr;

	if (pszstr && *pszstr != TEXT('\0'))
	{
		while (pszstr && *pszstr != TEXT('\0') && *pszSub != TEXT('\0') && *pszstr == *pszSub)
		{
			match++;
			pszstr++;
			pszSub++;
		}

		// check if equal size
		if (match != len)
		{
			pszSub = pszsubstr;
			goto Again;
		}
		if (match == len)
			pszMatch = pszStart;
	}

	return pszMatch;
}

// replace a substring, shift chars if necessary
TCHAR* xstrrpl(TCHAR*& pszb, int csize, TCHAR* pszs, TCHAR* pszr)
{
	int blen, rlen, slen;
	blen = csize;

	rlen = xstrlen(pszr);
	slen = xstrlen(pszs);

Again:
	TCHAR* psz = xstrstr(pszb, pszs);	
	
	int len = rlen;

	if (psz && rlen <= slen)
	{
		while (psz && len--)
		{
			*psz++ = *pszr++;
			slen--;
		}
		// shift left
		shiftchars(psz, -slen-1);
	}
	else if (psz)
	{
		// check if extends csize
		int cgrow = rlen-slen;
		if (xstrlen(pszb) + cgrow + 1 > (int)csize)
		{
			cgrow += xstrlen(pszb) + 1;
			TCHAR* pszTemp = new TCHAR[cgrow+1];
			xstrcpy(pszTemp, pszb);
			delete pszb;
			pszb = new TCHAR[cgrow];
			xstrcpy(pszb, pszTemp);
			delete pszTemp;
			csize = cgrow;
			goto Again;
		}
		// shift right
		shiftchars(psz, rlen-slen);
		while (psz && len--)
		{
			*psz++ = *pszr++;
			slen--;
		}
	}
	return psz;
}

void xitoa(int n, TCHAR* pszs, int nbase)
{
}

int xatoi(TCHAR* pszs)
{
    return 0;
}

double xatof(const TCHAR sz[])
{
	double val, power;
	int i = 0, sign;
	sign = (sz[i] == TEXT('-'))?-1:1;
	if (sz[i] == TEXT('-') || sz[i] == TEXT('+'))
		i++;
	for (val = 0.0; _istdigit(sz[i]); i++)
		val = 10.0 * val + (sz[i] - TEXT('0'));
	if (sz[i] == TEXT('.'))
		i++;
	for (power = 1.0; _istdigit(sz[i]); i++)
	{
		val = 10.0 * val + (sz[i] - TEXT('0'));
		power *= 10.0;
	}
	return sign * val / power;
}

