//////////////////////////////////////////////////////////////////////////////
// Ce Framework Library for Windows CE
// 
// Written by BnKSoftware Inc.
// Copyright (c) 1998-2000 
// All rights reserved.
//
#include "stdafx.h"
#include "cecrypt.h"
#include "cexml.h"
#include "cestr.h"


/* TODO:performance hits
		strlen()
		memset()
		strcpy()
		~XMLNode()
		CopyTagText()
*/

/////////////////////////////////////////////////////////////////////////////
// Local static functions
//
static void ConvertTagToTerm(TCHAR* pszTagName);

/////////////////////////////////////////////////////////////////////////////
// XMLNode - Element 
//
TCHAR*& XMLNode::getText()
{
	return m_pszText;
}

void XMLNode::setText(TCHAR* pszText)
{
	if (m_pszText)
		delete m_pszText;

	m_pszText = pszText;
}

TCHAR* XMLNode::getTagName()
{
	return m_pszTagName;
}

void XMLNode::setTagName(TCHAR* pszTagName)
{
	if (m_pszTagName)
		delete m_pszTagName;
	if (pszTagName)
	{
		int len = lstrlen(pszTagName);
		m_pszTagName = new TCHAR[len+1];
		lstrcpy(m_pszTagName, pszTagName);
	}
}

void XMLNode::getTagNameOnly(TCHAR* pszTagOnly)
{
    if (pszTagOnly && m_pszTagName) {
        lstrcpy(pszTagOnly, m_pszTagName);
        stripAttr(pszTagOnly);
    }
}

void XMLNode::stripAttr(TCHAR* pszTagName)
{
    if (pszTagName) {
        // Walk and terminate the string on first space
        //
        while (pszTagName && *pszTagName != TEXT(' ') && *pszTagName != TEXT('}') && 
              *pszTagName != TEXT('>') && *pszTagName != TEXT('\0')) {
            pszTagName++;
        }
        *pszTagName++ = TEXT('>');
        *pszTagName++ = TEXT('\0');
    }
}

void XMLNode::addAttribute(TCHAR* pszAttribute)
{
    // TODO:
}

void XMLNode::addChildren(XMLNode* pNewChild)
{
    XMLNode* pNext = NULL;
    if (m_pChild) {
        pNext = m_pChild->m_pChild;
        m_pChild->m_pChild = pNewChild;
        pNewChild->m_pChild = pNext;
    }
    else
        m_pChild = pNewChild;
}

void XMLNode::addSibling(XMLNode* pNewSibling)
{
    XMLNode* pNext = NULL;
    if (m_pSibling) {
        pNext = m_pSibling->m_pSibling;
        m_pSibling->m_pSibling = pNewSibling;
        pNewSibling->m_pSibling = pNext;
    }
    else
        m_pSibling = pNewSibling;
}

void XMLNode::copyText(TCHAR* pszText)
{    
    if (pszText) {
        if (m_pszText && (lstrlen(pszText) <= lstrlen(m_pszText)))
            lstrcpy(m_pszText, pszText);
        else {
            if (m_pszText)
                delete m_pszText;
		    int len = lstrlen(pszText);
		    m_pszText = new TCHAR[len+1];
		    lstrcpy(m_pszText, pszText);
        }
	}
}

XMLNode* XMLNode::getParent()
{
	return m_pParent;
}

XMLNode* XMLNode::getChildren()
{
	return m_pChild;
}

XMLNode* XMLNode::getSibling()
{
	return m_pSibling;
}

int XMLNode::numAttributes()
{
	return m_nAttrib;
}

int XMLNode::numElements()
{
	return m_nSibling;
}

int XMLNode::numChildrens()
{
	return m_nChild;
}

int XMLNode::getType()
{
	return m_type;
}

XMLNode* XMLNode::isType(TCHAR* pszType)
{
    XMLNode* pChild = getChildren();
    while (pChild && pszType) {
        if (!lstrcmp(pszType, pChild->getTagName()) && (pChild->getType() == attrib))
            return pChild;
        pChild = pChild->getSibling();
    }
    return FALSE;
}

// This checks if it is a pszType and that it is an attribute node
//
bool XMLNode::isAttrType(TCHAR* pszType)
{
    if (m_pszTagName && !lstrcmp(pszType, m_pszTagName) && (m_type == attrib))
        return true;
    return false;
}

void XMLNode::setType(int type)
{
    m_type = type;
}

void XMLNode::setAttr(TCHAR* pszType, TCHAR* pszValue)
{
    // Changing attributes at the parent tag name level
    //
    TCHAR *pszTempValue = pszValue;
    TCHAR *pszAttr = wcsstr(m_pszTagName, pszType);
    if (pszAttr) {
        while (*pszAttr != TEXT('='))
            pszAttr++;
        pszAttr++;

        // BUGBUG: Should do a better way 
        //
        while(*pszAttr != TEXT('>') || *pszTempValue != TEXT('\0'))
            *pszAttr++ = *pszTempValue++;
    }

    // Set the attribute node
    //
    XMLNode *pAttr = m_pChild;
    while (pAttr) {
        if (0 == lstrcmp(pAttr->getTagName(), pszType)) {
            pAttr->copyText(pszValue);
            break;
        }
        pAttr = pAttr->getSibling();
    }
}

bool XMLNode::getAttr(TCHAR* pszAttr, TCHAR* pszValue)
{
    if (pszAttr && pszValue) {
        XMLNode *pNode = getChildren();
        while (pNode) {
            if (pNode->isAttrType(pszAttr) && !lstrcmp(pNode->getText(), pszValue))
                return true;
            pNode = pNode->getSibling();
        }
    }
    return false;
}

// pszElement is not tag form so convert to tag '<tag>'
XMLNode* XMLNode::getElement(TCHAR* pszElement)
{
	XMLNode* pNode = m_pChild;
	TCHAR szElement[255], szTemp[255];
	if (!pszElement)
		return NULL;

	// convert pszElement to tag form
	if (!ConvertToTag(pszElement, szElement))
		return NULL;

	while (pNode && pNode->m_pszTagName)
	{
		ConvertToTag(pNode->m_pszTagName, szTemp);
		if (xmlstrcmp(szElement, szTemp))
			return pNode;
		pNode = pNode->m_pSibling;
	}

	// if no child try this
	if (!pNode) {
		pNode = this;
		while (pNode && pNode->m_pszTagName)
		{
			ConvertToTag(pNode->m_pszTagName, szTemp);
			if (xmlstrcmp(szElement, szTemp))
				return pNode;
			pNode = pNode->m_pSibling;
		}
	}

	// if no this or child try Sibling
	if (!pNode)
	{
		pNode = m_pSibling;
		while (pNode && pNode->m_pszTagName)
		{
			ConvertToTag(pNode->m_pszTagName, szTemp);
			if (xmlstrcmp(szElement, szTemp))
				return pNode;
			pNode = pNode->m_pSibling;
		}
	}

	return NULL;
}

// Convert pszElemFrom to szTagNameTo tag 
//
BOOL XMLNode::ConvertToTag(TCHAR* pszElemFrom, TCHAR szTagNameTo[], BOOL fKeepAttributes)
{
	int i = 0;
	if (!pszElemFrom)
		return NULL;

	// convert pszElement to tag form
	szTagNameTo[i++] = TEXT('<');
	while (pszElemFrom && *pszElemFrom != TEXT('\0'))
	{
		// break if space
		if (!fKeepAttributes && *pszElemFrom == TEXT(' '))
			break;
    
        // break if NULL 
		if (fKeepAttributes && *pszElemFrom == TEXT('\0'))
			break;

		if (!fKeepAttributes && xisalpha(*pszElemFrom))
			szTagNameTo[i++] = *pszElemFrom;

		if (fKeepAttributes && xisascii(*pszElemFrom))
			szTagNameTo[i++] = *pszElemFrom;

		pszElemFrom++;
	}
	szTagNameTo[i++] = TEXT('>');
	szTagNameTo[i++] = TEXT('\0');

	return TRUE;
}

void XMLNode::ConvertTagToTerm(TCHAR* pszTagName)
{
    TCHAR szTemp[MAX_LEN] = TEXT("");
    int i = 0;
    TCHAR *pszTempName = pszTagName;
    while (pszTempName && *pszTempName != TEXT('\0') && *pszTempName != TEXT(' '))
    {
        if ((i == 1) && (szTemp[0] == TEXT('<')))
            szTemp[i++] = TEXT('/');

        szTemp[i++] = *pszTempName++;
    }

    // If this tag has attributes then we run into a space first
    //
    if (pszTempName && *pszTempName == TEXT(' '))
        szTemp[i++] = TEXT('>');

    szTemp[i++] = TEXT('\0');
    lstrcpy(pszTagName, szTemp);
}

// Remove tag pszTagFrom to szTextTo 
//
BOOL XMLNode::RemoveTag(TCHAR szTextTo[], TCHAR* pszTagName /*NULL*/)
{
	int i = 0;
    TCHAR* pszTagFrom = pszTagName?pszTagName:m_pszTagName;

	if (!pszTagFrom)
		return NULL;

	// convert pszElement to tag form
	while (pszTagFrom && *pszTagFrom != TEXT('\0'))
	{
		// break if space
		if (*pszTagFrom == TEXT(' '))
			break;

		if (*pszTagFrom == TEXT('<') || *pszTagFrom == TEXT('>'))
			pszTagFrom++;

		szTextTo[i++] = *pszTagFrom++;
	}
	szTextTo[i++] = TEXT('\0');

	return TRUE;
}


/////////////////////////////////////////////////////////////////////////////
// XMLDocument - Tree of elements
//
XMLDocument::XMLDocument() : m_pDocument(0), m_pszSource(0), m_pOldPwd(0), m_pNewPwd(0)						 
{
	m_nElements = 0;
    m_fFreeDocument = true;
}

XMLDocument::~XMLDocument()
{
    if (m_fFreeDocument) {
	    FreeSiblings(m_pDocument);

	    if (m_pszSource)
		    delete m_pszSource;
    }
}

void XMLDocument::Init()
{
    if (m_fFreeDocument)
	    FreeSiblings(m_pDocument);
		
    if (m_pszSource) {
		delete m_pszSource;
        m_pszSource = NULL;
    }
	m_nElements = 0;
}

void XMLDocument::FreeChildren(XMLNode*& pDocument)
{ 
	XMLNode* p = pDocument;
	while (p) {
		FreeSiblings(p->m_pSibling);
		p = p->m_pChild;
		delete pDocument;
		pDocument = p;
	}
}


void XMLDocument::FreeSiblings(XMLNode*& pDocument)
{
	XMLNode* p = pDocument;
	while (p) {
		FreeChildren(p->m_pChild);
		p = p->m_pSibling;
		delete pDocument;
		pDocument = p;
	}
}

// Opens file
//
bool XMLDocument::OpenFile(TCHAR* pszXmlFile)
{
	HANDLE hFile = CreateFile(pszXmlFile, GENERIC_READ, FILE_SHARE_READ|FILE_SHARE_WRITE,
		NULL, OPEN_EXISTING, FILE_ATTRIBUTE_ARCHIVE, NULL);
	if (hFile ==  INVALID_HANDLE_VALUE)
		goto Error;

	DWORD dwFileSize, dwRead;
	dwFileSize = GetFileSize(hFile, NULL);
	if (dwFileSize == 0xFFFFFFFF)
		goto Error;

	m_pszSource = new TCHAR[dwFileSize+1];	
	if (m_pszSource)
	{
		memset(m_pszSource, 0, dwFileSize+1);
		if (!ReadFile(hFile, m_pszSource, dwFileSize, &dwRead, NULL))
			goto Error;

		if (hFile)
			CloseHandle(hFile);
		return true;
	}

Error:
	DWORD dwError = GetLastError();

	if (m_pszSource)
		delete m_pszSource;
	if (hFile)
		CloseHandle(hFile);
	return false;
}

// Opens url
//
void XMLDocument::OpenUrl(TCHAR* pszXmlUrl)
{
	// TODO:
	return;
}

// End parsing of tag name
//
void XMLDocument::EndParseElements(XMLNode*& pSibling, TCHAR* pszElementName, int iEnd)
{
	int n = 0;
	if (!pSibling || !pszElementName)
		return;

	while (n < iEnd)
		pSibling->m_pszTagName[n++] = *pszElementName++;

	pSibling->m_pszTagName[n++] = TEXT('\0');
}

// Copy the tag name and set tag type 
//
void XMLDocument::CopyTagName(XMLNode*& pSibling, TCHAR* pszElementName)
{
	if (pSibling && pszElementName)
	{
		int nlen = 0;
		TCHAR* pszLen = pszElementName;
		while (pszLen && *pszLen++ != TEXT('\0'))
			nlen++;

		if (!pSibling->m_pszTagName)
		{
			pSibling->m_pszTagName = new TCHAR[nlen+1];
			memset(pSibling->m_pszTagName, 0, nlen+1);
		}
		if (pSibling->m_pszTagName)
			xmlstrcpy(pSibling->m_pszTagName, pszElementName);
	}
}

// Copy the tag text
//
void XMLDocument::CopyTagText(XMLNode*& pSibling, TCHAR*& pszElement)
{
	int iEnd = 0;
	if (!pSibling || !pszElement)
		return;

	// figure out the length of the text we're going to copy 
	// use the beginning of a new tag as termination
	TCHAR* pszLen = pszElement;
	int nlen = 0;
	while (pszLen && (*pszLen != TEXT('<')) && (*pszLen != TEXT('\0')))
	{
		pszLen++;
		nlen++;
	}

	if (!pSibling->m_pszText)
	{
		pSibling->m_pszText = new TCHAR[nlen+1];
		memset(pSibling->m_pszText, 0, nlen+1);
	}
	if (pSibling->m_pszText)
	{
		while (pszElement && (*pszElement != TEXT('<')) && (*pszElement != TEXT('\0')))
		{
            // TODO: Why are we checking for NonWhiteSpace here?
            // 
            if (IsNonWhiteSpace(*pszElement)) {
                pSibling->m_pszText[iEnd++] = *pszElement;
            }
            else if (wcsstr(pSibling->getTagName(), TEXT("textarea")))
                pSibling->m_pszText[iEnd++] = *pszElement;

			pszElement++;
		}
		pSibling->m_pszText[iEnd++] = TEXT('\0');
	}
}

// ParseElements puts tag name and text into pSibling
//
eType XMLDocument::ParseElements(XMLNode*& pSibling, TCHAR*& pszElement)
{
	// TODO: fix
	int nResize = 1;
	int nOpenAngle = 0;
	bool fDone = false;
	int i = 0;
	TCHAR szElementName[85];
    eType type = tag;

	if (szElementName)
	{
		memset(szElementName, 0, 85);

		for (i = 0; pszElement && (*pszElement != TEXT('\0')) && !fDone;) {
			switch (*pszElement)
			{
			case TEXT('<'):
				{
					nOpenAngle++;
					/* Sub parse nested angle brackets
					if (nOpenAngle >= 2) {
						XMLNode* pChild = new XMLNode;
						EndParseElements(pSibling, pszElementName, i);
						fDone = true;

						if (-1 != ParseElements(pChild, pszElement))
							AddChild(pSibling, pChild);
						nOpenAngle--;
						pszElement--;
					}
					*/
				}
				break;
			case TEXT('>'):
				nOpenAngle--;
				/* TODO: we are not parsing end tags */
				if (nOpenAngle == -1)
					return error;
				else if (nOpenAngle == 0)
					fDone = true;
				break;
			}

			// Resize the string if larger than MAX_ATTRIBUTE
			if (i >= (MAX_PATH*nResize-1)) {
				nResize++;
				TCHAR* pszTemp = new TCHAR[85*nResize];
				if (pszTemp)
				{
					memset(pszTemp, 0, 85*nResize);
					xmlstrcpy(pszTemp, szElementName);
					lstrcpy(szElementName, pszTemp);
				}
			}

			if (IsNonWhiteSpace(*pszElement))
				szElementName[i++] = *pszElement;
			
			pszElement++;
		}
		szElementName[i++] = TEXT('\0');

		// Copy the tag name
		CopyTagName(pSibling, szElementName);

		// Copy the tag text
		CopyTagText(pSibling, pszElement);

		// Now parse for attributes
		ParseAttributes(pSibling, szElementName);

        // Type
        if (szElementName[i+1] == TEXT('!'))
            type = comment;

	}

	return type;
}

// TODO: ParseAttributes returns number of attributes
//
int XMLDocument::ParseAttributes(XMLNode*& pSibling, TCHAR* pszAttrib)
{
	TCHAR szAttribute[25];
	TCHAR* pszAttributeValue = new TCHAR[85];
	int i, j, cchValue, cgrow, etype = 0;
	i = j = 0;
	cgrow = 2;
	cchValue = 85;

	// Keep moving forward until we see an attribute setting
    //
	pszAttrib = xstrstr(pszAttrib, TEXT("="));
	while (pszAttrib)
	{
		// Mark our '='
        //
		TCHAR* pszAttrValue = pszAttrib;

		// If no attributes then pszAttrValue points to '>'
        //
		if (pszAttrValue && *pszAttrValue == TEXT('>'))
			return 0;

		// Move before the '='
        //
		pszAttrib--;

		// Move back pass spaces if necessary
        //
		while (pszAttrib && *pszAttrib == ' ')
			pszAttrib--;

		// Copy the attribute name in reverse then reverse it back
        //
		while (pszAttrib && *pszAttrib != TEXT(' '))
			szAttribute[i++] = *pszAttrib--;
		szAttribute[i++] = TEXT('\0');
		reverse(szAttribute);

		// Move after the '='
        //
		pszAttrValue++;

		// Move forwards pass spaces if necessary but not until end tag
        //
		while (pszAttrValue && *pszAttrValue == TEXT(' '))
			pszAttrValue++;

		// Here is where we know what attribute it is
        //
        
		if (xmlstrcmp(szAttribute, TEXT("calc"))	||
		    xmlstrcmp(szAttribute, TEXT("hsrc"))	||
		    xmlstrcmp(szAttribute, TEXT("notify"))	||
		    xmlstrcmp(szAttribute, TEXT("total"))	||
            xmlstrcmp(szAttribute, TEXT("counter")) ||
            xmlstrcmp(szAttribute, TEXT("menu"))	||
            xmlstrcmp(szAttribute, TEXT("values"))	||
            xmlstrcmp(szAttribute, TEXT("img"))		||
            xmlstrcmp(szAttribute, TEXT("href"))	||
            xmlstrcmp(szAttribute, TEXT("text"))	||
            xmlstrcmp(szAttribute, TEXT("list"))	||
            xmlstrcmp(szAttribute, TEXT("clist"))	||
            xmlstrcmp(szAttribute, TEXT("check"))	||
			xmlstrcmp(szAttribute, TEXT("hidden"))	||
			xmlstrcmp(szAttribute, TEXT("number"))	||
			xmlstrcmp(szAttribute, TEXT("encrypt"))	||
			xmlstrcmp(szAttribute, TEXT("listname"))||
            xmlstrcmp(szAttribute, TEXT("password"))||
            xmlstrcmp(szAttribute, TEXT("date")) 	
			)
		        etype = attrib;

		// if attribute value is not enclosed in a string then copy up to space or end tag
		if (*pszAttrValue != TEXT('"'))
		{
            // Menu types can contain spaces in
            bool fSpace = true;
            if (xmlstrcmp(szAttribute, TEXT("menu")))
                fSpace = false;

			// copy the attribute value until we reach a space or end tag
            while (pszAttrValue && 
                (fSpace?(*pszAttrValue != TEXT(' ') && *pszAttrValue != TEXT('>')) : (*pszAttrValue != TEXT('>'))))
			{
				// if the attribute value strlen is greater than MAX_ATTRIBUTE_VALUE then
				// we need to resize the string
				if (j > cchValue - 1)
				{
					cchValue = 85 * (++cgrow);
					TCHAR *pszNewValue = new TCHAR[cchValue];				
					pszAttributeValue[j-1] = TEXT('\0');

					xstrcpy(pszNewValue, pszAttributeValue);
					delete pszAttributeValue;
					pszAttributeValue = pszNewValue;
					j--;
				}
				pszAttributeValue[j++] = *pszAttrValue++;
			}
		}
		else // attribute is enclosed in a string so copy everything inside the string
		{
			// get past the first "
			pszAttrValue++;

			// copy the attribute value until we reach end of string
			while (pszAttrValue && (*pszAttrValue != TEXT('"') && *pszAttrValue != TEXT('>')))
			{
				// if the attribute value strlen is greater than MAX_ATTRIBUTE_VALUE then
				// we need to resize the string
				if (j > cchValue - 1)
				{
					cchValue = 85 * (++cgrow);
					TCHAR *pszNewValue = new TCHAR[cchValue];				
					pszAttributeValue[j-1] = TEXT('\0');

					xstrcpy(pszNewValue, pszAttributeValue);
					delete pszAttributeValue;
					pszAttributeValue = pszNewValue;
					j--;
				}
				pszAttributeValue[j++] = *pszAttrValue++;
			}
		}
		pszAttributeValue[j++] = TEXT('\0');

        // Allocate our new pNode for the tree
        //
		XMLNode* pNode = new XMLNode;
		pNode->m_type = etype;

		// Copy the tag name and text into the pNode and delete it
        //
		pNode->setTagName(szAttribute);
		pNode->copyText(pszAttributeValue);

		// Add the attribute 
        //
		AddChild(pSibling, pNode, (eType)pNode->getType());

		// Next 
        //
		pszAttrib = xstrstr(pszAttrValue+1, TEXT("="));
		i = j = 0;
	}
	delete pszAttributeValue;
	return 0;
}

// TODO: Walks the tree and builds the source
//
void XMLDocument::BuildSourceFromTree()
{
    return;
}


// Convert <tag> to </tag>
//
static void ConvertTagToTerm(TCHAR* pszTagName)
{
    TCHAR szTemp[MAX_LEN] = TEXT("");
    int i = 0;
    TCHAR *pszTempName = pszTagName;
    while (pszTempName && *pszTempName != TEXT('\0') && *pszTempName != TEXT(' '))
    {
        if ((i == 1) && (szTemp[0] == TEXT('<')))
            szTemp[i++] = TEXT('/');

        szTemp[i++] = *pszTempName++;
    }

    // If this tag has attributes then we run into a space first
    //
    if (pszTempName && *pszTempName == TEXT(' '))
        szTemp[i++] = TEXT('>');

    szTemp[i++] = TEXT('\0');
    lstrcpy(pszTagName, szTemp);
}

// BuildTree begins building tree of elements 
//
void XMLDocument::BuildTree()
{
	if (!m_pszSource)
		return;

	// TODO: Create the document node
    //
	m_pDocument = new XMLNode;
	m_pDocument->m_pszTagName = new TCHAR[25];
	xmlstrcpy(m_pDocument->m_pszTagName, TEXT("XML Document"));
	
	// TODO: Parse the child nodes
    //
	TCHAR* pszChar = m_pszSource;
	int nOpenAngle = 0;
	bool fDone = false;
	XMLNode* pSibling, *pChild, *pLastParent;
	pSibling = pChild = pLastParent = NULL;
    eType type = tag;

	while (!fDone && pszChar && (*pszChar != TEXT('\0'))) {
		switch (*pszChar)
		{
		case TEXT('<'):
			{
				// Look ahead if term
				if (*(pszChar+1) != TEXT('/')) {
					nOpenAngle++;

					// This adds the first child node
					if (nOpenAngle == 1) {						
						pSibling = new XMLNode;
						if (-1 == (type = ParseElements(pSibling, pszChar)))
							return;
						AddChild(m_pDocument, pSibling, type);
						pLastParent = m_pDocument;
					}
				    // Look ahead if comment
				    else if (*(pszChar+1) == TEXT('!')) {
					    nOpenAngle++;

					    // Comments are always siblings
						pChild = new XMLNode;
						if (-1 == (type = ParseElements(pChild, pszChar)))
							return;

						AddSibling(pSibling, pChild, type);
					}
					else {
						// This adds subsequent child/sibling nodes
						pChild = new XMLNode;
						if (-1 == (type = ParseElements(pChild, pszChar)))
							return;
						
						// TODO: I think we can do syntax checking here
						//		 according to the DTD

						// Here we are checking if we have the same last
						// parent or a new parent so we add as sibling or
						// child
						if (pLastParent == pSibling)
							AddSibling(pLastParent, pChild, type);
						else if (pSibling->m_pChild)
							AddSibling(pSibling, pChild, type);
						else
							AddChild(pSibling, pChild, type);
						pLastParent = pSibling;

						// push - compare with last parent
						pSibling = pChild;					
					}				
				}
				else
					pszChar++;
			}
			break;
		case TEXT('/'):
			{
				// TODO: We don't add end tags
				nOpenAngle--;
				if (nOpenAngle == -1)
					return;
				else if (nOpenAngle == 0)
					fDone = true;			

				// pop - compare with last parent
				pSibling = pSibling->m_pParent;
				pszChar++;
			}
			break;
		default:
			pszChar++;
			break;
		}		        
	}
}

// AddSibling grows across 
//
void XMLDocument::AddSibling(XMLNode*& pParent, XMLNode*& pSibling, eType e)
{
	XMLNode* pAddNode = pParent->m_pChild;
	while (pAddNode && pAddNode->m_pSibling)
		pAddNode = pAddNode->m_pSibling;

	if (pAddNode)
	{
		pSibling->m_type = e;
		pAddNode->m_pSibling = pSibling;
		pAddNode->m_pSibling->m_pParent = pParent;
		pParent->m_nSibling++;
		m_nElements++;
	}
}

// AddChild grows down
//
void XMLDocument::AddChild(XMLNode*& pSibling, XMLNode*& pChild, eType e)
{
	XMLNode* pAddNode = pSibling;
	while (pAddNode && pAddNode->m_pChild)
		pAddNode = pAddNode->m_pChild;

	if (pAddNode)
	{
		pChild->m_type = e;

        //
        // if adding another attribute to this child then link it
        // as a sibling not child again
        //
        if (e == attrib && pSibling->m_pChild) 
            AddSibling(pSibling, pChild, e);
        else 
		    pAddNode->m_pChild = pChild;	

	    pAddNode->m_nChild++;
		pChild->m_pParent = pSibling;
		m_nElements++;
	}
}


/////////////////////////////////////////////////////////////////////////////
// Exposed public methods
//

// Load from TCHAR* stream
bool XMLDocument::load(TCHAR* pszXmlSrc)
{
	Init();
	
	if (!pszXmlSrc)
		return false;

	m_pszSource = pszXmlSrc;

	BuildTree();
	
	return true;
}

// Load from file
bool XMLDocument::loadXml(TCHAR* pszXmlFile)
{
	Init();

	OpenFile(pszXmlFile);

	BuildTree();

	return true;
}

// Load from a url
bool XMLDocument::loadUrl(TCHAR* pszXmlUrl)
{
	Init();

	OpenUrl(pszXmlUrl);
	
	BuildTree();

	return true;
}

// Unload the document resources
void XMLDocument::unload()
{
    // Calling init is good enough
    // to free up all the resources
    //
    Init();
}

XMLNode* XMLDocument::getRoot()
{
	return m_pDocument;
}

XMLNode* XMLDocument::getChildren()
{
	if (m_pDocument)
		return m_pDocument->m_pChild;

	return NULL;
}

XMLNode* XMLDocument::getSibling()
{
	if (m_pDocument)
		return m_pDocument->m_pSibling;

	return NULL;
}

int XMLDocument::numElements()
{
	return m_nElements;
}

TCHAR* XMLDocument::getText()
{
    return m_pszSource;
}

// TODO: Need to make this better converts attrib=data into attrib="data" 
// but only good for one attrib
//
void MakeQuoted(TCHAR *pszTagName)
{
	TCHAR *pszAttrib = pszTagName;
	while (pszAttrib && (pszAttrib = wcsstr(pszAttrib, TEXT("=")))) {
		if (*(pszAttrib+1) != TEXT('"')) {
			shiftchars(pszAttrib, 1);
			*++pszAttrib = TEXT('"');
			while (*pszAttrib != TEXT(' ') && *pszAttrib != TEXT('\0') && *pszAttrib != TEXT('>'))
				pszAttrib++;
			if (*pszAttrib == TEXT(' ') || *pszAttrib == TEXT('>')) {
				shiftchars(pszAttrib, 1);
				*pszAttrib = TEXT('"');
			}
		}
		else
			break;
	}
}

bool XMLDocument::RecurseSave(HANDLE hFile, XMLNode* pNode)
{
    if (hFile && pNode)
    {
        // write
        TCHAR szTagName[MAX_LEN] = TEXT("\0");
        int nLen = 0;
        DWORD dwWrite = 0;
        lstrcpy(szTagName, pNode->getTagName());

        // IMPORTANT: since we dont' keep track of end tags we 
        //            keep track of via this stack
        if (pNode->getType() == tag)
        {
            dwWrite = 0;
			MakeQuoted(szTagName);
            nLen = lstrlen(szTagName);
            WriteFile(hFile, szTagName, nLen*sizeof(TCHAR), &dwWrite, NULL);

            // If a sibling is not a calc then this is parent so write
            // out the text
            //if (!pNode->isType(TEXT("calc"))) {
                if (pNode->isType(TEXT("encrypt"))) {
                    m_CryptOld.FDecrypt(pNode->getText(), lstrlen(pNode->getText()), m_pOldPwd);
                    m_CryptNew.FEncrypt(pNode->getText(), lstrlen(pNode->getText()), m_pNewPwd);
                }
                nLen = lstrlen(pNode->getText());
                WriteFile(hFile, pNode->getText(), nLen*sizeof(TCHAR), &dwWrite, NULL);
            //}
            //WriteFile(hFile, TEXT("\r\n"), 2*sizeof(TCHAR), &dwWrite, NULL);
        }
	    RecurseSave(hFile, pNode->getChildren());
        // IMPORTANT: since we dont' keep track of end tags we 
        //            keep track of via this stack
        if (pNode->getType() == tag)
        {
            ConvertTagToTerm(szTagName);
            nLen = lstrlen(szTagName);           
            WriteFile(hFile, szTagName, nLen*sizeof(TCHAR), &dwWrite, NULL);
            WriteFile(hFile, TEXT("\r\n"), 2*sizeof(TCHAR), &dwWrite, NULL);
        }

        RecurseSave(hFile, pNode->getSibling());        

        return true;
    }
    return false;
}

bool XMLDocument::RecurseSave(TCHAR** ppszBuffer, XMLNode* pNode)
{
	// NOTE: This save doesn't save calculation formulas instead it
	//		 saves the results
	//
    if (ppszBuffer && *ppszBuffer && pNode)
    {
        TCHAR szTagName[MAX_LEN] = TEXT("\0");
        lstrcpy(szTagName, pNode->getTagName());

        // IMPORTANT: since we dont' keep track of end tags we 
        //            keep track of via this stack
        if (pNode->getType() == tag)
        {
			MakeQuoted(szTagName);
            lstrcat(*ppszBuffer, szTagName);

            // If a sibling is not a calc then this is parent so write
            // out the text
            if (!pNode->isType(TEXT("calc"))) {
                if (pNode->isType(TEXT("encrypt"))) {
                    m_CryptOld.FDecrypt(pNode->getText(), lstrlen(pNode->getText()), m_pOldPwd);
                    m_CryptNew.FEncrypt(pNode->getText(), lstrlen(pNode->getText()), m_pNewPwd);
                }
                lstrcat(*ppszBuffer, pNode->getText());
                // BUG: need to check ppszBuffer size overrun!
                lstrcat(*ppszBuffer, TEXT("\r\n"));
            }
        }
	    RecurseSave(ppszBuffer, pNode->getChildren());
        // IMPORTANT: since we dont' keep track of end tags we 
        //            keep track of via this stack
        if (pNode->getType() == tag)
        {
            ConvertTagToTerm(szTagName);
            lstrcat(*ppszBuffer, szTagName);
            // BUG: need to check ppszBuffer size overrun!
            lstrcat(*ppszBuffer, TEXT("\r\n"));   
        }

	    RecurseSave(ppszBuffer, pNode->getSibling());

        return true;
    }
    return false;
}

// Save either to hFile or pszDest buffer
//
bool XMLDocument::save(HANDLE hFile, TCHAR*& pszDestination)
{
	XMLNode* pNode = NULL;

    pNode = getChildren();

    // If we're persisting to a TCHAR stream
    //
    if (pszDestination)
        lstrcpy(pszDestination, TEXT(""));

    // If we're persisting to a File stream
    //
    if (hFile)
    {
        // Write unicode signature
        DWORD dwWrite = 0;
        BYTE szUnicode[2] = { 0xFF, 0xFE };
        WriteFile(hFile, szUnicode, sizeof(szUnicode), &dwWrite, NULL);
	    if (RecurseSave(hFile, pNode))
            return true;
    }
    else
    {
	    if (RecurseSave(&pszDestination, pNode))
            return true;
    }

    return false;
}

// Save XMLNode in list format
//
bool XMLDocument::savelist(HANDLE hFile, TCHAR*& pszDestination)
{
	XMLNode* pNode = NULL;
    DWORD dwWrite = 0;

    if (hFile == NULL)
        pNode = getChildren();
    else
        pNode = m_pDocument;

    // If we're persisting to a TCHAR stream
    //
    if (pszDestination)
        lstrcpy(pszDestination, TEXT(""));

    // If we're persisting to a File stream
    //
    if (hFile)
    {
        DWORD dwWrite = 0;
        BYTE szUnicode[2] = { 0xFF, 0xFE };
        WriteFile(hFile, szUnicode, sizeof(szUnicode), &dwWrite, NULL);
        WriteFile(hFile, pNode->getTagName(), lstrlen(pNode->getTagName())*sizeof(TCHAR), &dwWrite, NULL);
        WriteFile(hFile, TEXT("\r\n"), 2*sizeof(TCHAR), &dwWrite, NULL);

	    if (RecurseSave(hFile, pNode->getChildren()))
            return true;
    }
    else
    {
        lstrcpy(pszDestination, pNode->getTagName());

	    if (RecurseSave(&pszDestination, pNode->getChildren()))
            return true;
    }

    return false;
}

// Certain elements maybe encrypted 
//
void XMLDocument::setPasswords(TCHAR* pszOld, TCHAR* pszNew)
{
    if (pszOld)
        m_pOldPwd = pszOld;

    if (pszNew)
        m_pNewPwd = pszNew;    
}

