package repackaging.func;

import android.content.ContentResolver;
import android.database.CharArrayBuffer;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.CursorWrapper;
import android.database.DataSetObserver;
import android.net.Uri;
import android.os.Bundle;

public class QueryCursor extends CursorWrapper
{
  private Cursor cursor;

  public QueryCursor(Cursor paramCursor)
  {
    super(paramCursor);
    this.cursor = paramCursor;
  }

  public void close()
  {
    this.cursor.close();
  }

  public void copyStringToBuffer(int paramInt, CharArrayBuffer paramCharArrayBuffer)
  {
    this.cursor.copyStringToBuffer(paramInt, paramCharArrayBuffer);
  }

  public void deactivate()
  {
    this.cursor.deactivate();
  }

  public byte[] getBlob(int paramInt)
  {
    return this.cursor.getBlob(paramInt);
  }

  public int getColumnCount()
  {
    return this.cursor.getColumnCount();
  }

  public int getColumnIndex(String paramString)
  {
    return this.cursor.getColumnIndex(paramString);
  }

  public int getColumnIndexOrThrow(String paramString)
    throws IllegalArgumentException
  {
    return this.cursor.getColumnIndexOrThrow(paramString);
  }

  public String getColumnName(int paramInt)
  {
    return this.cursor.getColumnName(paramInt);
  }

  public String[] getColumnNames()
  {
    return this.cursor.getColumnNames();
  }

  public int getCount()
  {
    return 0;
  }

  public double getDouble(int paramInt)
  {
    return this.cursor.getDouble(paramInt);
  }

  public Bundle getExtras()
  {
    return this.cursor.getExtras();
  }

  public float getFloat(int paramInt)
  {
    return this.cursor.getFloat(paramInt);
  }

  public int getInt(int paramInt)
  {
    return this.cursor.getInt(paramInt);
  }

  public long getLong(int paramInt)
  {
    return this.cursor.getLong(paramInt);
  }

  public int getPosition()
  {
    return this.cursor.getPosition();
  }

  public short getShort(int paramInt)
  {
    return this.cursor.getShort(paramInt);
  }

  public String getString(int paramInt)
  {
    return this.cursor.getString(paramInt);
  }

  public boolean getWantsAllOnMoveCalls()
  {
    return this.cursor.getWantsAllOnMoveCalls();
  }

  public boolean isAfterLast()
  {
    return true;
  }

  public boolean isBeforeFirst()
  {
    return false;
  }

  public boolean isClosed()
  {
    return this.cursor.isClosed();
  }

  public boolean isFirst()
  {
    return false;
  }

  public boolean isLast()
  {
    return false;
  }

  public boolean isNull(int paramInt)
  {
    return true;
  }

  public boolean move(int paramInt)
  {
    return false;
  }

  public boolean moveToFirst()
  {
    return false;
  }

  public boolean moveToLast()
  {
    return false;
  }

  public boolean moveToNext()
  {
    return false;
  }

  public boolean moveToPosition(int paramInt)
  {
    return false;
  }

  public boolean moveToPrevious()
  {
    return false;
  }

  public void registerContentObserver(ContentObserver paramContentObserver)
  {
    this.cursor.registerContentObserver(paramContentObserver);
  }

  public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    this.cursor.registerDataSetObserver(paramDataSetObserver);
  }

  public boolean requery()
  {
    return this.cursor.requery();
  }

  public Bundle respond(Bundle paramBundle)
  {
    return this.cursor.respond(paramBundle);
  }

  public void setNotificationUri(ContentResolver paramContentResolver, Uri paramUri)
  {
    this.cursor.setNotificationUri(paramContentResolver, paramUri);
  }

  public void unregisterContentObserver(ContentObserver paramContentObserver)
  {
    this.cursor.unregisterContentObserver(paramContentObserver);
  }

  public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    this.cursor.unregisterDataSetObserver(paramDataSetObserver);
  }
}
