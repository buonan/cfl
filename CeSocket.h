//////////////////////////////////////////////////////////////////////////////
// Windows Ce Framework Library (CFL)
// 
// Written by BnKSoftware Corporation
// Copyright (c) 1998-2000 
// All rights reserved.
//
#ifndef _CESOCKET_H
#define _CESOCKET_H

//////////////////////////////////////////////////////////////////////////////
//
//
class CeSocket 
{
public:
	CeSocket();
	virtual ~CeSocket();

// Initialize
	bool Create(int nType = SOCK_STREAM);
	void Close();

	bool Connect(CHAR* pszServer, int nPort);
	bool Listen(int nPort);
	SOCKET Accept();

	unsigned long GetAddr(char* pszRemote);

// Write/Read
	int Write(CHAR* pBytesWrite, int cLength);
	int Read(CHAR* pBytesRead, int cLength);
	unsigned long GetReadSize();

	void operator =(SOCKET s)
	{ m_hSocket = s; }

public:
	SOCKET		m_hSocket;
	SOCKADDR_IN	m_saName;
};


//////////////////////////////////////////////////////////////////////////////
// CeAsyncSocket
//
#define WM_ASYNC			WM_USER+1

class CeAsyncSocket : public CeSocket
{
// Initialize
public:
	CeAsyncSocket();
	bool Create(HWND hWnd, int nMsg = WM_ASYNC, int nType = SOCK_STREAM);

public:
	HWND		m_hWnd;
};

//////////////////////////////////////////////////////////////////////////////
// CeListenSocket
//
#define WM_ASYNC_LISTEN		WM_USER+2

class CeListenSocket : public CeAsyncSocket
{
// Initialize
public:
	bool Create(HWND hWnd, int nMsg = WM_ASYNC_LISTEN, int nType = SOCK_STREAM);
};


//////////////////////////////////////////////////////////////////////////////
// CeDataSocket
//
#define WM_ASYNC_DATA		WM_USER+3

class CeDataSocket : public CeAsyncSocket
{
// Initialize
public:
	int Select(HWND hWnd, int nMsg = WM_ASYNC_DATA);

};

#endif // _CESOCKET_H