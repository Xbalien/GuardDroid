package com.guard.app.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

public class LogDBHelper {

	private static final String TBL_NAME = "LogTBL";
	private DBHelper dbHelper;
	private SQLiteDatabase db;
	
	public LogDBHelper(Context context){
		dbHelper = new DBHelper(context);
		db = dbHelper.getWritableDatabase();
	}
	
	public void close(){
		dbHelper.close();
	}
	
	public void insert(ContentValues values) {
		db.insert(TBL_NAME, null, values);
	}
	
	public Cursor query() {
		Cursor c = db.query(TBL_NAME, null, null, null, null, null, null);
		return c;
	}
	
	
}
