.class public Lrepackaging/func/QueryCursor;
.super Landroid/database/CursorWrapper;
.source "QueryCursor.java"


# instance fields
.field private cursor:Landroid/database/Cursor;


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 0
    .parameter "paramCursor"

    .prologue
    .line 18
    invoke-direct {p0, p1}, Landroid/database/CursorWrapper;-><init>(Landroid/database/Cursor;)V

    .line 19
    iput-object p1, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    .line 20
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 25
    return-void
.end method

.method public copyStringToBuffer(ILandroid/database/CharArrayBuffer;)V
    .locals 1
    .parameter "paramInt"
    .parameter "paramCharArrayBuffer"

    .prologue
    .line 29
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1, p2}, Landroid/database/Cursor;->copyStringToBuffer(ILandroid/database/CharArrayBuffer;)V

    .line 30
    return-void
.end method

.method public deactivate()V
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->deactivate()V

    .line 35
    return-void
.end method

.method public getBlob(I)[B
    .locals 1
    .parameter "paramInt"

    .prologue
    .line 39
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    return-object v0
.end method

.method public getColumnCount()I
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getColumnCount()I

    move-result v0

    return v0
.end method

.method public getColumnIndex(Ljava/lang/String;)I
    .locals 1
    .parameter "paramString"

    .prologue
    .line 49
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getColumnIndexOrThrow(Ljava/lang/String;)I
    .locals 1
    .parameter "paramString"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 55
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getColumnName(I)Ljava/lang/String;
    .locals 1
    .parameter "paramInt"

    .prologue
    .line 60
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColumnNames()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 70
    const/4 v0, 0x0

    return v0
.end method

.method public getDouble(I)D
    .locals 2
    .parameter "paramInt"

    .prologue
    .line 75
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public getFloat(I)F
    .locals 1
    .parameter "paramInt"

    .prologue
    .line 85
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v0

    return v0
.end method

.method public getInt(I)I
    .locals 1
    .parameter "paramInt"

    .prologue
    .line 90
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    return v0
.end method

.method public getLong(I)J
    .locals 2
    .parameter "paramInt"

    .prologue
    .line 95
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    return v0
.end method

.method public getShort(I)S
    .locals 1
    .parameter "paramInt"

    .prologue
    .line 105
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getShort(I)S

    move-result v0

    return v0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1
    .parameter "paramInt"

    .prologue
    .line 110
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWantsAllOnMoveCalls()Z
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getWantsAllOnMoveCalls()Z

    move-result v0

    return v0
.end method

.method public isAfterLast()Z
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x1

    return v0
.end method

.method public isBeforeFirst()Z
    .locals 1

    .prologue
    .line 125
    const/4 v0, 0x0

    return v0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    return v0
.end method

.method public isFirst()Z
    .locals 1

    .prologue
    .line 135
    const/4 v0, 0x0

    return v0
.end method

.method public isLast()Z
    .locals 1

    .prologue
    .line 140
    const/4 v0, 0x0

    return v0
.end method

.method public isNull(I)Z
    .locals 1
    .parameter "paramInt"

    .prologue
    .line 145
    const/4 v0, 0x1

    return v0
.end method

.method public move(I)Z
    .locals 1
    .parameter "paramInt"

    .prologue
    .line 150
    const/4 v0, 0x0

    return v0
.end method

.method public moveToFirst()Z
    .locals 1

    .prologue
    .line 155
    const/4 v0, 0x0

    return v0
.end method

.method public moveToLast()Z
    .locals 1

    .prologue
    .line 160
    const/4 v0, 0x0

    return v0
.end method

.method public moveToNext()Z
    .locals 1

    .prologue
    .line 165
    const/4 v0, 0x0

    return v0
.end method

.method public moveToPosition(I)Z
    .locals 1
    .parameter "paramInt"

    .prologue
    .line 170
    const/4 v0, 0x0

    return v0
.end method

.method public moveToPrevious()Z
    .locals 1

    .prologue
    .line 175
    const/4 v0, 0x0

    return v0
.end method

.method public registerContentObserver(Landroid/database/ContentObserver;)V
    .locals 1
    .parameter "paramContentObserver"

    .prologue
    .line 180
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 181
    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1
    .parameter "paramDataSetObserver"

    .prologue
    .line 185
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 186
    return-void
.end method

.method public requery()Z
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z

    move-result v0

    return v0
.end method

.method public respond(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1
    .parameter "paramBundle"

    .prologue
    .line 195
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->respond(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    .locals 1
    .parameter "paramContentResolver"
    .parameter "paramUri"

    .prologue
    .line 200
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1, p2}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 201
    return-void
.end method

.method public unregisterContentObserver(Landroid/database/ContentObserver;)V
    .locals 1
    .parameter "paramContentObserver"

    .prologue
    .line 205
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 206
    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1
    .parameter "paramDataSetObserver"

    .prologue
    .line 210
    iget-object v0, p0, Lrepackaging/func/QueryCursor;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 211
    return-void
.end method
