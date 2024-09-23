//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifndef _CEREG_H
#define _CEREG_H

class CeRegKey
{
public:
	CeRegKey(HKEY hk);
	~CeRegKey();

	HKEY	m_hKeyName;
	HKEY	m_hKey;

// Members
	HRESULT OpenKey(LPCTSTR pszKeyName);
	void CloseKey();
    void DelKey(LPCTSTR pszKeyName, LPCTSTR pszSubKey);
    void DelValue(LPCTSTR pszKeyName, LPCTSTR pszValueName);
	BOOL KeyExist(LPCTSTR pszKeyName);
    DWORD ValuesCount();
	HRESULT GetStringValue(LPCTSTR pszKeyName, LPCTSTR pszKey, LPTSTR pszKeyValue);
	HRESULT SetStringValue(LPCTSTR pszKeyName, LPCTSTR pszKey, LPCTSTR pszKeyValue);
	HRESULT GetIntValue(LPCTSTR pszKeyName, LPCTSTR pszKey, DWORD& dwKeyValue);
	HRESULT SetIntValue(LPCTSTR pszKeyName, LPCTSTR pszKey, DWORD dwKeyValue);
    HRESULT GetBinValue(LPCTSTR pszKeyName, LPCTSTR pszKey, PVOID pData, DWORD dwSize);
    HRESULT SetBinValue(LPCTSTR pszKeyName, LPCTSTR pszKey, PVOID pData, DWORD dwSize);
};

#endif // _CEGREG_H