package org.omg.PortableServer.POAPackage;


/**
* org/omg/PortableServer/POAPackage/NoServant.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from ../../../../src/share/classes/org/omg/PortableServer/poa.idl
* Friday, May 25, 2007 3:39:54 o'clock PM GMT-05:00
*/

public final class NoServant extends org.omg.CORBA.UserException
{

  public NoServant ()
  {
    super(NoServantHelper.id());
  } // ctor


  public NoServant (String $reason)
  {
    super(NoServantHelper.id() + "  " + $reason);
  } // ctor

} // class NoServant
