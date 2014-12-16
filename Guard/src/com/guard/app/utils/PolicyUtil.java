package com.guard.app.utils;

import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;

/* -1 StringÎª¿Õ£» x String³¤¶È */
public class PolicyUtil{
	
	public ByteBuffer buffer = ByteBuffer.allocate(2048);
			
	public void put(int paramInt) {
		buffer.putInt(paramInt);
	}
	
	public void put(String paramString) {
		if (paramString != null) {
			try {
				byte[] arrayOfByte = paramString.getBytes("utf-8");
				buffer.putInt(arrayOfByte.length);
				buffer.put(arrayOfByte);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else buffer.putInt(-1);
	}
	
	public void put(String[] paramStringArray) {
		if (paramStringArray != null) {
			int len = paramStringArray.length;
			buffer.putInt(len);
			for (int i = 0; i < paramStringArray.length; i++) {
				put(paramStringArray[i]);
			}
		} else buffer.putInt(-1);
	}

	public String getString() {
		int i = buffer.getInt();
		String string = null;
		if (i == -1) return string;
		byte[] arrayOfByte = new byte[i];
		buffer.get(arrayOfByte);
		try {
			string = new String(arrayOfByte, "utf-8");
			return string;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return string;		
	}

	public String[] getStringArray() {
		int i = buffer.getInt();
		String[] arrayOfString = null;
		if (i == -1) return arrayOfString;
		arrayOfString = new String[i];
        for (int j = 0; j < i; j++)
          arrayOfString[j] = getString();
        return arrayOfString;
	}
}
