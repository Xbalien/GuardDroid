package repackaging.func;


import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.util.Log;

public class DynamicBroadcastPolicy extends Policy{
	
	private static final String TAG = "DynamicBroadcastPolicy";
	
	public static Intent registerReceiver(Context context, BroadcastReceiver receiver, IntentFilter filter) {
		Intent intent = null;
		Log.d(TAG,"try to registerReceiver");
		int count = filter.countActions();
		String[] action = new String[count];
		for(int i = 0 ; i < count ; i++ ){
			action[i] = filter.getAction(i);
			Log.d(TAG,action[i]);
		}
		if(checkPolicy(action)){
			intent = context.registerReceiver(receiver, filter);
			Log.d(TAG,"registerReceiver succeed");
			return intent;
		} else return intent;
	}
	
	public static void unregisterReceiver(Context context, BroadcastReceiver receiver){
		try {
			context.unregisterReceiver(receiver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
