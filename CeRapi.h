//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifdef _WIN32_WCE
class CeRapi
{
public:
	INT ReadServer(WCHAR* pszDll, WCHAR* pszFunc, WCHAR* pszQuery, WCHAR* pszResult);
	INT WriteServer(WCHAR* pszDll, WCHAR* pszFunc, WCHAR* pszQuery);

	BOOL PreCall();
	void PostCall();
};
#endif // _WIN32_WCE