/*
 * Copyright 2003 Sun Microsystems, Inc.  All Rights Reserved.
 * Copyright 2007 Red Hat, Inc.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
 * CA 95054 USA or visit www.sun.com if you need additional information or
 * have any questions.
 *
 */

#include "incls/_precompiled.incl"
#include "incls/_bytecodes_zero.cpp.incl"

void Bytecodes::pd_initialize()
{
#if defined(PRODUCT) && defined(HOTSPOT_ASM)
  def(_iaccess_0, "_iaccess_0", "b_jj", NULL, T_INT,  1, true, _aload_0);
  def(_iaccess_1, "_iaccess_1", "b_jj", NULL, T_INT,  1, true, _aload_1);
  def(_iaccess_2, "_iaccess_2", "b_jj", NULL, T_INT,  1, true, _aload_2);
  def(_iaccess_3, "_iaccess_3", "b_jj", NULL, T_INT,  1, true, _aload_3);

  def(_iload_0_iconst_N, "iload_0_iconst_N", "b_",  NULL, T_INT, 2, false, _iload_0);
  def(_iload_1_iconst_N, "iload_1_iconst_N", "b_",  NULL, T_INT, 2, false, _iload_1);
  def(_iload_2_iconst_N, "iload_2_iconst_N", "b_",  NULL, T_INT, 2, false, _iload_2);
  def(_iload_3_iconst_N, "iload_3_iconst_N", "b_",  NULL, T_INT, 2, false, _iload_3);
  def(_iload_iconst_N,   "iload_iconst_N",   "bi_", NULL, T_INT, 2, false, _iload);
  def(_invokeresolved,   "invokeresolved",   "bjj", NULL, T_ILLEGAL, -1, true, _invokevirtual);

  def(_iadd_istore_N,    "iadd_istore_N",    "b_",  NULL, T_VOID, -2, false, _iadd);
  def(_isub_istore_N,    "isub_istore_N",    "b_",  NULL, T_VOID, -2, false, _isub);
  def(_iand_istore_N,    "iand_istore_N",    "b_",  NULL, T_VOID, -2, false, _iand);
  def(_ior_istore_N,     "ior_istore_N",     "b_",  NULL, T_VOID, -2, false, _ior);
  def(_ixor_istore_N,    "ixor_istore_N",    "b_",  NULL, T_VOID, -2, false, _ixor);

  def(_iadd_u4store,     "iadd_u4store",     "b_i", NULL, T_VOID, -2, false, _iadd);
  def(_isub_u4store,     "isub_u4store",     "b_i", NULL, T_VOID, -2, false, _isub);
  def(_iand_u4store,     "iand_u4store",     "b_i", NULL, T_VOID, -2, false, _iand);
  def(_ior_u4store,      "ior_u4store",      "b_i", NULL, T_VOID, -2, false, _ior);
  def(_ixor_u4store,     "ixor_u4store",     "b_i", NULL, T_VOID, -2, false, _ixor);

  def(_invokespecialresolved, "invokespecialresolved", "bjj", NULL, T_ILLEGAL, -1, true, _invokespecial);
  def(_invokestaticresolved,  "invokestaticresolved",  "bjj", NULL, T_ILLEGAL,  0, true, _invokestatic);
#endif // HOTSPOT_ASM
}
