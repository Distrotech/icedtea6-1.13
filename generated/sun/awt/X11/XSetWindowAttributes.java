// This file is an automatically generated file, please do not edit this file, modify the WrapperGenerator.java file instead !

package sun.awt.X11;

import sun.misc.*;

import java.util.logging.*;
public class XSetWindowAttributes extends XWrapperBase { 
	private Unsafe unsafe = XlibWrapper.unsafe; 
	private final boolean should_free_memory;
	public static int getSize() { return ((XlibWrapper.dataModel == 32)?(60):(112)); }
	public int getDataSize() { return getSize(); }

	long pData;

	public long getPData() { return pData; }


	public XSetWindowAttributes(long addr) {
		log.finest("Creating");
		pData=addr;
		should_free_memory = false;
	}


	public XSetWindowAttributes() {
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
	public long get_background_pixmap() { log.finest("");return (Native.getLong(pData+0)); }
	public void set_background_pixmap(long v) { log.finest(""); Native.putLong(pData+0, v); }
	public long get_background_pixel() { log.finest("");return (Native.getLong(pData+((XlibWrapper.dataModel == 32)?(4):(8)))); }
	public void set_background_pixel(long v) { log.finest(""); Native.putLong(pData+((XlibWrapper.dataModel == 32)?(4):(8)), v); }
	public long get_border_pixmap() { log.finest("");return (Native.getLong(pData+((XlibWrapper.dataModel == 32)?(8):(16)))); }
	public void set_border_pixmap(long v) { log.finest(""); Native.putLong(pData+((XlibWrapper.dataModel == 32)?(8):(16)), v); }
	public long get_border_pixel() { log.finest("");return (Native.getLong(pData+((XlibWrapper.dataModel == 32)?(12):(24)))); }
	public void set_border_pixel(long v) { log.finest(""); Native.putLong(pData+((XlibWrapper.dataModel == 32)?(12):(24)), v); }
	public int get_bit_gravity() { log.finest("");return (Native.getInt(pData+((XlibWrapper.dataModel == 32)?(16):(32)))); }
	public void set_bit_gravity(int v) { log.finest(""); Native.putInt(pData+((XlibWrapper.dataModel == 32)?(16):(32)), v); }
	public int get_win_gravity() { log.finest("");return (Native.getInt(pData+((XlibWrapper.dataModel == 32)?(20):(36)))); }
	public void set_win_gravity(int v) { log.finest(""); Native.putInt(pData+((XlibWrapper.dataModel == 32)?(20):(36)), v); }
	public int get_backing_store() { log.finest("");return (Native.getInt(pData+((XlibWrapper.dataModel == 32)?(24):(40)))); }
	public void set_backing_store(int v) { log.finest(""); Native.putInt(pData+((XlibWrapper.dataModel == 32)?(24):(40)), v); }
	public long get_backing_planes() { log.finest("");return (Native.getLong(pData+((XlibWrapper.dataModel == 32)?(28):(48)))); }
	public void set_backing_planes(long v) { log.finest(""); Native.putLong(pData+((XlibWrapper.dataModel == 32)?(28):(48)), v); }
	public long get_backing_pixel() { log.finest("");return (Native.getLong(pData+((XlibWrapper.dataModel == 32)?(32):(56)))); }
	public void set_backing_pixel(long v) { log.finest(""); Native.putLong(pData+((XlibWrapper.dataModel == 32)?(32):(56)), v); }
	public boolean get_save_under() { log.finest("");return (Native.getBool(pData+((XlibWrapper.dataModel == 32)?(36):(64)))); }
	public void set_save_under(boolean v) { log.finest(""); Native.putBool(pData+((XlibWrapper.dataModel == 32)?(36):(64)), v); }
	public long get_event_mask() { log.finest("");return (Native.getLong(pData+((XlibWrapper.dataModel == 32)?(40):(72)))); }
	public void set_event_mask(long v) { log.finest(""); Native.putLong(pData+((XlibWrapper.dataModel == 32)?(40):(72)), v); }
	public long get_do_not_propagate_mask() { log.finest("");return (Native.getLong(pData+((XlibWrapper.dataModel == 32)?(44):(80)))); }
	public void set_do_not_propagate_mask(long v) { log.finest(""); Native.putLong(pData+((XlibWrapper.dataModel == 32)?(44):(80)), v); }
	public boolean get_override_redirect() { log.finest("");return (Native.getBool(pData+((XlibWrapper.dataModel == 32)?(48):(88)))); }
	public void set_override_redirect(boolean v) { log.finest(""); Native.putBool(pData+((XlibWrapper.dataModel == 32)?(48):(88)), v); }
	public long get_colormap() { log.finest("");return (Native.getLong(pData+((XlibWrapper.dataModel == 32)?(52):(96)))); }
	public void set_colormap(long v) { log.finest(""); Native.putLong(pData+((XlibWrapper.dataModel == 32)?(52):(96)), v); }
	public long get_cursor() { log.finest("");return (Native.getLong(pData+((XlibWrapper.dataModel == 32)?(56):(104)))); }
	public void set_cursor(long v) { log.finest(""); Native.putLong(pData+((XlibWrapper.dataModel == 32)?(56):(104)), v); }


	String getName() {
		return "XSetWindowAttributes"; 
	}


	String getFieldsAsString() {
		String ret="";

		ret += ""+"background_pixmap = " + get_background_pixmap() +", ";
		ret += ""+"background_pixel = " + get_background_pixel() +", ";
		ret += ""+"border_pixmap = " + get_border_pixmap() +", ";
		ret += ""+"border_pixel = " + get_border_pixel() +", ";
		ret += ""+"bit_gravity = " + get_bit_gravity() +", ";
		ret += ""+"win_gravity = " + get_win_gravity() +", ";
		ret += ""+"backing_store = " + get_backing_store() +", ";
		ret += ""+"backing_planes = " + get_backing_planes() +", ";
		ret += ""+"backing_pixel = " + get_backing_pixel() +", ";
		ret += ""+"save_under = " + get_save_under() +", ";
		ret += ""+"event_mask = " + get_event_mask() +", ";
		ret += ""+"do_not_propagate_mask = " + get_do_not_propagate_mask() +", ";
		ret += ""+"override_redirect = " + get_override_redirect() +", ";
		ret += ""+"colormap = " + get_colormap() +", ";
		ret += ""+"cursor = " + get_cursor() +", ";
		return ret;
	}


}



