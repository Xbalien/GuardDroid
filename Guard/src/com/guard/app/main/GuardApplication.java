package com.guard.app.main;

import java.util.HashMap;
import com.guard.app.db.PermissionDBHelper;
import com.guard.app.utils.PolicyMap;
import com.guard.app.utils.PolicyResult;
import android.app.Application;
import android.database.Cursor;
import android.util.Log;
import android.widget.ImageView;
import android.widget.TextView;

public class GuardApplication extends Application{

	private static final String TAG = "GuardApplication";
	public static HashMap<String, Integer> policyMap = new HashMap<String, Integer>();
	
	@Override
	public void onCreate() {
		Log.d(TAG, "onCreate");
		policyInit();
		super.onCreate();
	}

	@Override
	public void onTerminate() {
		Log.d(TAG, "onTerminate");
		super.onTerminate();
	}

	//读取数据库，将策略装入内存Map
	private void policyInit(){	
		PermissionDBHelper permissionDBHelper = new PermissionDBHelper(GuardApplication.this);
		Cursor cursor = permissionDBHelper.query();
		if (cursor.moveToFirst()) {
			String packageName,permission;
			long permissionState;
			int pkgColumnIndex = cursor.getColumnIndex("Pkg");
			int permissionColumnIndex = cursor.getColumnIndex("Permission");
			int permissionStateColumnIndex = cursor.getColumnIndex("PermissionState");
			do {
				packageName = cursor.getString(pkgColumnIndex);
				permission = cursor.getString(permissionColumnIndex);
				permissionState = cursor.getLong(permissionStateColumnIndex);
				//第一次初始化
				if (policyMap.get(packageName) == null) policyMap.put(packageName, Integer.valueOf(0));
				if (permissionState == PolicyResult.ALLOWED) {
					policyMap.put(packageName, policyMap.get(packageName)|PolicyMap.PERMISSION_STATE_MAP.get(permission));
				} else if (permissionState == PolicyResult.ASK) {
				policyMap.put(packageName, policyMap.get(packageName)|PolicyMap.PERMISSION_STATE_MAP.get(permission)
							|(PolicyMap.PERMISSION_STATE_MAP.get(permission) << 32));
				}
			} while (cursor.moveToNext());
		}else {
				Log.d(TAG,"No Date");
		}
		cursor.close();
		permissionDBHelper.Close();	
	}
}
