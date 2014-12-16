package com.guard.app.adapter;

import java.io.ByteArrayInputStream;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.guard.app.R;
import com.guard.app.utils.PolicyMap;
import com.guard.app.utils.ViewHolder;

public class SoftwareAdapter extends BaseAdapter {

	// 存储程序的信息(版本名称和版本号)
	private static final String MY_RSA_KEY = "ae01cc8b034fb8cbf4b66e73edc31e711f121c323dcf5295c09f4362f8fbd2824927976748a5e076b1aaee328634dc4669c2bd2f37bf792e6791c14d0248537119d72291680e8dd3c9823e5cf17a273f9d3110bdf1d0ed8603cd44a665fae38981d3c0d692865303a451117c17ecd3f5fc41563e63b14b5ec71273dc60cd394fbc6b6059735d1f4ea1561fc929f4a70c064cd912a42b4acfd43ad2d562f82a7e2a9ea9f4c1b42c36c60c73df99f123e6ee64d64610d2f89cfca1bf4e7dafb58c855ce7d42ef82ca128458a62ee5d33353479af01fb11cbc65b55235727f358d42b4016840c9e0f96fa1cb4e1cb126499a76b12861fafab29006ce4f354ce9959";
	private List<PackageInfo> pakeageinfos;
	private LayoutInflater inflater;
	private Context context;
	private PackageManager pm;


	public SoftwareAdapter(Context context,List<PackageInfo> pakeageinfos) {
		inflater = LayoutInflater.from(context);
		this.context = context;
		pm = context.getPackageManager();
		this.pakeageinfos = pakeageinfos;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		ViewHolder holder;
		int permCount = 0;
		holder = new ViewHolder();	
		convertView = inflater.inflate(R.layout.software_list_row, null);
		holder.icon = (ImageView) convertView.findViewById(R.id.icon);
		holder.appLabel = (TextView) convertView.findViewById(R.id.app_label);
		holder.whether = (TextView) convertView.findViewById(R.id.whether);
		holder.count= (TextView) convertView.findViewById(R.id.count);
		convertView.setTag(holder);
		try {
			PackageInfo pinfo = pm.getPackageInfo(pakeageinfos.get(position).packageName,PackageManager.GET_SIGNATURES);
			holder.packageName = pinfo.packageName;
			holder.version = pinfo.versionName;
			holder.icon.setImageDrawable(pinfo.applicationInfo.loadIcon(context.getPackageManager()));
			holder.appLabel.setText( pinfo.applicationInfo.loadLabel(context.getPackageManager()));
			String key = getPublicKey(pinfo.signatures[0].toByteArray());
			pinfo = pm.getPackageInfo(pinfo.packageName,PackageManager.GET_PERMISSIONS);
			if(pinfo.requestedPermissions == null) permCount = 0;
			else {
				ArrayList<String> riskPerm = new ArrayList<String>();
				String permission;
				for (int i = 0; i < pinfo.requestedPermissions.length; i ++){
					permission = pinfo.requestedPermissions[i];
					if(PolicyMap.PERMISSION_STATE_MAP.containsKey(permission)){
						riskPerm.add(permission);
						permCount ++;
					}
				}
				holder.riskPerm = riskPerm;
			}
			holder.count.setText(permCount+" 项权限");
			if (key.equals(MY_RSA_KEY)) holder.whether.setText("已处理软件");
			else holder.whether.setText("未处理软件");
		} catch (NameNotFoundException e) {
			e.printStackTrace();
		}
		return convertView;
	}

	private String getPublicKey(byte[] signature) {
		try {
			CertificateFactory certFactory = CertificateFactory
					.getInstance("X.509");
			X509Certificate cert = (X509Certificate) certFactory
					.generateCertificate(new ByteArrayInputStream(signature));
			String publickey = cert.getPublicKey().toString();
			publickey = publickey.substring(publickey.indexOf("modulus: ") + 9,
					publickey.indexOf("\n", publickey.indexOf("modulus:")));		
			return publickey;			
		} catch (CertificateException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public final int getCount() {
		return pakeageinfos.size();
	}

	@Override
	public final Object getItem(int position) {
		return pakeageinfos.get(position);
	}

	@Override
	public final long getItemId(int position) {
		return position;
	}

	

}
