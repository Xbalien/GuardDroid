package com.guard.app.ui;


import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.PermissionGroupInfo;
import android.content.pm.PermissionInfo;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.guard.app.R;
import com.guard.app.db.DBHelper;
import com.guard.app.service.CoreListenService;

public class TestActivity extends Activity{

	private Button serButton; 
	private Button stopButton;
	private Button dbButton;
	private Button exitButton;
	private Button perButton;
	private EditText resEditText;
	private TextView textView;
	private static final String TAG = "TestActivity";
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.test_layout);
		serButton = (Button)findViewById(R.id.server_socket);
		stopButton = (Button)findViewById(R.id.stop_service);
		dbButton = (Button)findViewById(R.id.create_db);
		exitButton = (Button)findViewById(R.id.exit);
		resEditText = (EditText)findViewById(R.id.edit_text);
		perButton = (Button)findViewById(R.id.permission);
		textView = (TextView)findViewById(R.id.t);
		serButton.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				String result = resEditText.getText().toString();
				Intent intent = new Intent();
				intent.setClass(TestActivity.this, CoreListenService.class);
				intent.putExtra("result", result);
				startService(intent);
			}
		});
		
		stopButton.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent intent = new Intent();
				intent.setClass(TestActivity.this, CoreListenService.class);
				stopService(intent);
			}
		});
		
		dbButton.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Log.d(TAG, "dbButton onClick");
				DBHelper guardDBHelper = new DBHelper(getApplicationContext());
			}
		});
		
		exitButton.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				android.os.Process.killProcess(android.os.Process.myPid());
			}
		});
		
		perButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				try {
					StringBuilder tv = new StringBuilder();
					PackageManager pm = getPackageManager();
					PackageInfo pi = pm.getPackageInfo("com.lyx.my_trojan", 0);
					String pkgName = pi.packageName;
					//得到权限列表
					PackageInfo pkgInfo = pm.getPackageInfo(pkgName,PackageManager.GET_PERMISSIONS);
					String sharedPkgList[] = pkgInfo.requestedPermissions;

					for (int i = 0; i < sharedPkgList.length; i++) {
						String permName = sharedPkgList[i];

						PermissionInfo tmpPermInfo = pm.getPermissionInfo(permName, 0);//通过permName得到该权限的详细信息
						PermissionGroupInfo pgi = pm.getPermissionGroupInfo(
								tmpPermInfo.group, 0);//权限分为不同的群组，通过权限名，我们得到该权限属于什么类型的权限。
						
						tv.append(i + "-" + permName + "\n");
						tv.append(i + "-" + pgi.loadLabel(pm).toString() + "\n");
						tv.append(i + "-" + tmpPermInfo.loadLabel(pm).toString()+ "\n");
						tv.append(i + "-" + tmpPermInfo.loadDescription(pm).toString()+ "\n");

					}
					Log.d(TAG, tv.toString());
					
				} catch (NameNotFoundException e) {
					Log.e("##ddd", "Could'nt retrieve permissions for package");

				}
			}
		});
	}
	
	void getPermisson(Context context) {
		try {
			StringBuilder tv = new StringBuilder();
			PackageManager pm = context.getPackageManager();
			PackageInfo pi = pm.getPackageInfo("com.lyx.my_trojan", 0);
			String pkgName = pi.packageName;
			//得到权限列表
			PackageInfo pkgInfo = pm.getPackageInfo(pkgName,PackageManager.GET_PERMISSIONS);
			String sharedPkgList[] = pkgInfo.requestedPermissions;

			for (int i = 0; i < sharedPkgList.length; i++) {
				String permName = sharedPkgList[i];

				PermissionInfo tmpPermInfo = pm.getPermissionInfo(permName, 0);//通过permName得到该权限的详细信息
				PermissionGroupInfo pgi = pm.getPermissionGroupInfo(
						tmpPermInfo.group, 0);//权限分为不同的群组，通过权限名，我们得到该权限属于什么类型的权限。
				
				tv.append(i + "-" + permName + "\n");
				tv.append(i + "-" + pgi.loadLabel(pm).toString() + "\n");
				tv.append(i + "-" + tmpPermInfo.loadLabel(pm).toString()+ "\n");
				tv.append(i + "-" + tmpPermInfo.loadDescription(pm).toString()+ "\n");

			}
			textView.setText(tv.toString());
			
		} catch (NameNotFoundException e) {
			Log.e("##ddd", "Could'nt retrieve permissions for package");

		}
	}

}
