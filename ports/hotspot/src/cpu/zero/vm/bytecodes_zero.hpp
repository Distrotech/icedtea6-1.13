/*
 * Copyright 1997-2007 Sun Microsystems, Inc.  All Rights Reserved.
 * Copyright 2009 Red Hat, Inc.
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

#if defined(PRODUCT) && defined(HOTSPOT_ASM)
#define _iaccess_0	((Bytecodes::Code)0xdb)
#define _iaccess_1	((Bytecodes::Code)0xdc)
#define _iaccess_2	((Bytecodes::Code)0xdd)
#define _iaccess_3	((Bytecodes::Code)0xde)
	_iload_0_iconst_N	,	// 231
	_iload_1_iconst_N	,	// 232
	_iload_2_iconst_N	,	// 233
	_iload_3_iconst_N	,	// 234
	_iload_iconst_N		,	// 235
	_invokeresolved		,	// 236
	_iadd_istore_N		,	// 237
	_isub_istore_N		,	// 238
	_iand_istore_N		,	// 239
	_ior_istore_N		,	// 240
	_ixor_istore_N		,	// 241
	_iadd_u4store		,	// 242
	_isub_u4store		,	// 243
	_iand_u4store		,	// 244
	_ior_u4store		,	// 245
	_ixor_u4store		,	// 246
	_invokespecialresolved	,	// 247
	_invokestaticresolved	,	// 248
#endif // HOTSPOT_ASM
