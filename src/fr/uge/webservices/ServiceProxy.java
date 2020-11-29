package fr.uge.webservices;

public class ServiceProxy implements fr.uge.webservices.Service {
  private String _endpoint = null;
  private fr.uge.webservices.Service service = null;
  
  public ServiceProxy() {
    _initServiceProxy();
  }
  
  public ServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initServiceProxy();
  }
  
  private void _initServiceProxy() {
    try {
      service = (new fr.uge.webservices.ServiceServiceLocator()).getService();
      if (service != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)service)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)service)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (service != null)
      ((javax.xml.rpc.Stub)service)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public fr.uge.webservices.Service getService() {
    if (service == null)
      _initServiceProxy();
    return service;
  }
  
  public java.lang.String getBuyableCarsJson(java.lang.String currency) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getBuyableCarsJson(currency);
  }
  
  public int buyCar(long carId, java.lang.String login, java.lang.String password) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.buyCar(carId, login, password);
  }
  
  public java.lang.String getActiveCurrencies() throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getActiveCurrencies();
  }
  
  public boolean removeBasket(long carId) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.removeBasket(carId);
  }
  
  public boolean addBasket(long carId) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.addBasket(carId);
  }
  
  public java.lang.String basketToJson() throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.basketToJson();
  }
  
  public boolean isInBasket(long carId) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.isInBasket(carId);
  }
  
  
}