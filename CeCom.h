//////////////////////////////////////////////////////////////////////////////
// Class CComObject implements IUnknown interface for class C
// Class C is the implementation class
//	Example:
//			CComObject<CFoo>
//

//////////////////////////////////////////////////////////////////////////////
// IUnknown template
// 
template <class C> class CComObject : public C
{
public:
	CComObject() : m_cRef(0), m_iid(0)
	{ }
	CComObject(IID D) : m_cRef(0), m_iid(D)
	{ }
	~CComObject()
	{ }
	virtual HRESULT __stdcall QueryInterface(REFIID riid, void** ppv);
	virtual ULONG __stdcall AddRef();
	virtual ULONG __stdcall Release();

	IID		m_iid;

private:
	LONG	m_cRef;
};

template<class C>HRESULT __stdcall CComObject<C>::QueryInterface(REFIID riid, 
																void** ppv)
{
	HRESULT hr = S_OK;
	*ppv = 0;
	if (riid == IID_IUnknown)
	{
		*ppv = static_cast<C*>(this);
		static_cast<IUnknown*>(*ppv)->AddRef();
	}
	else
		hr = C::QueryInterface(riid, ppv);

	return hr;
}

template<class C>ULONG __stdcall CComObject<C>::AddRef()
{
	return InterlockedIncrement(&m_cRef);
}

template<class C>ULONG __stdcall CComObject<C>::Release()
{
	if (InterlockedDecrement(&m_cRef) == 0)
	{
		delete this;
		return 0;
	}
	return (m_cRef);
}

