package com.guard.app.db;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

public class DBHelper extends SQLiteOpenHelper{

	private static final String TAG = "DBHelper";
	private static final String DB_NAME = "Guard.db";

	public DBHelper(Context context) {
		super(context, DB_NAME, null, 1);
	}
	
	@Override
	public void onOpen(SQLiteDatabase db) {
		super.onOpen(db);
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		Log.d(TAG, "onCreate");
		createLogTable(db);
		createPermissionTable(db);
	}
	
	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		
	}
	
	private void createLogTable(SQLiteDatabase db) {
		Log.d(TAG, "createLogTable");
		StringBuilder sb = new StringBuilder();
		sb.append("CREATE TABLE LogTBL (");
		sb.append("_id INTEGER PRIMARY KEY,");
		sb.append("Pkg TEXT,");
		sb.append("Title TEXT,");
		sb.append("Content TEXT,");
		sb.append("Time TEXT,");
		sb.append("Action INTEGER )");
		db.execSQL(sb.toString());
		}
	
	private void createPermissionTable(SQLiteDatabase db){
		Log.d(TAG, "createPermissionTable");
		StringBuilder sb = new StringBuilder();
		sb.append("CREATE TABLE PermissionTBL (");
		sb.append("_id INTEGER PRIMARY KEY,");
		sb.append("Pkg TEXT,");
		sb.append("Permission TEXT,");
		sb.append("PermissionState INTERGER )");
		db.execSQL(sb.toString());
		}
	
}
