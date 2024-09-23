// tplex.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "string.h"

// How to use STL
#include <string>
#include <list>
#include <map>
using namespace std;

// Objects
enum {
	nInt,
	nString,
};

class CMyObject
{
public:
	CMyObject(int nType) : m_nType(nType)
	{ }
	int m_nType;
	int m_nOrder;
};


class CMyList
{
public:
	CMyObject*	m_pList[5];
	Sort(int nIndex);
};

bool CMyList::Sort(int nIndex)
{
	if (nIndex == nInt)
		;
	else if (nIndex == nString)
		;
	return true;
}

class CMyInt : public CMyObject
{
public:
	CMyInt(int nType=nInt) : CMyObject(nType)
	{ }

};

class CMyString : public CMyObject
{
public:
	CMyString(int nType=nString) : CMyObject(nType)
	{ }
};

// Growing/shrinking 'array' template
#define PlexGrow 15
template <class T>
class CePlex 
{
public:
	CePlex(int nSize=15);
	~CePlex();

// Helpers
public:
	T& operator [](int n);
	void operator =(T& t);

private:	
	int m_nSize;
	T*	m_prg;
};


template<class T>CePlex<T>::CePlex(int nSize)
{
	m_prg = new T[nSize];
	memset(m_prg, 0, nSize*sizeof(T));
	m_nSize = nSize;
}

template<class T>CePlex<T>::~CePlex()
{
	if (m_prg)
		delete [] m_prg;
}

template<class T>T& CePlex<T>::operator [](int n)
{	
	if (n <= m_nSize)
		return m_prg[n];
	else
	{		
		int nGrow = n - m_nSize + 1;
		if (nGrow < m_nSize + PlexGrow)
			nGrow = PlexGrow;
		
		T* p = new T[m_nSize + nGrow];
		memset(p, 0, (m_nSize + nGrow)*sizeof(T));
		memmove(p, m_prg, m_nSize*sizeof(T));
		delete [] m_prg;
		m_prg = p;

		return m_prg[n];
	}	
}
template<class T>void CePlex<T>::operator =(T& t)
{
}

typedef struct _sname
{
	char szName[255];
	int  age;
}SNAME, *PSNAME;

CePlex<SNAME> rgNames;

int main(int argc, char* argv[])
{
// STL
	basic_string<char> str;
	str.assign("Hello, template!");
	int n = str.size();

	str = "Hello, world!";
	n = str.size();

	list<int> vlist;
	

// My templates
	CePlex<int> rgInts;
	rgInts[5] = 2;
	n = rgInts[5];
	n = rgInts[10];
	n = rgInts[100];
	n = rgInts[5];
	if (2 == rgInts[5])
		n = 2;

	CePlex<char*> rgStrings;
	rgStrings[5] = "Hello world";
	char* psz = rgStrings[5];
	psz = rgStrings[100];
	psz = rgStrings[5];
	if (strcmp(rgStrings[5], "Hello world") == 0)
		n = 2;

	SNAME John;
	John.age = 5;
	strcpy(John.szName, "John");

	rgNames[0] = John;
	if (strcmp(rgNames[0].szName, "John") == 0)
		n = 2;

	return 0;
}

