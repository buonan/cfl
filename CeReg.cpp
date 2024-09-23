//////////////////////////////////////////////////////////////////////////////
// Ce Framework Library for Windows CE
// 
// Written by BnKSoftware Inc.
// Copyright (c) 1998-2000 
//
#include "stdafx.h"
#include "cereg.h"

CeRegKey::CeRegKey(HKEY hk) : m_hKey(0)
{
	m_hKeyName = hk;
}

CeRegKey::~CeRegKey()
{
	if (m_hKey)
		CloseKey();
}

HRESULT CeRegKey::OpenKey(LPCTSTR pszKeyName)
{
	return ::RegOpenKeyEx(m_hKeyName, pszKeyName, 0, 0, &m_hKey);
}

void CeRegKey::CloseKey()
{
	::RegCloseKey(m_hKey);
	m_hKey = NULL;
}

BOOL CeRegKey::KeyExist(LPCTSTR pszKeyName)
{
	if (ERROR_SUCCESS == OpenKey(pszKeyName)) { 
		CloseKey();
		return TRUE;
	}

	return FALSE;
}

DWORD CeRegKey::ValuesCount()
{
    DWORD dwSubKeys, dwValues;

    RegQueryInfoKey(m_hKey, NULL, NULL, NULL, &dwSubKeys, NULL, NULL, &dwValues, NULL, NULL, NULL, NULL);
    return dwValues;
}

HRESULT CeRegKey::GetStringValue(LPCTSTR pszKeyName, LPCTSTR pszKey, LPTSTR pszKeyValue)
{
	DWORD dwSize, dwType = REG_SZ;	
	dwSize = MAX_LEN;
	if (m_hKey == NULL)
		OpenKey(pszKeyName);
	return ::RegQueryValueEx(m_hKey, pszKey, 0, &dwType, (PBYTE)pszKeyValue, &dwSize);
}

HRESULT CeRegKey::SetStringValue(LPCTSTR pszKeyName, LPCTSTR pszKey, LPCTSTR pszKeyValue)
{
	DWORD dwDisp;

	INT rc = ::RegCreateKeyEx(m_hKeyName, pszKeyName, 0, TEXT(""), 0, 0, NULL, &m_hKey,
			&dwDisp);
	int nLen = lstrlen(pszKeyValue)+1;
	nLen = nLen * sizeof(TCHAR);
	if (rc == ERROR_SUCCESS) {
		rc = ::RegSetValueEx(m_hKey, pszKey, 0, REG_SZ, (PBYTE)pszKeyValue, 
				nLen);
		CloseKey();
	}
	return rc;
}

HRESULT CeRegKey::GetIntValue(LPCTSTR pszKeyName, LPCTSTR pszKey, DWORD& dwKeyValue)
{
	DWORD dwSize, dwType = REG_DWORD;	
	dwSize = sizeof(DWORD);
	if (m_hKey == NULL)
		OpenKey(pszKeyName);
	return ::RegQueryValueEx(m_hKey, pszKey, 0, &dwType, (PBYTE)&dwKeyValue, &dwSize);
}

HRESULT CeRegKey::SetIntValue(LPCTSTR pszKeyName, LPCTSTR pszKey, DWORD dwKeyValue)
{
	DWORD dwDisp;

	INT rc = ::RegCreateKeyEx(m_hKeyName, pszKeyName, 0, TEXT(""), 0, 0, NULL, &m_hKey,
			&dwDisp);
	INT nLen = sizeof(DWORD);
	if (rc == ERROR_SUCCESS) {
		rc = ::RegSetValueEx(m_hKey, pszKey, 0, REG_DWORD, (PBYTE)&dwKeyValue, 
				nLen);
		CloseKey();	
	}
	return rc;
}

HRESULT CeRegKey::GetBinValue(LPCTSTR pszKeyName, LPCTSTR pszKey, PVOID pData, DWORD dwSize)
{
	DWORD dwType = REG_BINARY;	
	if (m_hKey == NULL)
		OpenKey(pszKeyName);
	return ::RegQueryValueEx(m_hKey, pszKey, 0, &dwType, (PBYTE)pData, &dwSize);
}

HRESULT CeRegKey::SetBinValue(LPCTSTR pszKeyName, LPCTSTR pszKey, PVOID pData, DWORD dwSize)
{
	DWORD dwDisp;

	INT rc = ::RegCreateKeyEx(m_hKeyName, pszKeyName, 0, TEXT(""), 0, 0, NULL, &m_hKey,
			&dwDisp);
	if (rc == ERROR_SUCCESS) {
		rc = ::RegSetValueEx(m_hKey, pszKey, 0, REG_BINARY, (PBYTE)pData, 
				dwSize);
		CloseKey();
	}
	return rc;
}

void CeRegKey::DelKey(LPCTSTR pszKeyName, LPCTSTR pszSubKey)
{
	if (m_hKey == NULL)
		OpenKey(pszKeyName);
    RegDeleteKey(m_hKey, pszSubKey);
}

void CeRegKey::DelValue(LPCTSTR pszKeyName, LPCTSTR pszValueName)
{
	if (m_hKey == NULL)
		OpenKey(pszKeyName);
    RegDeleteValue(m_hKey, pszValueName);
}