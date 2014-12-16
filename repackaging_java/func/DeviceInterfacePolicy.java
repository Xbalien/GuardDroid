package repackaging.func;

import android.hardware.Camera;
import android.media.MediaRecorder;
import android.util.Log;

public class DeviceInterfacePolicy extends Policy{
	
	private static final String TAG = "DeviceInterfacePolicy";
	
	public static void start(MediaRecorder mediaRecorder) {
		Log.d(TAG,"try to start record");
		if (checkPolicy(new String[]{"android.permission.RECORD_AUDIO"})) {
			Log.i(TAG,"record allowed");
			mediaRecorder.start();
		} else {
			Log.i(TAG,"record forbidden");
		}
	}
	
	public static void stop(MediaRecorder mediaRecorder) {
		Log.d(TAG,"try to stop record");
		if (checkPolicy(new String[]{"android.permission.RECORD_AUDIO"})) {
			mediaRecorder.stop();
		}
	}

	public static Camera open(){
		Log.d(TAG,"try to open camera");
		if (checkPolicy(new String[]{"android.permission.CAMERA"})) {
			Log.i(TAG,"open allowed");
			return Camera.open();
		} else {
			Log.i(TAG,"open forbidden");
			return null;
		}
	}
}
