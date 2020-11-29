/**
 * ServiceService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package fr.uge.webservices;

public interface ServiceService extends javax.xml.rpc.Service {
    public java.lang.String getServiceAddress();

    public fr.uge.webservices.Service getService() throws javax.xml.rpc.ServiceException;

    public fr.uge.webservices.Service getService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
