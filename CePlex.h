//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifndef _CEPLEX_H
#define _CEPLEX_H

// Growing/shrinking 'array' template
#define PlexGrow 3
template <class T>
class CePlex 
{
public:	
	_inline CePlex(int nSize=PlexGrow);
	_inline ~CePlex();

// Helpers
public:
	_inline T& operator [](int n);
	_inline operator const T*();
	_inline int GetSize();			// returns allocated
	_inline int GetElements();		// returns occupied
	_inline void Insert(T pT);
	_inline void Delete(T pT);

public:	
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
	if (n < m_nSize)
		return m_prg[n];
	else
	{		
		int nGrow = n - m_nSize + 1;
		if (nGrow < m_nSize + PlexGrow)
			nGrow = PlexGrow;
		
		T* p = new T[m_nSize + nGrow];
		memset(p, 0, (m_nSize + nGrow)*sizeof(T));
		memmove(p, m_prg, (m_nSize)*sizeof(T));
		delete [] m_prg;
		m_prg = p;
		m_nSize = (m_nSize + nGrow);
		return m_prg[n];
	}	
}

template<class T>CePlex<T>::operator const T*()
{
	return m_prg;
}

template<class T>int CePlex<T>::GetSize()
{
	return m_nSize;
}

template<class T>int CePlex<T>::GetElements()
{
	static int nCache = 0;
	int nElements = 0;
	int nCount = 0;
	
	while (nCount < m_nSize)
	{
		while ((nCount < m_nSize) && (m_prg && m_prg[nCount] != 0))
		{
			nElements++;
			nCount++;	
		}
		nCount++;
	}

	nCache = nElements;
	return nElements;
}

template<class T>void CePlex<T>::Insert(T pT)
{	
	int n = GetElements();
	this->operator[](n+1) = pT;
}

template<class T>void CePlex<T>::Delete(T pT)
{	
	int nCount = 0;
	BOOL fFound = FALSE;

	while (!fFound && (nCount < m_nSize))
	{
		if (m_prg[nCount] == pT)
		{
			delete m_prg[nCount];
			m_prg[nCount] = 0;

			int n = nCount;
			while ((n+1 < m_nSize) && m_prg[n+1])
			{
				m_prg[n] = m_prg[n+1];
				m_prg[n+1] = 0;
				n++;
			}

			fFound = TRUE;
		}
		nCount++;	
	}
}

#endif // _CEPLEX_H