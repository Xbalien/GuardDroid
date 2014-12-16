package com.guard.app.db;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

public class PermissionDBHelper {

	private static final String TBL_NAME = "PermissionTBL";
	private static final String COLUMNS[] = new String[]{"Pkg","Permission","PermissionState"};
	private DBHelper dbHelper;
	private SQLiteDatabase db;
	
	public PermissionDBHelper(Context context){
		dbHelper = new DBHelper(context);
		db = dbHelper.getWritableDatabase();
	}
	
	public void Close(){
		dbHelper.close();
	}
	
	public Cursor query() {
		Cursor cursor = db.query(TBL_NAME, COLUMNS, null, null, null, null, null);
		return cursor;	
	}
}
