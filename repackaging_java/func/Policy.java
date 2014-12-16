package repackaging.func;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import android.net.LocalSocket;
import android.net.LocalSocketAddress;
import android.util.Log;

public class Policy {
	
	private static final String TAG = "Policy";
	
	public static boolean checkPolicy(String[] permission){
		Log.d(TAG, "checkPolicy");
		String result = null;
		ClientConnect client = new ClientConnect();
		client.connect();
		client.send(permission);
		result = client.recv();
		client.close();		
		if (result == null) return false;
		if (result.equals("allow")) return true;
		else if (result.equals("forbidden")) return false;
		return false;	
	}
		
	public void showLog(){
		
	}
	
}

class ClientConnect {
	private static final String TAG = "ClientConnect";
	private static final String name = "com.repackaging.localsocket";
	private static final String FLAG = "finish";
	private LocalSocket Client = null;
	private PrintWriter os = null;
	private BufferedReader is = null;
	private int timeout = 30000;
	
	public void connect(){	
		try {
			Client = new LocalSocket();
			Client.connect(new LocalSocketAddress(name));
			Client.setSoTimeout(timeout);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
			
	public void send(String[] data) {
		try {
			os = new PrintWriter(Client.getOutputStream());
			for(int i = 0 ; i < data.length ; i ++){
				os.println(data[i]);
			}
			os.println(FLAG);
			os.flush();
			Log.d(TAG,"send");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String recv() {
		Log.d(TAG,"recv");
		String result = null;
		try {
			is = new BufferedReader(new InputStreamReader(Client.getInputStream()));
			result = is.readLine();
			Log.d(TAG, result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void close() {
		try {
			is.close();
			os.close();
			Client.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
