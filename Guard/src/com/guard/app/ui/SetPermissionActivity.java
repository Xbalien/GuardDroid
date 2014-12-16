package com.guard.app.ui;

import java.util.ArrayList;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.guard.app.R;
import com.guard.app.adapter.PermissionAdapter;

public class SetPermissionActivity extends Activity implements OnItemClickListener{
	
	private PackageManager pm;
	private TextView appLabelTextView;
	private TextView versionTextView;
	private TextView appWhetherTextView;
	private ImageView appIconImageView;
	private ListView permListView;
	private PermissionAdapter permissionAdapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.setpermission_layout);
		Intent intent = getIntent();
		String packageName = intent.getStringExtra("packageName");
		String appLabel = intent.getStringExtra("appLabel");
		String version = intent.getStringExtra("version");
		String whether = intent.getStringExtra("whether");
		ArrayList<String> riskPerm = intent.getStringArrayListExtra("riskPermission");
		System.out.println(packageName + appLabel +version+whether);
		appLabelTextView = (TextView)findViewById(R.id.perm_app_label);
		versionTextView = (TextView)findViewById(R.id.perm_version);
		appWhetherTextView = (TextView)findViewById(R.id.perm_whether);
		appIconImageView = (ImageView)findViewById(R.id.perm_icon);
		permListView = (ListView)findViewById(R.id.perm_list);
		pm = getPackageManager();
		try {
			Drawable icon = pm.getPackageInfo(packageName, 0).applicationInfo.loadIcon(getPackageManager());
			appLabelTextView.setText(appLabel);
			versionTextView.setText("版本："+version);
			appWhetherTextView.setText(whether);
			appIconImageView.setImageDrawable(icon);
		} catch (NameNotFoundException e) {
			e.printStackTrace();
		}
		permissionAdapter = new PermissionAdapter(SetPermissionActivity.this, riskPerm);
		permListView.setAdapter(permissionAdapter);
		permListView.setOnItemClickListener(this);
		//getPermisson(packageName);
	}
	

	void getPermisson(String packageName) {
		try {
			StringBuilder tv = new StringBuilder();
			//PackageInfo pi = pm.getPackageInfo(packageName, 0);
			//String pkgName = pi.packageName;
			//得到权限列表
			PackageInfo pkgInfo = pm.getPackageInfo(packageName,PackageManager.GET_PERMISSIONS);
			String sharedPkgList[] = pkgInfo.requestedPermissions;
			if (sharedPkgList != null) {
				for (int i = 0; i < sharedPkgList.length; i++) {
					String permName = sharedPkgList[i];
					//PermissionInfo tmpPermInfo = pm.getPermissionInfo(permName, 0);//通过permName得到该权限的详细信息
					//PermissionGroupInfo pgi = pm.getPermissionGroupInfo(tmpPermInfo.group, 0);//权限分为不同的群组，通过权限名，我们得到该权限属于什么类型的权限。				
					tv.append(i + "-" + permName + "\n");
					//tv.append(i + "-" + pgi.loadLabel(pm).toString() + "\n");
					//tv.append(i + "-" + tmpPermInfo.loadLabel(pm).toString()+ "\n");
					//tv.append(i + "-" + tmpPermInfo.loadDescription(pm).toString()+ "\n");
				}
				System.out.println(tv.toString());
			}
			
			
		} catch (NameNotFoundException e) {
			e.printStackTrace();
			Log.e("##ddd", "Could'nt retrieve permissions for package");
		}
	}


	@Override
	public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
		// TODO Auto-generated method stub
		
	}

}
