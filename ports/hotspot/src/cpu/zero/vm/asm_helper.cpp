/*
 * Copyright 2009 Edward Nevill
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
 */

#include "incls/_precompiled.incl"

#ifndef STATIC_OFFSETS

extern "C" void sanity_check_backtrace(ZeroFrame *frame, int *regs);

extern "C" void check_java_threads_backtrace(int *regs)
{
  for (JavaThread* jt = Threads::first(); jt != NULL; jt = jt->next()) {
    if (jt->threadObj() == NULL   ||
        jt->is_exiting() ||
        !java_lang_Thread::is_alive(jt->threadObj())   ||
        jt->is_hidden_from_external_view()) {
      continue;
    }
    if (jt->is_jvmti_agent_thread()) continue;
    if (jt->is_attaching()) continue;
    sanity_check_backtrace(jt->top_zero_frame(), regs);
  }
}

/* Thease functions allow the ASM interpreter to call CPP virtual functions.
 * Otherwise the ASM interpreter has to grup around in the VTABLE which is
 * not very portable.
 */
extern "C" bool JavaThread_is_lock_owned(JavaThread *r0, address r1)
{
	return r0->is_lock_owned(r1);
}

extern "C" HeapWord **CollectedHeap_top_addr(CollectedHeap *r0)
{
	return r0->top_addr();
}

extern "C" HeapWord **CollectedHeap_end_addr(CollectedHeap *r0)
{
	return r0->end_addr();
}

#endif // STATIC_OFFSETS

#ifdef STATIC_OFFSETS

class VMStructs {
public:
	static void print_vm_offsets(void);
};

#define outfile	stdout

void print_def(const char *s, int v)
{
	fprintf(outfile, "#define %-40s 0x%02x\n", s, v);
}

void nl(void)
{
	fputc('\n', outfile);
}

void VMStructs::print_vm_offsets(void)
{
	print_def("THREAD_PENDING_EXC", offset_of(JavaThread, _pending_exception));
	print_def("THREAD_SUSPEND_FLAGS", offset_of(JavaThread, _suspend_flags));
	print_def("THREAD_ACTIVE_HANDLES", offset_of(JavaThread, _active_handles));
	print_def("THREAD_LAST_HANDLE_MARK", offset_of(JavaThread, _last_handle_mark));
	print_def("THREAD_TLAB_TOP", offset_of(JavaThread, _tlab) + offset_of(ThreadLocalAllocBuffer, _top));
	print_def("THREAD_TLAB_END", offset_of(JavaThread, _tlab) + offset_of(ThreadLocalAllocBuffer, _end));
	print_def("THREAD_RESOURCEAREA", offset_of(JavaThread, _resource_area));
	print_def("THREAD_HANDLE_AREA", offset_of(JavaThread, _handle_area));
	print_def("THREAD_STACK_BASE", offset_of(JavaThread, _stack_base));
	print_def("THREAD_STACK_SIZE", offset_of(JavaThread, _stack_size));
	print_def("THREAD_LAST_JAVA_SP", offset_of(JavaThread, _anchor) + offset_of(JavaFrameAnchor, _last_Java_sp));
	print_def("THREAD_JNI_ENVIRONMENT", offset_of(JavaThread, _jni_environment));
	print_def("THREAD_VM_RESULT", offset_of(JavaThread, _vm_result));
	print_def("THREAD_STATE", offset_of(JavaThread, _thread_state));
	print_def("THREAD_DO_NOT_UNLOCK", offset_of(JavaThread, _do_not_unlock_if_synchronized));

	print_def("THREAD_JAVA_STACK_BASE", offset_of(JavaThread, _zero_stack) + ZeroStack::base_offset());
	print_def("THREAD_JAVA_SP", offset_of(JavaThread, _zero_stack) + ZeroStack::sp_offset());
	print_def("THREAD_TOP_ZERO_FRAME", offset_of(JavaThread, _top_zero_frame));
	print_def("THREAD_SPECIALRUNTIMEEXITCONDITION", offset_of(JavaThread, _special_runtime_exit_condition));
	nl();
	print_def("_thread_external_suspend",	Thread::_external_suspend);
	print_def("_thread_ext_suspended",	Thread::_ext_suspended);
	print_def("_thread_deopt_suspend",	Thread::_deopt_suspend);
	nl();
	print_def("METHOD_CONSTMETHOD", offset_of(methodOopDesc, _constMethod));
	print_def("METHOD_CONSTANTS", offset_of(methodOopDesc, _constants));
	print_def("METHOD_METHODDATA", offset_of(methodOopDesc, _method_data));
	print_def("METHOD_INVOKECOUNT", offset_of(methodOopDesc, _interpreter_invocation_count));
	print_def("METHOD_ACCESSFLAGS", offset_of(methodOopDesc, _access_flags));
	print_def("METHOD_VTABLEINDEX", offset_of(methodOopDesc, _vtable_index));
	print_def("METHOD_RESULTINDEX", offset_of(methodOopDesc, _result_index));
	print_def("METHOD_METHODSIZE", offset_of(methodOopDesc, _method_size));
	print_def("METHOD_MAXSTACK", offset_of(methodOopDesc, _max_stack));
	print_def("METHOD_MAXLOCALS", offset_of(methodOopDesc, _max_locals));
	print_def("METHOD_SIZEOFPARAMETERS", offset_of(methodOopDesc, _size_of_parameters));
	print_def("METHOD_INVOCATIONCOUNTER", offset_of(methodOopDesc, _invocation_counter));
	print_def("METHOD_BACKEDGECOUNTER", offset_of(methodOopDesc, _backedge_counter));
	print_def("METHOD_FROM_INTERPRETED", offset_of(methodOopDesc, _from_interpreted_entry));
	// ECN: These two appear to be just tagged onto the end of the class
	print_def("METHOD_NATIVEHANDLER", sizeof(methodOopDesc));
	print_def("METHOD_SIGNATUREHANDLER", sizeof(methodOopDesc)+4);
	nl();
	print_def("CONSTMETHOD_CODEOFFSET", sizeof(constMethodOopDesc));
	nl();
	print_def("JNIHANDLEBLOCK_TOP", offset_of(JNIHandleBlock, _top));
	nl();
	print_def("KLASS_PART", klassOopDesc::klass_part_offset_in_bytes());
	print_def("KLASS_ACCESSFLAGS", offset_of(Klass, _access_flags));
	print_def("INSTANCEKLASS_INITSTATE", offset_of(instanceKlass, _init_state));
	print_def("INSTANCEKLASS_VTABLE_LEN", offset_of(instanceKlass, _vtable_len));
	print_def("INSTANCEKLASS_ITABLE_LEN", offset_of(instanceKlass, _itable_len));
	print_def("INSTANCEKLASS_VTABLE_OFFSET", instanceKlass::vtable_start_offset() * sizeof(int *));
	print_def("OBJARRAYKLASS_ELEMENTKLASS", offset_of(objArrayKlass, _element_klass));
	nl();
	print_def("CONSTANTPOOL_TAGS", offset_of(constantPoolOopDesc, _tags));
	print_def("CONSTANTPOOL_CACHE", offset_of(constantPoolOopDesc, _cache));
	nl();
	print_def("SIZEOF_HANDLEMARK", sizeof(HandleMark));
}

int main(void)
{
	print_def("JVM_CONSTANT_Utf8",		JVM_CONSTANT_Utf8);
	print_def("JVM_CONSTANT_Unicode",	JVM_CONSTANT_Unicode);
	print_def("JVM_CONSTANT_Integer",	JVM_CONSTANT_Integer);
	print_def("JVM_CONSTANT_Float",		JVM_CONSTANT_Float);
	print_def("JVM_CONSTANT_Long",		JVM_CONSTANT_Long);
	print_def("JVM_CONSTANT_Double",	JVM_CONSTANT_Double);
	print_def("JVM_CONSTANT_Class",		JVM_CONSTANT_Class);
	print_def("JVM_CONSTANT_String",	JVM_CONSTANT_String);
	print_def("JVM_CONSTANT_Fieldref",	JVM_CONSTANT_Fieldref);
	print_def("JVM_CONSTANT_Methodref",	JVM_CONSTANT_Methodref);
	print_def("JVM_CONSTANT_InterfaceMethodref", JVM_CONSTANT_InterfaceMethodref);
	print_def("JVM_CONSTANT_NameAndType",	JVM_CONSTANT_NameAndType);
	nl();
	print_def("JVM_CONSTANT_UnresolvedClass",	JVM_CONSTANT_UnresolvedClass);
	print_def("JVM_CONSTANT_ClassIndex",		JVM_CONSTANT_ClassIndex);
	print_def("JVM_CONSTANT_UnresolvedString",	JVM_CONSTANT_UnresolvedString);
	print_def("JVM_CONSTANT_StringIndex",		JVM_CONSTANT_StringIndex);
	print_def("JVM_CONSTANT_UnresolvedClassInError",JVM_CONSTANT_UnresolvedClassInError);
	nl();
	print_def("JVM_ACC_PUBLIC",	JVM_ACC_PUBLIC);
	print_def("JVM_ACC_PRIVATE",	JVM_ACC_PRIVATE);
	print_def("JVM_ACC_PROTECTED",	JVM_ACC_PROTECTED);
	print_def("JVM_ACC_STATIC",	JVM_ACC_STATIC);
	print_def("JVM_ACC_FINAL",	JVM_ACC_FINAL);
	print_def("JVM_ACC_SYNCHRONIZED",	JVM_ACC_SYNCHRONIZED);
	print_def("JVM_ACC_SUPER",	JVM_ACC_SUPER);
	print_def("JVM_ACC_VOLATILE",	JVM_ACC_VOLATILE);
	print_def("JVM_ACC_BRIDGE",	JVM_ACC_BRIDGE);
	print_def("JVM_ACC_TRANSIENT",	JVM_ACC_TRANSIENT);
	print_def("JVM_ACC_VARARGS",	JVM_ACC_VARARGS);
	print_def("JVM_ACC_NATIVE",	JVM_ACC_NATIVE);
	print_def("JVM_ACC_INTERFACE",	JVM_ACC_INTERFACE);
	print_def("JVM_ACC_ABSTRACT",	JVM_ACC_ABSTRACT);
	print_def("JVM_ACC_STRICT",	JVM_ACC_STRICT);
	print_def("JVM_ACC_SYNTHETIC",	JVM_ACC_SYNTHETIC);
	print_def("JVM_ACC_ANNOTATION",	JVM_ACC_ANNOTATION);
	print_def("JVM_ACC_ENUM",	JVM_ACC_ENUM);
	print_def("JVM_ACC_HAS_FINALIZER", JVM_ACC_HAS_FINALIZER);
	nl();
	print_def("T_BOOLEAN",	T_BOOLEAN);
	print_def("T_CHAR",	T_CHAR);
	print_def("T_FLOAT",	T_FLOAT);
	print_def("T_DOUBLE",	T_DOUBLE);
	print_def("T_BYTE",	T_BYTE);
	print_def("T_SHORT",	T_SHORT);
	print_def("T_INT",	T_INT);
	print_def("T_LONG",	T_LONG);
	print_def("T_OBJECT",	T_OBJECT);
	print_def("T_ARRAY",	T_ARRAY);
	print_def("T_VOID",	T_VOID);
	nl();
	print_def("_thread_uninitialized",	_thread_uninitialized);
	print_def("_thread_new",		_thread_new);
	print_def("_thread_new_trans",		_thread_new_trans);
	print_def("_thread_in_native",		_thread_in_native);
	print_def("_thread_in_native_trans",	_thread_in_native_trans);
	print_def("_thread_in_vm",		_thread_in_vm);
	print_def("_thread_in_vm_trans",	_thread_in_vm_trans);
	print_def("_thread_in_Java",		_thread_in_Java);
	print_def("_thread_in_Java_trans",	_thread_in_Java_trans);
	print_def("_thread_blocked",		_thread_blocked);
	print_def("_thread_blocked_trans",	_thread_blocked_trans);
	print_def("_thread_max_state",		_thread_max_state);
	nl();
	print_def("class_unparsable_by_gc",	instanceKlass::unparsable_by_gc);
	print_def("class_allocated",		instanceKlass::allocated);
	print_def("class_loaded",		instanceKlass::loaded);
	print_def("class_linked",		instanceKlass::linked);
	print_def("class_being_initialized",	instanceKlass::being_initialized);
	print_def("class_fully_initialized",	instanceKlass::fully_initialized);
	print_def("class_init_error",		instanceKlass::initialization_error);
	nl();
	print_def("flag_methodInterface",	1 << ConstantPoolCacheEntry::methodInterface);
	print_def("flag_volatileField",		1 << ConstantPoolCacheEntry::volatileField);
	print_def("flag_vfinalMethod",		1 << ConstantPoolCacheEntry::vfinalMethod);
	print_def("flag_finalField",		1 << ConstantPoolCacheEntry::finalField);
	nl();
	print_def("INVOCATIONCOUNTER_COUNTINCREMENT", InvocationCounter::count_increment);
	nl();
	VMStructs::print_vm_offsets();
	nl();
	print_def("VMSYMBOLS_ArithmeticException", vmSymbols::java_lang_ArithmeticException_enum);
	print_def("VMSYMBOLS_ArrayIndexOutOfBounds", vmSymbols::java_lang_ArrayIndexOutOfBoundsException_enum);
	print_def("VMSYMBOLS_ArrayStoreException", vmSymbols::java_lang_ArrayStoreException_enum);
	print_def("VMSYMBOLS_ClassCastException", vmSymbols::java_lang_ClassCastException_enum);
	print_def("VMSYMBOLS_NullPointerException", vmSymbols::java_lang_NullPointerException_enum);
	print_def("VMSYMBOLS_AbstractMethodError", vmSymbols::java_lang_AbstractMethodError_enum);
	print_def("VMSYMBOLS_IncompatibleClassChangeError", vmSymbols::java_lang_IncompatibleClassChangeError_enum);
	print_def("VMSYMBOLS_InternalError", vmSymbols::java_lang_InternalError_enum);

	return 0;
}

#endif // STATIC_OFFSETS
