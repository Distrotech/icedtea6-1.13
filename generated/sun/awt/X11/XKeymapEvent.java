// This file is an automatically generated file, please do not edit this file, modify the WrapperGenerator.java file instead !

package sun.awt.X11;

import sun.misc.*;

import java.util.logging.*;
public class XKeymapEvent extends XWrapperBase { 
	private Unsafe unsafe = XlibWrapper.unsafe; 
	private final boolean should_free_memory;
	public static int getSize() { return ((XlibWrapper.dataModel == 32)?(52):(72)); }
	public int getDataSize() { return getSize(); }

	long pData;

	public long getPData() { return pData; }


	public XKeymapEvent(long addr) {
		log.finest("Creating");
		pData=addr;
		should_free_memory = false;
	}


	public XKeymapEvent() {
		log.finest("Creating");
		pData = unsafe.allocateMemory(getSize());
		should_free_memory = true;
	}


	public void dispose() {
		log.finest("Disposing");
		if (should_free_memory) {
			log.finest("freeing memory");
			unsafe.freeMemory(pData); 
	}
		}
	public int get_type() { log.finest("");return (Native.getInt(pData+0)); }
	public void set_type(int v) { log.finest(""); Native.putInt(pData+0, v); }
	public long get_serial() { log.finest("");return (Native.getLong(pData+((XlibWrapper.dataModel == 32)?(4):(8)))); }
	public void set_serial(long v) { log.finest(""); Native.putLong(pData+((XlibWrapper.dataModel == 32)?(4):(8)), v); }
	public boolean get_send_event() { log.finest("");return (Native.getBool(pData+((XlibWrapper.dataModel == 32)?(8):(16)))); }
	public void set_send_event(boolean v) { log.finest(""); Native.putBool(pData+((XlibWrapper.dataModel == 32)?(8):(16)), v); }
	public long get_display() { log.finest("");return (Native.getLong(pData+((XlibWrapper.dataModel == 32)?(12):(24)))); }
	public void set_display(long v) { log.finest(""); Native.putLong(pData+((XlibWrapper.dataModel == 32)?(12):(24)), v); }
	public long get_window() { log.finest("");return (Native.getLong(pData+((XlibWrapper.dataModel == 32)?(16):(32)))); }
	public void set_window(long v) { log.finest(""); Native.putLong(pData+((XlibWrapper.dataModel == 32)?(16):(32)), v); }
	public byte get_key_vector(int index) { log.finest("");return Native.getByte(pData + ((XlibWrapper.dataModel == 32)?(20):(40))+index*1); }
	public void set_key_vector(int index, byte v) { log.finest(""); Native.putByte(pData+((XlibWrapper.dataModel == 32)?(20):(40)) + index*1, v); }
	public long get_key_vector() { log.finest("");return pData+((XlibWrapper.dataModel == 32)?(20):(40)); }


	String getName() {
		return "XKeymapEvent"; 
	}


	String getFieldsAsString() {
		String ret="";

		ret += ""+"type = " + XlibWrapper.eventToString[get_type()] +", ";
		ret += ""+"serial = " + get_serial() +", ";
		ret += ""+"send_event = " + get_send_event() +", ";
		ret += ""+"display = " + get_display() +", ";
		ret += ""+"window = " + getWindow(get_window()) + ", ";
		ret += "{" + get_key_vector(0) + " " + get_key_vector(1) + " " + get_key_vector(2) + " " + get_key_vector(3) + " " + get_key_vector(4) + " " + get_key_vector(5) + " " + get_key_vector(6) + " " + get_key_vector(7) + " " + get_key_vector(8) + " " + get_key_vector(9) + " " + get_key_vector(10) + " " + get_key_vector(11) + " " + get_key_vector(12) + " " + get_key_vector(13) + " " + get_key_vector(14) + " " + get_key_vector(15) + " " + get_key_vector(16) + " " + get_key_vector(17) + " " + get_key_vector(18) + " " + get_key_vector(19) + " " + get_key_vector(20) + " " + get_key_vector(21) + " " + get_key_vector(22) + " " + get_key_vector(23) + " " + get_key_vector(24) + " " + get_key_vector(25) + " " + get_key_vector(26) + " " + get_key_vector(27) + " " + get_key_vector(28) + " " + get_key_vector(29) + " " + get_key_vector(30) + " " + get_key_vector(31) + " " + "}";
		return ret;
	}


}



