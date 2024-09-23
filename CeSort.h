//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifndef _CESORT_H
#define _CESORT_H

#define ID_INTS	   0x0001
#define ID_STRINGS 0x0002

// Objects that can be sorted by CSortableList
enum {
	nInt,
	nString,
};

//////////////////////////////////////////////////////////////////////////////
// Objects that CSortableList can sort
//
class CSortableObject
{
public:
	CSortableObject(int nType=nInt) : m_nType(nType)
	{ }
	~CSortableObject()
	{ }
	int m_nType;
	int m_nOrder;
};

//////////////////////////////////////////////////////////////////////////////
// CSortableType - Objects which you can specify of which type to sort
//
template<class T>
class CSortableType : public CSortableObject
{
public:
	CSortableType(int n, int nType=nInt);
	CSortableType(char* psz, int nType=nString);	
	~CSortableType();
	T* m_pData;
};
template<class T>CSortableType<T>::CSortableType(int n, int nType=nInt) : CSortableObject(nType)
{ 
	m_pData = new T; 
	*m_pData = n; 
}
template<class T>CSortableType<T>::CSortableType(char* psz, int nType=nString) : CSortableObject(nType)
{ 
	m_pData = new T[strlen(psz)+1]; 
	strcpy(m_pData, psz); 
}
template<class T>CSortableType<T>::~CSortableType()
{ 
	if (m_pData) 
		delete m_pData; 
}

// Comparison functions for SortableList
typedef int (__cdecl *GENERICCOMPAREFN)(const void * elem1, 
 const void * elem2);
typedef int (__cdecl *STRINGCOMPAREFN)(CSortableObject ** elem1, 
 CSortableObject ** elem2);

//////////////////////////////////////////////////////////////////////////////
// SortableList - list of objects to sort, uses a plex
//
class CSortableList
{
public:
	CSortableList();
	~CSortableList();
	static int m_nSortType;
	CePlex<CSortableObject*>	m_pList;
 	void Sort(int nType=nInt, void* pBase=0, int nItems=0, STRINGCOMPAREFN pfnCompare = Compare);
 	static int __cdecl Compare(CSortableObject** pstr1, CSortableObject** pstr2);
	void SetOrder(DWORD nType);
};

int CSortableList::m_nSortType = nInt;

CSortableList::CSortableList()
{
}
CSortableList::~CSortableList()
{
}
int CSortableList::Compare(CSortableObject** pstr1, CSortableObject** pstr2)
{
	if (*pstr1 && *pstr2)
	{
		// We support <int> and <char> for now
		if ((m_nSortType == (int)nInt) && ((*pstr1)->m_nType == nInt) && ((*pstr2)->m_nType == nInt))
		{
			if (*static_cast<CSortableType<int>*>(*pstr1)->m_pData < *static_cast<CSortableType<int>*>(*pstr2)->m_pData)
				return -1;
			else if (*static_cast<CSortableType<int>*>(*pstr1)->m_pData > *static_cast<CSortableType<int>*>(*pstr2)->m_pData)
				return 1;
		}
		else if ((m_nSortType == (int)nString) && ((*pstr1)->m_nType == nString) && ((*pstr2)->m_nType == nString))
		{
			return strcmp(static_cast<CSortableType<char>*>(*pstr1)->m_pData, static_cast<CSortableType<char>*>(*pstr2)->m_pData);
		}
	}
	return 0;
}

void CSortableList::SetOrder(DWORD nType)
{
	int i,j,k;

	int n = m_pList.GetSize();

	// TODO: need to optimize this better
	CePlex<CSortableObject*> StringOrderedList;
	CePlex<CSortableObject*> IntOrderedList;

	// Not split array into two sub arrays (int and strings)	
	for (i=0, j=0,k=0; i<n; i++)
	{
		if ((nType & ID_STRINGS) && (m_pList[i] && m_pList[i]->m_nType == nString))
		{
			StringOrderedList[j] = m_pList[i];
			m_pList.m_prg[i]->m_nOrder = i;
			j++;
		}
		else if ((nType & ID_INTS) && (m_pList[i] && m_pList[i]->m_nType == nInt))
		{
			IntOrderedList[k] = m_pList[i];
			m_pList.m_prg[i]->m_nOrder = i;
			k++;
		}

	}

	// Now sort according to nType
	if (nType & ID_STRINGS)
	{
		Sort(nString, StringOrderedList.m_prg, j); 
		for (i=0;i<j;i++)
		{
			if (StringOrderedList[i] && StringOrderedList[i]->m_nType == nString)
			{
				if (m_pList.m_prg[StringOrderedList[i]->m_nOrder])
					m_pList.m_prg[StringOrderedList[i]->m_nOrder]->m_nOrder = i; 
			}
		}
	}

	if (nType & ID_INTS)
	{
		Sort(nInt, IntOrderedList.m_prg, k);
		for (i=0;i<k;i++)
		{
			if (IntOrderedList[i] && IntOrderedList[i]->m_nType == nInt)
			{
				if (m_pList.m_prg[IntOrderedList[i]->m_nOrder])
					m_pList.m_prg[IntOrderedList[i]->m_nOrder]->m_nOrder = i; 
			}
		}
	}
}

// Sort either our default list or a pBase
void CSortableList::Sort(int nType, void* pBase, int nItems, STRINGCOMPAREFN pfnCompare)
{
	m_nSortType = nType;
	int n = 0;
	if (pBase)
	{
		n = nItems;
		qsort(pBase, n, sizeof(CSortableObject*), (GENERICCOMPAREFN)pfnCompare);
	}
	else
	{
		n = m_pList.GetSize();
		qsort(m_pList.m_prg, n, sizeof(CSortableObject*), (GENERICCOMPAREFN)pfnCompare);
	}
}


#endif // _CESORT_H