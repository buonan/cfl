//////////////////////////////////////////////////////////////////////////////
// Ce Framework Library for Windows CE
// 
// Written by BnKSoftware Inc.
// Copyright (c) 1998-2000 
//
#include "stdafx.h"
#include "cesocket.h"

#ifdef DEBUG
void Trace(WCHAR* pwzString, CHAR* pszText, int nInt=0)
{
	TCHAR* pszDebug;
	WCHAR* pwzTrace;
	pwzTrace = new WCHAR[strlen(pszText)+1];
	mbstowcs(pwzTrace, pszText, strlen(pszText));
	pszDebug = new TCHAR[wcslen(pwzString) + wcslen(pwzTrace) + 25];
	wsprintf(pszDebug, TEXT("%s\t%s\t%d\n"), pwzString, pwzTrace, nInt);	
	OutputDebugString(pszDebug);
	MessageBox(0, pszDebug, TEXT("Debug"), MB_OK);
	delete pwzTrace;
	delete pszDebug;
}
#endif

//////////////////////////////////////////////////////////////////////////////
// CeSocket
//
CeSocket::CeSocket()
{
	m_hSocket = 0;
};

CeSocket::~CeSocket()
{
	Close();
	m_hSocket = 0;
}

bool CeSocket::Create(int nType /*SOCK_STREAM*/)
{
	// We are non-overlapped
	if (INVALID_SOCKET == (m_hSocket = socket(AF_INET, nType, 0)))
	{
		return false;
	}
	return true;
}
 
bool CeSocket::Connect(CHAR* pszServer, int nPort)
{
	// Server info
	HOSTENT* phos = gethostbyname(pszServer);
	if (phos)
	{
        DWORD dwReturn = 0;
		m_saName.sin_family = AF_INET;
		m_saName.sin_port = htons(nPort);
		m_saName.sin_addr.s_addr = ((LPIN_ADDR)phos->h_addr)->s_addr;
	
		dwReturn == connect(m_hSocket, (LPSOCKADDR)&m_saName, sizeof(m_saName));

        if (SOCKET_ERROR == dwReturn)
		{
            int n = WSAGetLastError();
            //Trace(L"Connect:", "Connect failed!", n);      
			return false;
		}
        //Trace(L"Connect:", "Connect succeeded!", dwReturn);      
		return true;
	}
	return false;
}

void CeSocket::Close()
{
	shutdown(m_hSocket, 1);
	closesocket(m_hSocket);
}

bool CeSocket::Listen(int nPort)
{
	char host[255];
	gethostname(host, 255);
	HOSTENT* phos = gethostbyname(host);
	char* padd;
	if (phos)
	{
		int j = 0;
		do {
			padd = inet_ntoa(*(LPIN_ADDR)phos->h_addr_list[j]);
			j++;
		} while (phos->h_addr_list[j] && (j<5));

		m_saName.sin_family = AF_INET;
		m_saName.sin_port = htons(nPort);
#ifdef _WIN32_WCE_EMULATION
		m_saName.sin_addr = *(LPIN_ADDR)phos->h_addr_list[--j];
#else
		m_saName.sin_addr = *(LPIN_ADDR)phos->h_addr_list[0];
#endif
		if (SOCKET_ERROR == bind(m_hSocket, (LPSOCKADDR)&m_saName, sizeof(m_saName)))
		{
			return false;
		}

		if (SOCKET_ERROR == listen(m_hSocket, 5))
		{
			return false;
		}

		return true;
	}
	return false;
}

SOCKET CeSocket::Accept()
{
	int len = sizeof(m_saName);
	SOCKET sAccept;
#ifdef _WIN32_WCE
	FD_SET fd;
	FD_ZERO(&fd);
	FD_SET(m_hSocket, &fd);
	TIMEVAL tv = {5, 0};
	if(select(0, &fd, NULL, NULL, &tv) == 0) 
		return 0;
	if (FD_ISSET(m_hSocket, &fd))
#endif	
	{
		if (INVALID_SOCKET == (sAccept = accept(m_hSocket, (LPSOCKADDR)&m_saName, &len)))
		{
			return INVALID_SOCKET;
		}
	}

	return sAccept;
}

unsigned long CeSocket::GetAddr(char* pszRemote)
{
	HOSTENT* phos = 0;
	unsigned long lAddr = INADDR_ANY;
	if (pszRemote)
	{
		// Try dotted addr xxx.xxx.xxx
		lAddr = inet_addr(pszRemote);
		if (lAddr == INADDR_ANY)
		{
			// Try server name
			if (phos = gethostbyname(pszRemote))
				lAddr = *((unsigned long*)(phos->h_addr));
		}
	}
	return lAddr;
}

int CeSocket::Write(CHAR* pBytesWrite, int cSize)
{
	int Sent = -1;
	// NOTE: Those CE bastards made it so m_hSocket can be 0 and valid
	//if (m_hSocket)
	{
		FD_SET fd;
		FD_ZERO(&fd);
		FD_SET(m_hSocket, &fd);
		TIMEVAL tv = {5, 0};
		if(select(0, NULL, &fd, NULL, &tv) == 0) 
			return 0;

		Sent = send(m_hSocket, pBytesWrite, cSize, 0);
	}
#ifdef DEBUG
		Trace(L"Write:", (char*)pBytesWrite, cSize);
#endif
	return Sent;
}

int CeSocket::Read(CHAR* pBytesRead, int cSize)
{
	int Recv = -1;
	// NOTE: Those CE bastards made it so m_hSocket can be 0 and valid
	//if (m_hSocket)
	{
		FD_SET fd;
		FD_ZERO(&fd);
		FD_SET(m_hSocket, &fd);
		TIMEVAL tv = {5, 0};

		// While we have something to read
		int cTotal = 0;
		while ((cTotal < cSize) && (select(0, &fd, NULL, NULL, &tv) != 0))
		{
			Recv = recv(m_hSocket, pBytesRead+cTotal, cSize-cTotal, 0);
			if (Recv == SOCKET_ERROR || Recv == 0)
			{
				break;
			}

			cTotal += Recv;
		}
		pBytesRead[cTotal+1] = '\0';
#ifdef DEBUG
		Trace(L"Read:", (char*)pBytesRead, cTotal);
#endif
	}
	return Recv;
}

unsigned long CeSocket::GetReadSize()
{
	unsigned long lSize = -1;
	// NOTE: Those CE bastards made it so m_hSocket can be 0 and valid
	//if (m_hSocket)
	{
		char szBuf[255];
		if (SOCKET_ERROR != (lSize = recv(m_hSocket, szBuf, 255, MSG_PEEK)))
			return lSize;
	}
	return lSize;
}



//////////////////////////////////////////////////////////////////////////////
// CeAsyncSocket
//
CeAsyncSocket::CeAsyncSocket()
{
	m_hWnd = 0;
}

bool CeAsyncSocket::Create(HWND hWnd, int nMsg /*WM_ASYNC*/, int nType /*SOCK_STREAM*/)
{
	bool fRet = CeSocket::Create(nType);
	if (fRet)
	{		
		// Set our hwnd to receive WM_ASYNC msg 
		m_hWnd = hWnd;

#ifndef _WIN32_WCE
		if (SOCKET_ERROR == WSAAsyncSelect(m_hSocket, m_hWnd, nMsg, 
			(FD_CONNECT|FD_ACCEPT|FD_READ|FD_WRITE)))
		{
			return false;
		}
#endif
	}
	return true;
}


//////////////////////////////////////////////////////////////////////////////
// CeListenSocket
//

bool CeListenSocket::Create(HWND hWnd, int nMsg /*WM_ASYNC_LISTEN*/, int nType /*SOCK_STREAM*/)
{
	return CeAsyncSocket::Create(hWnd, nMsg, nType);
}


//////////////////////////////////////////////////////////////////////////////
// CeDataSocket
//
int CeDataSocket::Select(HWND hWnd, int nMsg /*WM_ASYNC_DATA*/)
{
#ifndef _WIN32_WCE
	return WSAAsyncSelect(m_hSocket, hWnd, nMsg, (FD_CLOSE|FD_WRITE|FD_READ));
#else
	return 0;
#endif
}

