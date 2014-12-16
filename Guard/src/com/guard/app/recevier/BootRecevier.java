package com.guard.app.recevier;

import com.guard.app.service.CoreListenService;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public  class BootRecevier extends BroadcastReceiver{

	private static final String TAG = "BootRecevier";
	
	@Override
	public void onReceive(Context context, Intent intent) {
		Log.d(TAG, "onRecevice");
		Intent startIntent = new Intent(context,CoreListenService.class);
		context.startService(startIntent);
	}

}
