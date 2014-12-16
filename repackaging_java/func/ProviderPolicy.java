package repackaging.func;

import android.content.ContentResolver;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.location.Location;
import android.location.LocationManager;
import android.net.Uri;
import android.provider.CallLog;
import android.util.Log;

public class ProviderPolicy extends Policy{
	
	private static final String TAG = "ContactsPolicy";
	private static final String CONTACTS_URI_1 = "content://contacts";
	private static final String CONTACTS_URI_2 = "content://com.android.contacts";
	private static final String SIM_CONTACTS_URI = "content://icc/adn";
	private static final String SMS_URI = "content://sms";
	private static final String MMS_URI = "content://mms";
	
	public static Cursor query(ContentResolver contentResolver, Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
		Log.d(TAG,"try to query");
		Cursor cursor = null;
		try {
			cursor = contentResolver.query(uri, projection, selection, selectionArgs, sortOrder);
			if (cursor == null) {
				return cursor;
			}
			String uriString = uri.toString();
			QueryCursor queryCursor = new QueryCursor(cursor);
			//对Contacts的查询操作
			if (uriString.startsWith(CONTACTS_URI_1) || uriString.startsWith(CONTACTS_URI_2)
					|| uri.toString().startsWith(SIM_CONTACTS_URI)) {
				if (checkPolicy(new String[]{"android.permission.READ_CONTACTS"})) {
					Log.d(TAG,"read contacts allowed");
					return cursor;
				} else {
					Log.d(TAG,"read contacts forbiddened");
					return queryCursor;
				}
			}
			//对通话记录的查询操作
			if (CallLog.Calls.CONTENT_URI.equals(uriString)) {
				if (checkPolicy(new String[]{"android.permission.READ_CONTACTS"})) {
					Log.d(TAG,"read call log allow");
					return cursor;
				} else {
					Log.d(TAG,"read call log forbidden");
					return queryCursor;
				}
			}		
			//对Sms的查询操作
			if (uriString.startsWith(SMS_URI) || uriString.startsWith(MMS_URI)) {
				if (checkPolicy(new String[]{"android.permission.READ_SMS"})) {
					Log.d(TAG,"read sms allow");
					return cursor;
				} else {
					Log.d(TAG,"read sms forbidden");
					return queryCursor;
				}
			}
			//不是以上查询操作
			return cursor;
		} catch (SQLiteException e) {
			Log.d(TAG,"SQLiteException in Contacts" + e.getMessage());
			return new QueryCursor(cursor);
		}
	}
	
	public static Location getLastKnownLocation(LocationManager locationManager, String provider){
		Log.d(TAG,"try to getLastKnownLocation");
		try {
			Location location = null;
			if (checkPolicy(new String[]{"android.permission.ACCESS_FINE_LOCATION","android.permission.ACCESS_COARSE_LOCATION"})) {
				location = locationManager.getLastKnownLocation(provider);
				Log.d(TAG,"getLastKnownLocation allowed");
				return location;
			} else {
				location = new Location(provider);
				Log.d(TAG,"getLastKnownLocation forbidden");
				return location;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}

}
