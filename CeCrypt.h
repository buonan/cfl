//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifndef _CECRYPT_H
#define _CECRYPT_H

// CryptoAPI definitions
/*
For non C/C++ users the constants used here are:
*/
#if (_WIN32_WCE >= 211)
#include <wincrypt.h>      
#define ALG_CLASS_HASH                  (4 << 13)
#define ALG_TYPE_ANY                    (0)
#define ALG_SID_MD5                     3
#define CALG_MD5        (ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_MD5)
#define CRYPT_EXPORTABLE        0x00000001
#define ALG_CLASS_DATA_ENCRYPT          (3 << 13)
#define ALG_TYPE_STREAM                 (4 << 9)
#define ALG_SID_RC2                     2
#define CALG_RC4        (ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_STREAM|ALG_SID_RC4)
#endif 

// Each encryption object contains a password key used to encrypt 
// or decrypt the data.
//
class CeCrypt 
{
public:
    CeCrypt();
    ~CeCrypt();

    BOOL FEncrypt(LPTSTR pData, int nSize, TCHAR* pszPassword);
    BOOL FDecrypt(LPTSTR pData, int nSize, TCHAR* pszPassword);

private:
#if (_WIN32_WCE >= 211)
    HCRYPTPROV      m_hProv;
    HCRYPTHASH      m_hHash;
    HCRYPTKEY       m_hKey;
#endif
};

#endif // _CECRYPT_H