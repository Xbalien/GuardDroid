package com.guard.app.utils;

import java.util.ArrayList;

import android.widget.ImageView;
import android.widget.TextView;

//将获得程序的信息存储
public class ViewHolder {
	public String packageName;
	public String version;
	public ImageView icon;
	public TextView appLabel;
	public TextView whether;
	public TextView count;	
	public ArrayList<String> riskPerm;
}
