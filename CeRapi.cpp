//////////////////////////////////////////////////////////////////////////////
// Ce Framework Library for Windows CE
// 
// Written by Brian Ku
// Copyright (c) 1998 
//
#include "stdafx.h"

#ifdef _WIN32_WCE
#include <rapi.h>
#include "cerapi.h"

BOOL CeRapi::PreCall()
{
	RAPIINIT rii;
	int rc;

	rii.cbSize = sizeof(rii);
	rc = CeRapiInitEx(&rii);
	if (rc != NOERROR)
	{
		wprintf((LPWSTR)TEXT("RapiInitEx failed!\n"));
		return FALSE;
	}
	rc = WaitForSingleObject(rii.heRapiInit, 2000);
	if (rc == WAIT_OBJECT_0)
	{
		if (rii.hrRapiInit != NOERROR)
		{
			wprintf((LPWSTR)TEXT("RapiInitEx failed!\n"));
			return FALSE;
		}
	}
	else if (rc == WAIT_TIMEOUT)
	{
		wprintf((LPWSTR)TEXT("RapiInitEx timed out!\n"));
		return FALSE;
	}
	return TRUE;
}

void CeRapi::PostCall()
{
	CeRapiUninit();
}

INT CeRapi::ReadServer(WCHAR* pszDll, WCHAR* pszFunc, WCHAR* pszQuery, WCHAR* pszResult)
{
	int rc = -1;
	if (PreCall())
	{
		DWORD dwIn, dwOut;
		BYTE bBuf[256];
		BYTE* pOut;
		INT nCmd = 0;
		dwIn = lstrlen(pszQuery)+1;
		IRAPIStream* piRS;
		lstrcpy((LPWSTR)bBuf, pszQuery);
		rc = CeRapiInvoke(pszDll, pszFunc, dwIn, bBuf, &dwOut, &pOut, &piRS, 0);
		DWORD cb;

		if (rc == 0)
		{
			piRS->Read(&nCmd, sizeof(nCmd), &cb);	// Read command
			piRS->Read(&nCmd, sizeof(nCmd), &cb);	// Read size of string
			piRS->Read(bBuf, nCmd, &cb);			// Read string	

			memcpy((LPWSTR)pszResult, (LPWSTR)bBuf, nCmd);		// Copy result
		}
		PostCall();
	}
	return rc;
}

INT CeRapi::WriteServer(WCHAR* pszDll, WCHAR* pszFunc, WCHAR* pszData)
{
	int rc = -1;
	if (PreCall())
	{
		DWORD dwIn, dwOut;
		BYTE bBuf[256];
		BYTE* pOut;
		dwIn = (lstrlen(pszData)+1) * sizeof (WCHAR);

		lstrcpy((LPWSTR)bBuf, pszData);

		rc = CeRapiInvoke(pszDll, pszFunc, dwIn, bBuf, &dwOut, &pOut, NULL, 0);

		PostCall();
	}
	return rc;
}
#endif // _WIN32_WCE