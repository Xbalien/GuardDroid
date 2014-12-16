package com.guard.app.ui;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ListView;


import com.guard.app.R;
import com.guard.app.adapter.SoftwareAdapter;
import com.guard.app.utils.ViewHolder;


public class SoftwareFragment extends Fragment implements 
    OnItemSelectedListener, OnItemClickListener, OnItemLongClickListener {

	private static final String TAG = "SoftwareFragment";
	private List<PackageInfo> packageInfos;
	private ListView softwareListView;
	private SoftwareAdapter softwareAdapter;
	private Activity activity;
	
	
	@Override
	public void onAttach(Activity activity) {
		this.activity = activity;
		super.onAttach(activity);
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,Bundle savedInstanceState) {
		View view = inflater.inflate(R.layout.software_fragment, container, false);
		PackageManager pm = activity.getPackageManager();
		List<PackageInfo> packageInfos = pm.getInstalledPackages(0);
		Iterator<PackageInfo> iter = packageInfos.iterator();
		ApplicationInfo appInfo = null;
		this.packageInfos = new ArrayList<PackageInfo>();
		while (iter.hasNext()) {
			PackageInfo pi = (PackageInfo) iter.next();
			appInfo = pi.applicationInfo;
			//只获取第三方应用
			if((appInfo.flags & ApplicationInfo.FLAG_SYSTEM) <= 0) this.packageInfos.add(pi);
		}			
		softwareListView = (ListView)view.findViewById(R.id.software_list);
		softwareAdapter = new SoftwareAdapter(activity,this.packageInfos);
		softwareListView.setAdapter(softwareAdapter);	
		softwareListView.setOnItemClickListener(this);
		return view;
	}

	@Override
	public boolean onItemLongClick(AdapterView<?> arg0, View arg1, int arg2,
			long arg3) {
		return false;
	}

	@Override
	public void onItemClick(AdapterView<?> parent, View view,
			final int position, long id) {
		Log.d(TAG, "onItemClick");
		ViewHolder holder = (ViewHolder) view.getTag();
 		Intent intent = new Intent();
 		intent.setClass(activity,SetPermissionActivity.class);
 		intent.putExtra("packageName", holder.packageName);
 		intent.putExtra("appLabel", holder.appLabel.getText());
 		intent.putExtra("version", holder.version);
 		intent.putExtra("whether", holder.whether.getText());
 		intent.putStringArrayListExtra("riskPermission", holder.riskPerm);
 		startActivity(intent);	
	}

	@Override
	public void onItemSelected(AdapterView<?> arg0, View arg1, int arg2,
			long arg3) {
	}

	@Override
	public void onNothingSelected(AdapterView<?> arg0) {
		
	}


}
