//////////////////////////////////////////////////////////////////////////////
// Ce Framework Library for Windows CE
// 
// Written by BnKSoftware Inc.
// Copyright (c) 1998-2000 
// All rights reserved.
// BUG: Compile with /QMOC to use old float comparision
#include "stdafx.h"
#include "cesocket.h"
#include "cecrypt.h"
#include "cexml.h"
#include "ceapp.h"
#include "ceplex.h"
#include "cewin.h"
#include "ceute.h"
#include "cestr.h"

#include <math.h>

//////////////////////////////////////////////////////////////////////////////
// Date calculator - represented as mm/yyyy
//
struct Date
{
	TCHAR*		m_pszDate;
	int			m_nMonth;
	int			m_nYear;

	Date(int nMonth, int nYear);
	Date(TCHAR* pszMonth, TCHAR* pszYear);
	Date();
	~Date();

// Operations
	BOOL operator <(Date date);
	BOOL operator >(Date date);

	BOOL operator <(Date* pdate);
	BOOL operator >(Date* pdate);

	void operator =(Date date);
	void operator =(TCHAR* psz);
	void operator +=(int nMonth);
	operator TCHAR*();

// Methods
	Date AddMonth(int nAddMo);
	Date AddYear(int nAddYr);

// Conversions
	TCHAR* GetDate();
	BOOL SetDate(TCHAR* pszMonth, TCHAR* pszYear);
	BOOL SetDate(TCHAR* pszDate);	// "mm/yyyy"
};

Date::Date(int nMonth, int nYear)
{
	m_pszDate = 0;
	m_nMonth = nMonth;
	m_nYear = nYear;
}

Date::Date(TCHAR* pszMonth, TCHAR* pszYear)
{
	SetDate(pszMonth, pszYear);
}

Date::Date()
{
	m_pszDate = 0;
	m_nMonth = 0;
	m_nYear = 0;
}

Date::~Date()
{
	if (m_pszDate)
		delete m_pszDate;
	m_pszDate = 0;
}

BOOL Date::operator<(Date date)
{
	BOOL bRet = FALSE;
	if (m_nYear < date.m_nYear)
		bRet = TRUE;
	else if (m_nYear == date.m_nYear)
	{
		if (m_nMonth < date.m_nMonth)
			bRet = TRUE;
	}
	return bRet;
}

BOOL Date::operator>(Date date)
{
	BOOL bRet = FALSE;
	if (m_nYear > date.m_nYear)
		bRet = TRUE;
	else if (m_nYear == date.m_nYear)
	{
		if (m_nMonth > date.m_nMonth)
			bRet = TRUE;
	}
	return bRet;
}

BOOL Date::operator<(Date* pdate)
{
	if (pdate->m_nYear < m_nYear && pdate->m_nMonth < m_nMonth)
		return TRUE;
	return FALSE;
}

BOOL Date::operator>(Date* pdate)
{
	if (pdate->m_nYear > m_nYear && pdate->m_nYear > m_nYear)
		return TRUE;
	return FALSE;
}

void Date::operator=(Date date)
{
	m_nMonth = date.m_nMonth;
	m_nYear = date.m_nYear;
}

void Date::operator =(TCHAR* psz)
{
	SetDate(psz);
}

Date::operator TCHAR*()
{
	return GetDate();
}

void Date::operator +=(int nMonth)
{
	AddMonth(nMonth);
}

Date Date::AddMonth(int nAddMo)
{
	m_nMonth += nAddMo;
	if (m_nMonth > 12)
	{
		AddYear(1);
		m_nMonth -= 12;
	}	
	return *this;
}

Date Date::AddYear(int nAddYr)
{
	m_nYear += nAddYr;
	return *this;
}

TCHAR* Date::GetDate()
{
	TCHAR szMonth[3] = { TEXT('\0') };
	xitoa(m_nMonth, szMonth, 10);
	TCHAR szYear[5] = { TEXT('\0') };
	xitoa(m_nYear, szYear, 10);	
	m_pszDate = new TCHAR[8]; // "mm/yyyy"
	lstrcpy(m_pszDate, TEXT(""));
	lstrcat(m_pszDate, szMonth);
	lstrcat(m_pszDate, TEXT("/"));
	lstrcat(m_pszDate, szYear);

	// freed in dtor
	return m_pszDate;
}

BOOL Date::SetDate(TCHAR* pszMonth, TCHAR* pszYear)
{
	TCHAR szMonth[3] = { TEXT('\0') };;
	TCHAR szYear[5] = { TEXT('\0') };;

	int i = 0;
	while (pszMonth && *pszMonth)
		szMonth[i++] = *pszMonth++;
	m_nMonth = xatoi(szMonth);

	i = 0;
	while (pszYear && *pszYear)
		szYear[i++] = *pszYear++;
	m_nYear = xatoi(szYear);

	return TRUE;
}

BOOL Date::SetDate(TCHAR* pszDate)
{
	TCHAR* psz = pszDate;

	TCHAR szMonth[3] = { TEXT('\0') };;
	TCHAR szYear[5] = { TEXT('\0') };;
	int i = 0;
	while (psz && *psz != TEXT('/'))
		szMonth[i++] = *psz++;
	m_nMonth = xatoi(szMonth);
	psz++;
	i = 0;
	while (psz && *psz)
		szYear[i++] = *psz++;
	m_nYear = xatoi(szYear);

	return TRUE;
}

//////////////////////////////////////////////////////////////////////////////
// Mathematical Calculator borrowed from Bjarne Stroupstrup's C++
//
enum Token_value {
	NUMBER,
	END,
	PLUS = TEXT('+'),
	MINUS = TEXT('-'),
	MUL = TEXT('*'),
	DIV = TEXT('/'),
	PRINT = TEXT(';'),
	TLP = TEXT('('),
	TRP = TEXT(')'),
    POWER = TEXT('^'),
    LOG = TEXT('!'),
    SQRT = TEXT('#'),
    EXPN = TEXT('$')
};

double expr(bool get);
double prim(bool get);
double term(bool get);
double cerror(const TCHAR* s);

Token_value curr_tok = PRINT;
double number_value;
int nerrors = 0; 
TCHAR* gpszExpr = NULL;

// copy number from pszSrc to pszDst
//
void strnumcpy(double& d, TCHAR*& pszSrc)
{
	TCHAR szDst[255];
	int i = 0;
	// 0-9 and .
	while (pszSrc && ((*pszSrc >= 0x30) && (*pszSrc <=0x39) || *pszSrc == 0x2e))
		szDst[i++] = *pszSrc++;
	szDst[i++] = TEXT('\0');
	d = xatof(szDst);
}

Token_value get_token()
{
	TCHAR ch = 0;
	ch = *gpszExpr++;	
	switch (ch) {
	case 0:
		return curr_tok=END;
    case TEXT('$'):     // EXPN
    case TEXT('#'):     // SQRT
    case TEXT('!'):     // LOG
    case TEXT('^'):     // POWER
	case TEXT(';'):
	case TEXT('*'):
	case TEXT('/'):
	case TEXT('+'):
	case TEXT('-'):
	case TEXT('('):
	case TEXT(')'):
	case TEXT('='):
		return curr_tok=Token_value(ch);
    case TEXT('.'):
	case TEXT('0'): case TEXT('1'): case TEXT('2'): case TEXT('3'): case TEXT('4'):
	case TEXT('5'): case TEXT('6'): case TEXT('7'): case TEXT('8'): case TEXT('9'):
		gpszExpr--;
		strnumcpy(number_value, gpszExpr);		
		return curr_tok=NUMBER;
	}

	return curr_tok=END;
}

double prim(bool get)
{
	if (get)
		get_token();
	switch (curr_tok) {
	case NUMBER:
		{
			double v = number_value;
			get_token();
			return v;
		}
	case MINUS:
		return -prim(true);
	case TLP:
		{
			double e = expr(true);
			if (curr_tok != TRP)
				return cerror(TEXT(") expected"));
			get_token();	// eat ')'
			return e;
		}
	default:
		return cerror(TEXT("primary expected"));
	}
}

double term(bool get)
{
	double left = prim(get);
	for (;;)
		switch (curr_tok) {
		case MUL:
			left *= prim(true);
			break;
		case DIV:
			if (double d = prim(true)) {
				left /= d;
				break;
			}
			return cerror(TEXT("divide by 0"));
        case POWER:
            left = pow(left, prim(true));
            break;
        case LOG:
            return left = log(left);
        case SQRT:
            return left = sqrt(left);
        case EXPN:
            return left = exp(left);
		default:
			return left;
		}
}

double expr(bool get)
{
	double left = term(get);
	for (;;)
		switch (curr_tok) {
		case PLUS:
			left += term(true);
			break;
		case MINUS:
			left -= term(true);
			break;
		default:
			return left;
		}
}

double cerror(const TCHAR* s)
{
	nerrors++;
	return 1;
}


void swap(int rg[], int i, int j)
{
	int t = rg[i];
	rg[i] = rg[j];
	rg[j] = t;
}

// for each element j swap if  (j-1 gt j)
void bubble(int rg[], int n)
{
	int i, j;
	for (i=n; i>=0; i--)
		for (j=1; j<=i; j++)
			if (rg[j-1] > rg[j])
				swap(rg, j-1, j);
}

// 
void selection(int rg[], int n)
{
	int i, j, min;
	for (i=0; i<n; i++)
	{
		min = i;
		for (j=i+1; j<=n; j++)
			if (rg[j] < rg[min])
				min = j;
			swap(rg, min, i);
	}
}

void insertion(int rg[], int n)
{
	int i, j, item;
	for (i=1; i<=n; i++)
	{
		item = rg[i]; j=i;
		while (j>0 && rg[j-1] > item)
		    { rg[j] = rg[j-1]; j--; }
		rg[j] = item;
	}
}

// pszText will be "cnn stock price:{Last:*}"
//
void GetAttributeName(TCHAR* pszText, TCHAR* pszAttributeName)
{
	while (pszText && *pszText != TEXT(':') && *pszText != TEXT('{') && *pszText != TEXT('\0') && *pszText != TEXT('>'))
		*pszAttributeName++ = *pszText++;
	*pszAttributeName++ = TEXT('\0');
}

// pszText will be "msn stock price:{Last*}"
//
void GetRegularExpression(TCHAR* pszText, TCHAR* pszRegularExpression)
{
	while (pszText && *pszText != TEXT('{') && *pszText != TEXT('\0'))
		pszText++;

	if (*pszText == TEXT('\0'))
		goto Exit;

	pszText++;
	while (pszText && pszRegularExpression && *pszText != TEXT('\0') && *pszText != TEXT('}') && *pszText != TEXT('>'))
		*pszRegularExpression++ = *pszText++;
Exit:
	*pszRegularExpression++ = TEXT('\0');
}


// StripTags() rips through a buffer and removes HTML tags from it.
// The function uses a static variable to remember its state in case
// a HTML tag spans a buffer boundary.
//
void StripTags(LPTSTR pszBuffer)
{
	static BOOL bInTag = FALSE;
	static BOOL bInLiteral = FALSE;
	LPTSTR pszSource = pszBuffer;
	LPTSTR pszDest = pszBuffer;

	while (*pszSource != TEXT('\0'))
	{
		if (bInTag)
		{
			if (*pszSource == TEXT('>'))
				bInTag = FALSE;
			pszSource++;
		}
		else if (bInLiteral)
		{
			if (*pszSource == TEXT(';'))
				bInLiteral = FALSE;
			else if (*pszSource == TEXT('<'))
			{
				bInLiteral = FALSE;
				pszSource--;
			}
			pszSource++;
		}
		else
		{
			if (*pszSource == TEXT('<'))
				bInTag = TRUE;
			else if (*pszSource == TEXT('&'))
				bInLiteral = TRUE;
			else
			{
				*pszDest = *pszSource;
				pszDest++;
			}
			pszSource++;
		}
	}
	*pszDest = TEXT('\0');
}

// what we should really do is try parsing the
// html and if content has changed throw exception and
// leave html un-modified
//
void MyHtmlParser(TCHAR* pszAttr, TCHAR* pszRegExpr, TCHAR* pszHtml)
{
	// use the Regular Expression to parse and find the data in Html
	StripTags(pszHtml);
	return;
}

//////////////////////////////////////////////////////////////////////////////
// Universal Engine - parses custom attributes and uses appropriate 
//					  calculator
//
CeUteCalc::CeUteCalc(XMLDocument* pDocument, CeMainWindow* pWindow) 
{
	m_pDocument = pDocument;
    m_pMainWindow = pWindow;
	m_pszExpr = 0;
	pfParseHtml = NULL; // MyHtmlParser;	// our defined html parser
}

// TODO: major, because we can only get at elements that are already parsed
//		 we cannot access elements that are not yet in the tree.  Thus 
//		 leads to pre-parsing first, then walk the tree and calculate.
//
bool CeUteCalc::Parse()
{
	XMLNode* pnode = m_pDocument->getChildren();
	RecurseChild(pnode);
	return true;
}

void CeUteCalc::ProcessNode(XMLNode* pSibling)
{
    if (pSibling) {

	    // If its an attribute see if its one we need to process
        //
	    if (pSibling->getType() == attrib) {
            
            if (!lstrcmp(pSibling->getTagName(), TEXT("hsrc"))) {
	            // hsrc url link
                //
			    Hsrc(pSibling->m_pParent, pSibling->m_pParent->getText());
			    if (pfParseHtml)
			    {
				    TCHAR szAttributeName[255];
				    TCHAR szRegularExpression[255];

				    // separate the regular expression from the attribute name
				    GetAttributeName(pSibling->getText(), szAttributeName);
				    GetRegularExpression(pSibling->getText(), szRegularExpression);
				    
				    // if supplied a parser
				    if (pfParseHtml)
					    pfParseHtml(szAttributeName, szRegularExpression, 
                                    pSibling->m_pParent->getText());
			    }
            }
            else if (!lstrcmp(pSibling->getTagName(), TEXT("calc"))) {
	            // calculation
                //
                if (!((pSibling->getParent())->getParent())->isType(TEXT("total"))) {
				    pSibling->m_pParent->copyText(pSibling->getText());
				    if (Calc(pSibling, pSibling->m_pParent->getText()))
				    {
					    TCHAR szResult[255];
					    gpszExpr = pSibling->m_pParent->getText();
					    removespaces(gpszExpr);

					    // Calculate                        
                        get_token();                            

					    ftot(expr(false), szResult);
					    pSibling->m_pParent->copyText(szResult);
				    }
                }
            }
            else if (!lstrcmp(pSibling->getTagName(), TEXT("counter"))) {           
	            // counter
                // BUG: This only works if the counter is the first column!
                //
                int nth = 1;
                XMLNode* pNode = pSibling->m_pParent;
                while (pNode && !pNode->isType(TEXT("list")) && 
                      !pNode->isType(TEXT("clist")) && pNode->m_pParent!= NULL)
                    pNode = pNode->m_pParent;

                pNode = pNode->getChildren();
                while (pNode = pNode->getSibling()) {
                    if (pNode != pSibling->m_pParent) {
                        if (pNode->getType() == tag)
                            nth++;
                    }
                    else {
                        TCHAR szCount[25];
                        _itow(nth, szCount, 10);
                        pNode->copyText(szCount);
                    }
                }
		    }
        }
        else if (pSibling->isType(TEXT("total"))) {
	        // total
            // BUG: This only works if the total is the last row!
            //
			if (Total(pSibling, pSibling->getText()))
			{
				TCHAR szResult[255];
				gpszExpr = pSibling->getText();
				removespaces(gpszExpr);

				// Calculate total
				get_token();			
				ftot(expr(false), szResult);
				pSibling->copyText(szResult);
			}
		}
        else if (pSibling->isType(TEXT("password"))) {
            m_pMainWindow->FVerifyPassword();
		}
        else if (pSibling->isType(TEXT("date"))) {           
            if (!lstrlen(pSibling->getText())) {
                TCHAR szDate[MAX_PATH];
                SYSTEMTIME st;
                GetSystemTime(&st);
                wsprintf(szDate, TEXT("%d/%d%/%d"), st.wMonth, st.wDay, st.wYear);
                pSibling->copyText(szDate);
            }
		}
    }
}

// RecurseChild walks down the childrens/siblings  
// This doesn't do well for huge files we stack-overflow 
//
#ifndef RECURSIVE
void CeUteCalc::RecurseChild(XMLNode* pChild)
{
    XMLNode* pSibling = NULL;

	if (pChild) {        
        ProcessNode(pChild);
        RecurseChild(pChild->getChildren());
        RecurseChild(pChild->getSibling());
	}
}
#else
void CeUteCalc::RecurseChild(XMLNode* pSibling)
{
	if (pSibling)
	{
		// TODO: we're only calculating 'calc' attributes
		switch(pSibling->getType())
		{
		case tag:
			break;

		// hsrc url link
		case hsrc:
			{
				Hsrc(pSibling->m_pParent, pSibling->m_pParent->getText());
				if (pfParseHtml)
				{
					TCHAR szAttributeName[255];
					TCHAR szRegularExpression[255];

					// separate the regular expression from the attribute name
					GetAttributeName(pSibling->getText(), szAttributeName);
					GetRegularExpression(pSibling->getText(), szRegularExpression);
					
					// if supplied a parser
					if (pfParseHtml)
						pfParseHtml(szAttributeName, szRegularExpression, pSibling->m_pParent->getText());
				}
			}
			break;

		// calculation
		case calc:
			{
				if (!lstrlen(pSibling->m_pParent->getText())) {
					pSibling->m_pParent->copyText(pSibling->getText());
					if (Calc(pSibling, pSibling->m_pParent->getText()))
					{
						TCHAR szResult[255];
						gpszExpr = pSibling->m_pParent->getText();
						removespaces(gpszExpr);

						// Calculate
						get_token();			
						ftot(expr(false), szResult);
						pSibling->m_pParent->copyText(szResult);
					}
				}
			}
			break;
		
		// total
		case total:
			{
				if (Total(pSibling->m_pParent, pSibling->m_pParent->getText()))
				{
					TCHAR szResult[255];
					gpszExpr = pSibling->m_pParent->getText();
					removespaces(gpszExpr);

					// Calculate total
					get_token();			
					ftot(expr(false), szResult);
					pSibling->m_pParent->copyText(szResult);
				}
			}
			break;

		default:
			break;
		}

		RecurseChild(pSibling->getChildren());
		RecurseChild(pSibling->getSibling());
	}
}
#endif

// search for pszSrc in pszDst and replace with pszRpl
void replace_string(TCHAR* pszDst, TCHAR* pszSrc, TCHAR* pszRpl)
{
	// TCHAR* pszBuffer = NULL;
	int nLen = 0;
	if (nLen = lstrlen(pszDst)) {
		// pszBuffer = new TCHAR[nLen + 1];
		if (1 /*pszBuffer*/)
		{
			// xstrcpy(pszBuffer, pszDst);
			TCHAR* pszTemp = xstrrpl(pszDst /*pszBuffer*/, xstrlen(pszDst) /*xstrlen(pszBuffer)*/, 
				pszSrc, pszRpl);
			while (pszTemp)
				pszTemp = xstrrpl(pszDst /*pszBuffer*/, xstrlen(pszDst) /*xstrlen(pszBuffer)*/, 
				pszSrc, pszRpl);
		}
	}
	return;
}

// calculate 'calc' attributes <value calc=1>
bool CeUteCalc::Calc(XMLNode* pNode, TCHAR* pszExpr)
{
	int cLast = 0;
	bool fCalc = false;
	
	while (pNode && pszExpr && (*pszExpr == TEXT('{')) && (pszExpr[cLast] != TEXT('\0')))
	{
		XMLNode* pParent = pNode->m_pParent;

        if (pParent)
            pParent = pParent->m_pParent;

		// TODO: we could make this parsing a lot faster which would reduce the 
		//		 xmlstrcmp
		while (pszExpr && pszExpr[cLast] != TEXT('\0'))
		{
			int i = 0;
			TCHAR szElement[255] = TEXT("");
			szElement[i++] = TEXT('{');

			// skip ahead until alpha
			while (pszExpr && pszExpr[cLast] != TEXT('\0') && (!xisalpha(pszExpr[cLast])))
				cLast++;

			// okay now we should be at a valid string
			while (pszExpr && (xisalpha(pszExpr[cLast])))
				szElement[i++] = pszExpr[cLast++];

			// in case we're at the end break out
			if (pszExpr[cLast] == TEXT('\0'))
				break;

			szElement[i++] = TEXT('}');
			szElement[i++] = TEXT('\0');
						
			// TODO: we make one extra search which is not necessary
			XMLNode* pElement = pParent->getElement(szElement);
			if (pElement)
			{
				replace_string(pszExpr /*pNode*/, szElement, pElement->getText());

				// Reset our last expression pointer for recursive calculations
				//pszExpr = pNode->getText();
				cLast = 0;
				fCalc = true;
			}
			else if (pElement = pNode->getChildren()) {
				// Try 1 down tree
				pElement = pElement->getSibling();
				if (pElement && (pElement = pElement->getElement(szElement)))
				{
					replace_string(pszExpr /*pNode*/, szElement, pElement->getText());

					// Reset our last expression pointer for recursive calculations
					pszExpr = pNode->getText();
					cLast = 0;
					fCalc = true;
				}
			}
			else if (pElement = pParent->m_pParent)
			{
				// Try 1 up tree
				pElement = pElement->getElement(szElement);
				if (pElement)
				{
					replace_string(pszExpr /*pNode*/, szElement, pElement->getText());

					// Reset our last expression pointer for recursive calculations
					//pszExpr = pNode->getText();
					cLast = 0;
					fCalc = true;
				}
				else if (pElement = pParent->getChildren())
				{
					// Try 1 down tree
					pElement = pElement->getSibling();
					if (pElement && (pElement = pElement->getElement(szElement)))
					{
						replace_string(pszExpr /*pNode*/, szElement, pElement->getText());

						// Reset our last expression pointer for recursive calculations
						//pszExpr = pNode->getText();
						cLast = 0;
						fCalc = true;
					}
				}
			}

			cLast++;
		}
	}
	return fCalc;
}

bool CeUteCalc::Counter(XMLNode* pNode, TCHAR* pszExpr)
{
    return TRUE;
}

void CeUteCalc::ResetValues(XMLNode* pNode)
{
    while (pNode) {
        pNode->copyText(TEXT(""));
        pNode = pNode->getSibling();
    }
}

// calculate total 'total' attributes <value total=1>
bool CeUteCalc::Total(XMLNode* pNode, TCHAR* pszExpr)
{
    XMLNode* pElement = NULL;

    if (!pNode || !pszExpr)
        return false;

    // Always erase what's in total node to start with
    //
    ResetValues(pNode->getChildren());

	pElement = pNode->getParent();
	if (pElement)
		pElement = pElement->getChildren();

	// Calculate totals
	while (pElement && (pElement = pElement->getSibling()) && (pElement != pNode)) 
    {
		// We only calculate if there's a calc attribute
		if (pNode->isType(TEXT("calc")))
            CalcChild(pElement, pNode);

		// sub calculate
		XMLNode* pChild1 = pElement->getChildren();
		XMLNode* pChild2 = pNode->getChildren();

		if (pChild2)
			pChild2 = pChild2->getSibling();
		
		while (pChild1 && pChild2) {

			// We only calculate if there's a calc attribute
			if (pChild2->isType(TEXT("calc")))
                CalcChild(pChild1, pChild2);
		
			pChild1 = pChild1->getSibling();
			pChild2 = pChild2->getSibling();
		}
	}

	return true;
}

void CeUteCalc::CalcChild(XMLNode* pElement, XMLNode* pNode)
{
	TCHAR szSum[255];

	double d1 = xatof(pElement->getText());
	double d2 = xatof(pNode->getText());
	double d3 = d1 + d2;
	ftot(d3, szSum);
	pNode->copyText(szSum);
}

// Parses 
//
bool ParseRequest(CHAR *pszHttpRequest, CHAR *pszUrl)
{
    CHAR *pTemp = NULL;
    if (pszUrl && pszHttpRequest && (pTemp = strstr(pszHttpRequest, "//"))) 
    {
        if (pTemp) {
            pTemp += 2;
            while (pTemp && *pTemp != '\0' && *pTemp != '}') {
                *pszUrl++ = *pTemp++;
            }
            *pszUrl++ = '\0';
            return true;
        }
    }
    return false;
}

bool ParseHost(CHAR *pszHttpRequest, CHAR *pszUrl)
{
    CHAR *pTemp = pszHttpRequest;
    if (pTemp) {
        while (pTemp && *pTemp != '\0' && *pTemp != '/') {
            *pszUrl++ = *pTemp++;
        }
        *pszUrl++ = '\0';
        return true;
    }
    return false;
}

#define HTTP_DIRECT_REQUEST "%s /%s HTTP/1.0\r\nAccept: text/plain, text/html\r\nContent-type: application/html-form-urlencoded\r\n\r\n"
#define HTTP_PROXY_REQUEST "%s http://%s HTTP/1.0\r\nAccept: text/plain, text/html\r\nContent-type: application/html-form-urlencoded\r\n\r\n"

CHAR* SocketRead(CHAR* strMethod, CHAR* strHost, CHAR* strPort, CHAR* strUrl)
{
	SOCKET  sSocket;
	DWORD   dwError = 0;
	WORD    wVersionRequested;
	WSADATA wsaData;
	BOOL    fGetMethod = TRUE;
    CHAR    strData[4096] = "\0";
    CHAR    *pszData = NULL;
    INT     nPort = 80;

	// Initialize Winsock
	int err;
 	wVersionRequested = MAKEWORD( 2, 2 );
 	err = WSAStartup( wVersionRequested, &wsaData );
	
	if (sSocket = socket(AF_INET, SOCK_STREAM, 0)) {
		HOSTENT* phost = NULL;

        // Make sure defaults are set
        if (strlen(strHost) == 0)
            ParseHost(strUrl, strHost);
        if (0 == (nPort = atoi(strPort)))
            nPort = 80;
            
		// Step 1: Make connection
		//
        if (phost = gethostbyname(strHost)) {
			SOCKADDR_IN sa;
			sa.sin_family = AF_INET;
			sa.sin_port = htons(nPort);
			sa.sin_addr.s_addr = ((LPIN_ADDR)phost->h_addr)->s_addr;
			if (SOCKET_ERROR != (dwError = connect(sSocket, (LPSOCKADDR)&sa, sizeof(sa)))) {
				CHAR szBuf[4096];
                INT  cBufSize = sizeof(szBuf)/sizeof(szBuf[0]);

			    // Step 2: Send 
                if (!strstr(strUrl, "www")) {                
				    CHAR *pstrQuery = new CHAR[strlen(HTTP_DIRECT_REQUEST) + strlen(strMethod) + strlen(strUrl) + 1];                
				    //sprintf(pstrQuery, HTTP_DIRECT_REQUEST, strMethod, strUrl);
				    send(sSocket, pstrQuery, strlen(pstrQuery), 0);
                    delete pstrQuery;
                }
                else {
				    CHAR *pstrQuery = new CHAR[strlen(HTTP_PROXY_REQUEST) + strlen(strMethod) + strlen(strUrl) + 1];                
				    //sprintf(pstrQuery, HTTP_PROXY_REQUEST, strMethod, strUrl);
				    send(sSocket, pstrQuery, strlen(pstrQuery), 0);
                    delete pstrQuery;
                }

				// Step 3: Read result
				FD_SET  fd;
				FD_ZERO(&fd);
				FD_SET(sSocket, &fd);
				TIMEVAL timeout = { 15, 0 };
				int cReceived, cTotal = 0;

				// While there's more data 
				//
				while (SOCKET_ERROR != (dwError = select(0, &fd, NULL, NULL, &timeout)) && 
					  (0 != dwError)) 
				{
                    memset(szBuf, 0, cBufSize);
					if (SOCKET_ERROR != (cReceived = recv(sSocket, szBuf, cBufSize, 0))) {
						// Save data
						strcat(strData, szBuf);
					}

					// Break out if nothing read in!
					if (cReceived == 0 || cReceived == -1)
						break;
				}

                // Copy it to return buffer if not empty
                //
                if (strlen(strData)) {
                    pszData = new CHAR[strlen(strData) + sizeof(CHAR)];
                    strcpy(pszData, strData);
                }
			}
			else
				dwError = WSAGetLastError();
		}
		else
			dwError = WSAGetLastError();

		// Step 4: Shutdown
		shutdown(sSocket, 1);
		closesocket(sSocket);
	}
	else
		dwError = WSAGetLastError();

	// Uninitialize Winsock
	WSACleanup();

    // Return the data
    return pszData;
}

// download the html page given '{http://bnk_soft:80/qs2.cnnfn.com/tq/stockquote?symbols=msft}'
TCHAR* DownloadHtmlPage(CHAR *pszHost, CHAR *pszPort, XMLNode *pNode)
{
    CHAR szHttpRequest[MAX_PATH] = "\0", 
         szHost[MAX_PATH] = "\0", szUrl[MAX_PATH] = "\0";
    TCHAR *pReturn = NULL;
    XMLNode *pElement = pNode->getChildren();
    XMLNode *pHsrc = pElement->getElement(_T("hsrc"));
    TCHAR *pszHttp = pHsrc->getText();
    wcstombs(szHttpRequest, pszHttp, lstrlen(pszHttp) * sizeof(TCHAR));
    if (ParseRequest(szHttpRequest, szUrl)) {        
        ParseRequest(pszHost, szHost);
        CHAR* pszData = SocketRead("GET", szHost, pszPort, szUrl); 
        if (pszData && strstr(pszData, "Error")) {
            delete pszData;
            return NULL;
        }
        else if (pszData) {
            CHAR* pszPrice = strstr(pszData, "\r\n\r\n");
            pszPrice += 4;
            pReturn= new TCHAR[strlen(pszPrice) + 1];
            mbstowcs(pReturn, pszPrice, strlen(pszPrice) + 1);
            delete pszData;
        }
    }
    return pReturn;
}

// Grab the href html page and replace the text with it
bool CeUteCalc::Hsrc(XMLNode* pNode, TCHAR* pszExpr)
{
    CHAR szHost[MAX_PATH], szPort[MAX_PATH];
	bool fHttpSrc = false, fCalc = false;
	int  cLast = 0;
    if (m_pMainWindow) {
        m_pMainWindow->GetHost(szHost);
        m_pMainWindow->GetPort(szPort);
	    TCHAR* pszHtml = DownloadHtmlPage(szHost, szPort, pNode);
	    if (pszHtml)
	    {
		    lstrcpy(pszExpr, pszHtml);

            // Set the node which contains the hsrc attribute
            //
		    pszExpr = pNode->getText();
		    delete pszHtml;
		    return (fHttpSrc = true);
	    }
    }
	return fHttpSrc;
}

// Parses sub expressions {{stocks}*{price}}
bool CeUteCalc::SubExprParse(XMLNode* pNode, TCHAR* pszSubExpr)
{
	// TODO: we make one extra search which is not necessary
	XMLNode* pParent = pNode->m_pParent;
	XMLNode* pElement = pParent->getElement(pszSubExpr);
	if (pElement)
	{
		int i, cLast;
		TCHAR szElement[255];
		i = cLast = 0;
		szElement[i++] = TEXT('{');
		while (xisascii(pszSubExpr[cLast]) && pszSubExpr[cLast] != TEXT('\0'))
		{
			if (xisalpha(pszSubExpr[cLast]))
				szElement[i++] = pszSubExpr[cLast];			
			cLast++;
		}
		szElement[i++] = TEXT('}');
		szElement[i++] = TEXT('\0');
		replace_string(pszSubExpr /*pNode*/, szElement, pElement->getText());
		return true;
	}
	return false;
}