/**
 * Service.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package fr.uge.webservices;

public interface Service extends java.rmi.Remote {
    public java.lang.String getBuyableCarsJson(java.lang.String currency) throws java.rmi.RemoteException;
    public boolean removeBasket(long carId) throws java.rmi.RemoteException;
    public java.lang.String basketToJson() throws java.rmi.RemoteException;
    public boolean buyCar(long carId, java.lang.String login, java.lang.String password) throws java.rmi.RemoteException;
    public java.lang.String getActiveCurencies() throws java.rmi.RemoteException;
    public boolean addBasket(long carId) throws java.rmi.RemoteException;
    public boolean isInBasket(long carId) throws java.rmi.RemoteException;
}
