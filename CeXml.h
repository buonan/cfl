//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifndef _CEXML_H
#define _CEXML_H

enum eType {
    error = -1,
	comment = 0,
	document = 1,
	element,
	pcdata,
	attrib,
	tag,                // text (single line)
	calc,               // performs calculation 
	hsrc,               // displays a local web page
	notify,             // notification event
	total,              // sums up the calculations
    counter,            // running counter (bug can't be first column)
    menu,               // menu items
    values,             // value items
    img,                // image 
    href,               // http web address to download via WinInet
    text,               // text area (multiple line edit)
    list,               // list
    clist,              // checklist
    check,              // checkitem
    appt,               // appointment notification
	hidden,				// hidden attribute
	number,				// item is a number
	encrypt,			// encrypted
	listname,			// name of list
    password,           // password for organizer
    date                // date
};

#define MAX_ATTRIBUTE			128
#define MAX_ATTRIBUTE_VALUE		128
#define MAX_STRING				260

/////////////////////////////////////////////////////////////////////////////
// XMLNode - Elements
// 
class XMLNode
{
	friend class XMLDocument;
	friend class CeUteApp;		// Application engine
	friend class CeUteUI;		// UI engine;
	friend class CeUteCalc;		// Calculation engine
	friend class CeUteNotify;	// Notification engine

	// Ctor/dtor
public: 
	XMLNode() : m_pParent(0), m_pSibling(0), m_pChild(0), m_pszText(0), m_pszTagName(0), m_pszValue(0)
	{ m_nSibling = m_nChild = 0; m_nAttrib = 0; m_type = tag; m_nchildren = 0; }
	~XMLNode()
	{ if (m_pszTagName) delete m_pszTagName; if (m_pszText) delete m_pszText; if (m_pszValue) delete m_pszValue; }
	
	// Parsers 
public:
	TCHAR*& getText();
	void setText(TCHAR* pszText);
	void copyText(TCHAR* pszText);
	TCHAR* getTagName();
	void setTagName(TCHAR* pszTagName);
    void getTagNameOnly(TCHAR* pszTagOnly);
    void stripAttr(TCHAR* pszTagName);

	int getType();
    void setType(int type);
    XMLNode* isType(TCHAR* pszType);
    bool isAttrType(TCHAR* pszType);
    void setAttr(TCHAR* pszAttr, TCHAR* pszValue);
    bool getAttr(TCHAR* pszAttr, TCHAR* pszValue);

	XMLNode* getParent();
	XMLNode* getChildren();
	XMLNode* getSibling();

    void setChildren(XMLNode* pNewChild)    { m_pChild = pNewChild; };
    void setSibling(XMLNode* pNewSibling)   { m_pSibling = pNewSibling; };
    void addChildren(XMLNode* pNewChild);
    void addSibling(XMLNode* pNewSibling);

    void addAttribute(TCHAR* pszAttribute);
	int  numAttributes();
	int	 numElements();					// returns 0 or 1
	int  numChildrens();
	XMLNode* getElement(TCHAR* pszElement);
	BOOL ConvertToTag(TCHAR* pszElemFrom, TCHAR szTagNameTo[], BOOL fKeepAttributes=FALSE);
    void ConvertTagToTerm(TCHAR* pszTagName);
    BOOL RemoveTag(TCHAR szTextTo[], TCHAR* pszTagName = NULL);

    friend void copyNode(XMLNode* pnode, XMLNode** pcopy, XMLNode* pcopyParent)
    {
        if (pnode) {
           *pcopy = new XMLNode;
            (*pcopy)->copyText(TEXT(""));
            (*pcopy)->setTagName(pnode->getTagName());
            (*pcopy)->m_type = pnode->m_type;
            (*pcopy)->m_nchildren = pnode->m_nchildren;
            (*pcopy)->m_pParent = pcopyParent;

            // if attribute copy the attribute text
            //
            if (pnode->getType() == attrib)
                (*pcopy)->copyText(pnode->getText());

            copyNode(pnode->getChildren(), &(*pcopy)->m_pChild, *pcopy);
            copyNode(pnode->getSibling(), &(*pcopy)->m_pSibling, pcopyParent);
        }
    }

    friend void copyTree(XMLNode* ptree, XMLNode** pcopy)
    {
        if (ptree) {
            *pcopy = new XMLNode;      
            (*pcopy)->copyText(TEXT(""));
            (*pcopy)->setTagName(ptree->getTagName());
            (*pcopy)->m_type = ptree->m_type;
            (*pcopy)->m_nchildren = ptree->m_nchildren;
            (*pcopy)->m_pParent = ptree->m_pParent;

            // if attribute copy the attribute text
            //
            if (ptree->getType() == attrib)
                (*pcopy)->copyText(ptree->getText());

            copyNode(ptree->getChildren(), &(*pcopy)->m_pChild, *pcopy);

            (*pcopy)->m_pSibling = ptree->m_pSibling;
            ptree->m_pSibling = (*pcopy);            
        }
    }

    friend void delWalk(XMLNode* pdel)
    {
        if (pdel) {
            delWalk(pdel->m_pChild);
            delWalk(pdel->m_pSibling);
            delete pdel;
            pdel = NULL;
        }
    }

    friend void delTree(XMLNode* ptree) 
    {
        XMLNode* pdel = ptree;
        if (pdel && (pdel = pdel->getParent())) {        
            if (pdel = pdel->getChildren()) {
                while (pdel && pdel->getSibling() != ptree)
                    pdel = pdel->getSibling();
            }
            if (pdel) {
                pdel->m_pSibling = ptree->m_pSibling;
                delWalk(ptree->m_pChild);
                delete ptree;
            }
            else {
                delWalk(ptree->m_pChild);
                delete ptree;
            }
        }
    }


	// Implementation
private:
	int		m_type;
	int		m_nchildren;
	TCHAR*	m_pszTagName;
	TCHAR*	m_pszText;
	TCHAR*	m_pszValue;
	int		m_nSibling;
	int		m_nChild;
	int		m_nAttrib;

	XMLNode* m_pParent;
	XMLNode* m_pSibling;
	XMLNode* m_pChild;
};


/////////////////////////////////////////////////////////////////////////////
// XMLDocument - Tree of elements
//
class XMLDocument
{
	// Ctor/dtor
public:
	XMLDocument();
	virtual ~XMLDocument();

	// Parsers 
public:
	void addChild(XMLNode* pChild, XMLNode* pAdd);
	void createElement(TCHAR* psz, int n);

	void Document(/*factory*/);
    const TCHAR* getDocument()      { return m_pszSource; }

	TCHAR* getAttribute(TCHAR* pszName);
	TCHAR* getAtrributes();
	XMLNode* getChildren();
    XMLNode* getSibling();
	long getId();
	TCHAR* getName();
	XMLNode* getParent();
	XMLNode* getRoot();
    void setRoot(XMLNode* pRoot)    { m_pDocument = pRoot; }
	TCHAR* getTagName();
	TCHAR* getText();
	int getType();
	TCHAR* getUrl();
	TCHAR* getXML();
	bool load(TCHAR* pszXmlSrc);			// load src
	bool loadXml(TCHAR* pszXmlFile);		// load file
	bool loadUrl(TCHAR* pszXmlUrl);		    // load url
    void unload();                          // frees the document
	int numAttributes();
	int	 numElements();					    // returns 0 or 1
	void removeAttributes();
	void removeChild();
	bool save(HANDLE hFile, TCHAR*& pszDestination);  	
	void setAttribute(TCHAR* pszAttrib, TCHAR* pszValue);
	void setText(TCHAR* pszText);    

    // Special 
public:
    bool savelist(HANDLE hFile, TCHAR*& pszDestination);  	
    bool m_fFreeDocument;   // free sub nodes;
    void setPasswords(TCHAR* pszOld, TCHAR* pszNew);
    
	// Implementation
private:
	XMLNode* m_pDocument;		// ptr to parse tree
	TCHAR*	 m_pszSource;		// ptr to xml src
	int		 m_nElements;		// number of nodes
    TCHAR*   m_pOldPwd;
    TCHAR*   m_pNewPwd;
    CeCrypt  m_CryptOld;
    CeCrypt  m_CryptNew;

	bool OpenFile(TCHAR* pszXmlFile);
	void OpenUrl(TCHAR* pszXmlUrl);

	void Init();
	void BuildTree();
    void BuildSourceFromTree();
	inline void FreeSiblings(XMLNode*& pDocument);
	inline void FreeChildren(XMLNode*& pDocument);
	inline eType ParseElements(XMLNode*& pSibling, TCHAR*& pszElem);
	inline void EndParseElements(XMLNode*& pSibling, TCHAR* pszElem, int iEnd);
	inline void CopyTagText(XMLNode*& pSibling, TCHAR*& pszElem);
	inline void CopyTagName(XMLNode*& pSibling, TCHAR* pszElem);
	inline int ParseAttributes(XMLNode*& pSibling, TCHAR* pszAttrib);
	inline void AddSibling(XMLNode*& pParent, XMLNode*& pChild, eType e=tag);
	inline void AddChild(XMLNode*& pSibling, XMLNode*& pChild, eType e=tag);    

    bool RecurseSave(HANDLE hFile, XMLNode* pNode);
    bool RecurseSave(TCHAR** ppszBuffer, XMLNode* pNode);
};

#endif // _CEXML_H