//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifndef _CEUTE_H
#define _CEUTE_H

//////////////////////////////////////////////////////////////////////////////
// Namespace CeUte - Universal Tracking Engine
//					 What you can't do in Excel you can with UTE
//					 Excel cannot track dynamic web data.  
//					 Excel cannot notify you when an event has happened.
//					 Excel cannot download live data from the internet,
//					  parse it and calculate the result for you.


void bubble(int rg[], int n);
void selection(int rg[], int n);
void insertion(int rg[], int n);

//////////////////////////////////////////////////////////////////////////////
// CeUteCalc - Engine for Math Calculations
//
class CeUteCalc
{
public:
	CeUteCalc(XMLDocument* pDocument, CeMainWindow* pMainWindow);
	bool Parse();							// parses everything
    void ProcessNode(XMLNode* pSibling);

private:
	XMLDocument*	m_pDocument;
	TCHAR*			m_pszExpr;
	CeMainWindow*   m_pMainWindow;

	void RecurseChild(XMLNode* pSibling);

    // Attribute handlers
    //
	bool Calc(XMLNode* pNode, TCHAR* pszText);
    bool Counter(XMLNode* pNode, TCHAR* pszExpr);
	bool Total(XMLNode* pNode, TCHAR* pszExpr);
	bool Hsrc(XMLNode* pNode, TCHAR* pszExpr);

    // Attribute helpers
    //
	bool SubExprParse(XMLNode* pNode, TCHAR* pszSubExpr);
	void CalcChild(XMLNode* pElement, XMLNode* pNode);
	void (*pfParseHtml)(TCHAR* pszAttr, TCHAR* pszRegExpr, TCHAR* pszHtmlSrc);	// callback to parse html
    void ResetValues(XMLNode* pNode);
};

#endif // _CEUTE_H