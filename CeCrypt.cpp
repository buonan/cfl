//////////////////////////////////////////////////////////////////////////////
// Ce Framework Library for Windows CE
// 
// Written by BnKSoftware Inc.
// Copyright (c) 1998-2000 
// All rights reserved.
//
#include "stdafx.h"
#include "cecrypt.h"
#include "cestr.h"

#if (_WIN32_WCE > 211)
CeCrypt::CeCrypt() : m_hProv(0), m_hHash(0), m_hKey(0)
{
#ifndef _WIN32_WCE_EMULATION
    BOOL            bResult;
    // Attempt to acquire a handle to the default key container.
    bResult = CryptAcquireContext(
                &m_hProv,          // Variable to hold returned handle.
                NULL,              // Use default key container.
                NULL,              // Use default CSP.
                PROV_RSA_FULL,     // Type of provider to acquire.
                0);                // No special action.

    if (FALSE == bResult) 
        bResult = CryptAcquireContext(
                    &m_hProv,          // Variable to hold returned handle.
                    NULL,              // Use default key container.
                    NULL,              // Use default CSP.
                    PROV_RSA_FULL,     // Type of provider to acquire.
                    CRYPT_NEWKEYSET);  // No special action.

    // Obtain handle to hash object.
    bResult = CryptCreateHash(
                m_hProv,           // Handle to CSP obtained earlier
                CALG_SHA,          // Hashing algorithm
                0,                 // Non-keyed hash
                0,                 // Should be zero
                &m_hHash);         // Variable to hold hash object handle 
#endif
}
#else
CeCrypt::CeCrypt() 
{
}
#endif

CeCrypt::~CeCrypt()
{
#if (_WIN32_WCE > 211)
#ifndef _WIN32_WCE_EMULATION
    // Release hash object.
    CryptDestroyHash(m_hHash);
    m_hHash = 0;

    // Release context
    CryptReleaseContext(m_hProv, 0);
    m_hProv = 0;

    // Release key object.
    CryptDestroyKey(m_hKey);
    m_hKey = 0;
#endif
#endif
}

BOOL CeCrypt::FEncrypt(LPTSTR pData, int nSize, TCHAR* pszPassword)
{
    BOOL            bResult = FALSE;
#if (_WIN32_WCE > 211)
#ifndef _WIN32_WCE_EMULATION
    if (pData && pszPassword) {
        DWORD           dwError = 0;
        unsigned long   dwPasswordLength = lstrlen(pszPassword) * sizeof(TCHAR);
        unsigned long   dwBufferLen = MAX_PATH;
        unsigned long   dwDataLength = lstrlen(pData) * sizeof(TCHAR);

        if (m_hProv && m_hHash) {
            if (m_hKey == 0) {
                // Hash data.
                bResult = CryptHashData(
                            m_hHash,             // Handle to hash object
                            (BYTE*)pszPassword,  // Pointer to password
                            dwPasswordLength,    // Length of data
                            0);                  // No special flags

                // Create key from specified password.
                bResult = CryptDeriveKey(
                            m_hProv,            // Handle to CSP obtained earlier.
                            CALG_RC4,           // Use a stream cipher.
                            m_hHash,            // Handle to hashed password.
                            0,                  // Make key not exportable.
                            &m_hKey);           // Variable to hold handle of key.
            }

            // Encrypt data here
            if (m_hKey) {
                bResult = CryptEncrypt(
                             m_hKey, 
                             0,
                             1,
                             0,
                             (BYTE*)pData,
                             &dwDataLength,
                             dwBufferLen);
                OutputDebugString((LPTSTR)pData);
            }
        }
    }
#else
	if (pszPassword) {
		int nLength = lstrlen(pszPassword);	
		for (int i = 0, j = 0; i < nSize; ++i, ++j) {
			if (j >= nLength)
				j = 0;
			pData[i] = pData[i] + pszPassword[j];
		}
        bResult = TRUE;
	}
#endif
#else
	if (pszPassword) {
		int nLength = lstrlen(pszPassword);	
		for (int i = 0, j = 0; i < nSize; ++i, ++j) {
			if (j >= nLength)
				j = 0;
			pData[i] = pData[i] + pszPassword[j];
		}
        bResult = TRUE;
	}
#endif
    return bResult;
}

BOOL CeCrypt::FDecrypt(LPTSTR pData, int nSize, TCHAR* pszPassword)
{
    BOOL            bResult = FALSE;
#if (_WIN32_WCE > 211)
#ifndef _WIN32_WCE_EMULATION
    if (pData && pszPassword) {
        DWORD           dwError = 0;
        unsigned long   dwPasswordLength = lstrlen(pszPassword) * sizeof(TCHAR);
        unsigned long   dwBufferLen = MAX_PATH;
        unsigned long   dwDataLength = lstrlen(pData) * sizeof(TCHAR);

        if (m_hProv && m_hHash) {
            if (m_hKey == 0) {
                // Hash data.
                bResult = CryptHashData(
                            m_hHash,              // Handle to hash object
                            (BYTE*)pszPassword,   // Pointer to password
                            dwPasswordLength,     // Length of data
                            0);                   // No special flags

                // Create key from specified password.
                bResult = CryptDeriveKey(
                            m_hProv,             // Handle to CSP obtained earlier.
                            CALG_RC4,            // Use a stream cipher.
                            m_hHash,             // Handle to hashed password.
                            0,                   // Make key not exportable.
                            &m_hKey);            // Variable to hold handle of key.
            }

            // Decrypt data here
            if (m_hKey) {
                bResult = CryptDecrypt(
                             m_hKey,
                             0, 
                             1,
                             0,
                             (BYTE*)pData,
                             &dwDataLength);
                OutputDebugString((LPTSTR)pData);
            }
        }
    }
#else
	if (pszPassword) {
		int nLength = lstrlen(pszPassword);
		for (int i = 0, j = 0; i < nSize; ++i, ++j) {
			if (j >= nLength)
				j = 0;
			pData[i] = pData[i] - pszPassword[j];
		}
        bResult = TRUE;
	}
#endif
#else
	if (pszPassword) {
		int nLength = lstrlen(pszPassword);
		for (int i = 0, j = 0; i < nSize; ++i, ++j) {
			if (j >= nLength)
				j = 0;
			pData[i] = pData[i] - pszPassword[j];
		}
        bResult = TRUE;
	}
#endif
    return bResult;
}
