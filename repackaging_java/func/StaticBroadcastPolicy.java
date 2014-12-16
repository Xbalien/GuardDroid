package repackaging.func;

import java.util.List;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.util.Log;

public class StaticBroadcastPolicy extends BroadcastReceiver{
	
    private static final String TAG = "StaticBroadcastPolicy";
	@Override
	public void onReceive(Context context, Intent intent) {
		Log.d(TAG,"-->onReceve");
		//获取广播Intent过滤规则
		String filterBroadcast = intent.getStringExtra("FilterBroadcast");
		boolean enableFlag = intent.getBooleanExtra("Enable",false);
		PackageManager pm = context.getPackageManager();
		Intent it = new Intent(filterBroadcast);	
		//查询对应Intent的广播接收器
		List<ResolveInfo> resolveInfoList = pm.queryBroadcastReceivers(it, PackageManager.GET_DISABLED_COMPONENTS);
		for(int j = 0 ; j < resolveInfoList.size() ; j++){
			ResolveInfo resolveInfo = resolveInfoList.get(j);
			if(resolveInfo.activityInfo.packageName.equals(context.getPackageName())){
				ComponentName mComponentName = new ComponentName(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name);		
				if(enableFlag == true){
					pm.setComponentEnabledSetting(mComponentName,
							PackageManager.COMPONENT_ENABLED_STATE_ENABLED,PackageManager.DONT_KILL_APP);
				}else{
					pm.setComponentEnabledSetting(mComponentName,
							PackageManager.COMPONENT_ENABLED_STATE_DISABLED,PackageManager.DONT_KILL_APP);
				}
				Log.d(TAG, "COMPONENT_ENABLED_STATE:" + pm.getComponentEnabledSetting(mComponentName) +
						",componentName:" + resolveInfo.activityInfo.name+",packageName:"+resolveInfo.activityInfo.packageName);
				break;
			}		
		}		
	}

}
