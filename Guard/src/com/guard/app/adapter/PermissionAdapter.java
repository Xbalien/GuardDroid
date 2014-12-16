package com.guard.app.adapter;

import java.util.ArrayList;

import com.guard.app.R;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageButton;
import android.widget.TextView;

public class PermissionAdapter extends BaseAdapter{
	
	private static final String TAG = "PermissionAdapter";
	private ArrayList<String> permList;
	private LayoutInflater inflater;
	private Context context;
	
	public PermissionAdapter(Context context, ArrayList<String> permList){
		inflater = LayoutInflater.from(context);
		this.context = context;
		this.permList = permList;
	}

	@Override
	public int getCount() {
		Log.d(TAG,"getCount "+permList.size());
		return permList.size();
	}

	@Override
	public Object getItem(int position) {
		return null;
	}

	@Override
	public long getItemId(int position) {
		return 0;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		ViewHolder holder = new ViewHolder();
		convertView = inflater.inflate(R.layout.permission_list_item, null);
		holder.permName = (TextView) convertView.findViewById(R.id.perm_name);
		holder.permSwitch = (ImageButton) convertView.findViewById(R.id.perm_switch);
		convertView.setTag(holder);
		return convertView;
	}
	
	class ViewHolder{
		TextView permName;
		ImageButton permSwitch;
	}

}
