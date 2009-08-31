/* Testcase for PR381 Stackoverflow error with security manager, signed jars
   and -Djava.security.debug set.

Copyright (c) 2009, Red Hat Inc.

This file is part of IcedTea.

IcedTea is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.
 
IcedTea is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.
 
You should have received a copy of the GNU General Public License
along with IcedTea; see the file COPYING.  If not, write to the
Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
02110-1301 USA.
*/


import java.util.Date;

/**
 * Test class. Create a test keystore and dummy cert, create a jar file to
 * sign with the test class in it. Sign it run it with the security manager
 * on, plus accesscontroller debugging, will go into infinite recursion
 * trying to get enough permissions for printing Date of failing
 * certificate, unless fix is applied.
 */
public class TimeZoneDatePermissionCheck
{
  public static void main(String[] args)
  {
    System.out.println(new Date());
  }
}
