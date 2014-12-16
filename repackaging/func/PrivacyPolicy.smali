.class public Lrepackaging/func/PrivacyPolicy;
.super Lrepackaging/func/Policy;
.source "PrivacyPolicy.java"


# static fields
.field private static final CONTACTS_URI_1:Ljava/lang/String; = "content://contacts"

.field private static final CONTACTS_URI_2:Ljava/lang/String; = "content://com.android.contacts"

.field private static final MMS_URI:Ljava/lang/String; = "content://mms"

.field private static final SIM_CONTACTS_URI:Ljava/lang/String; = "content://icc/adn"

.field private static final SMS_URI:Ljava/lang/String; = "content://sms"

.field private static final TAG:Ljava/lang/String; = "ContactsPolicy"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lrepackaging/func/Policy;-><init>()V

    return-void
.end method

.method public static getLastKnownLocation(Landroid/location/LocationManager;Ljava/lang/String;)Landroid/location/Location;
    .locals 8
    .parameter "locationManager"
    .parameter "provider"

    .prologue
    const/4 v3, 0x0

    const/4 v7, 0x1

    .line 101
    const-string v4, "ContactsPolicy"

    const-string v5, "try to getLastKnownLocation"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    const/4 v1, 0x0

    .line 104
    .local v1, location:Landroid/location/Location;
    const/4 v4, 0x2

    :try_start_0
    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "android.permission.ACCESS_FINE_LOCATION"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "android.permission.ACCESS_COARSE_LOCATION"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lrepackaging/func/PrivacyPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    if-ne v4, v7, :cond_0

    .line 105
    invoke-virtual {p0, p1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v1

    .line 106
    const-string v4, "ContactsPolicy"

    const-string v5, "getLastKnownLocation allowed"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    .end local v1           #location:Landroid/location/Location;
    :goto_0
    return-object v1

    .line 109
    .restart local v1       #location:Landroid/location/Location;
    :cond_0
    new-instance v2, Landroid/location/Location;

    invoke-direct {v2, p1}, Landroid/location/Location;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .end local v1           #location:Landroid/location/Location;
    .local v2, location:Landroid/location/Location;
    :try_start_1
    const-string v4, "ContactsPolicy"

    const-string v5, "getLastKnownLocation forbidden"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v2

    .line 111
    goto :goto_0

    .line 113
    .end local v2           #location:Landroid/location/Location;
    .restart local v1       #location:Landroid/location/Location;
    :catch_0
    move-exception v0

    .line 114
    .local v0, e:Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v1, v3

    .line 116
    goto :goto_0

    .line 113
    .end local v0           #e:Ljava/lang/Exception;
    .end local v1           #location:Landroid/location/Location;
    .restart local v2       #location:Landroid/location/Location;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2           #location:Landroid/location/Location;
    .restart local v1       #location:Landroid/location/Location;
    goto :goto_1
.end method

.method public static open()Landroid/hardware/Camera;
    .locals 5

    .prologue
    const/4 v0, 0x0

    const/4 v4, 0x1

    .line 41
    const-string v1, "ContactsPolicy"

    const-string v2, "try to open camera"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    new-array v1, v4, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "android.permission.CAMERA"

    aput-object v3, v1, v2

    invoke-static {v1, v0}, Lrepackaging/func/PrivacyPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    if-ne v1, v4, :cond_0

    .line 43
    const-string v0, "ContactsPolicy"

    const-string v1, "open allowed"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v0

    .line 47
    :goto_0
    return-object v0

    .line 46
    :cond_0
    const-string v1, "ContactsPolicy"

    const-string v2, "open forbidden"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static query(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 8
    .parameter "contentResolver"
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    const/4 v7, 0x1

    .line 52
    const-string v4, "ContactsPolicy"

    const-string v5, "try to query"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    const/4 v0, 0x0

    .line 55
    .local v0, cursor:Landroid/database/Cursor;
    :try_start_0
    invoke-virtual/range {p0 .. p5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 56
    if-nez v0, :cond_0

    move-object v2, v0

    .line 96
    :goto_0
    return-object v2

    .line 59
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    .line 60
    .local v3, uriString:Ljava/lang/String;
    new-instance v2, Lrepackaging/func/QueryCursor;

    invoke-direct {v2, v0}, Lrepackaging/func/QueryCursor;-><init>(Landroid/database/Cursor;)V

    .line 62
    .local v2, queryCursor:Lrepackaging/func/QueryCursor;
    const-string v4, "content://contacts"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "content://com.android.contacts"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 63
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "content://icc/adn"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 64
    :cond_1
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "android.permission.READ_CONTACTS"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lrepackaging/func/PrivacyPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    if-ne v4, v7, :cond_2

    .line 65
    const-string v4, "ContactsPolicy"

    const-string v5, "read contacts allowed"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v0

    .line 66
    goto :goto_0

    .line 68
    :cond_2
    const-string v4, "ContactsPolicy"

    const-string v5, "read contacts forbiddened"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 94
    .end local v2           #queryCursor:Lrepackaging/func/QueryCursor;
    .end local v3           #uriString:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 95
    .local v1, e:Landroid/database/sqlite/SQLiteException;
    const-string v4, "ContactsPolicy"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "SQLiteException in Contacts"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    new-instance v2, Lrepackaging/func/QueryCursor;

    invoke-direct {v2, v0}, Lrepackaging/func/QueryCursor;-><init>(Landroid/database/Cursor;)V

    goto :goto_0

    .line 73
    .end local v1           #e:Landroid/database/sqlite/SQLiteException;
    .restart local v2       #queryCursor:Lrepackaging/func/QueryCursor;
    .restart local v3       #uriString:Ljava/lang/String;
    :cond_3
    :try_start_1
    sget-object v4, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v3}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 74
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "android.permission.READ_CONTACTS"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lrepackaging/func/PrivacyPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    if-ne v4, v7, :cond_4

    .line 75
    const-string v4, "ContactsPolicy"

    const-string v5, "read call log allow"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v0

    .line 76
    goto/16 :goto_0

    .line 78
    :cond_4
    const-string v4, "ContactsPolicy"

    const-string v5, "read call log forbidden"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 83
    :cond_5
    const-string v4, "content://sms"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v4, "content://mms"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 84
    :cond_6
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "android.permission.READ_SMS"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lrepackaging/func/PrivacyPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    if-ne v4, v7, :cond_7

    .line 85
    const-string v4, "ContactsPolicy"

    const-string v5, "read sms allow"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v0

    .line 86
    goto/16 :goto_0

    .line 88
    :cond_7
    const-string v4, "ContactsPolicy"

    const-string v5, "read sms forbidden"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    :cond_8
    move-object v2, v0

    .line 93
    goto/16 :goto_0
.end method

.method public static start(Landroid/media/MediaRecorder;)V
    .locals 4
    .parameter "mediaRecorder"

    .prologue
    const/4 v3, 0x1

    .line 24
    const-string v0, "ContactsPolicy"

    const-string v1, "try to start record"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.RECORD_AUDIO"

    aput-object v2, v0, v1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lrepackaging/func/PrivacyPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-ne v0, v3, :cond_0

    .line 26
    const-string v0, "ContactsPolicy"

    const-string v1, "record allowed"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    invoke-virtual {p0}, Landroid/media/MediaRecorder;->start()V

    .line 31
    :goto_0
    return-void

    .line 29
    :cond_0
    const-string v0, "ContactsPolicy"

    const-string v1, "record forbidden"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static stop(Landroid/media/MediaRecorder;)V
    .locals 4
    .parameter "mediaRecorder"

    .prologue
    const/4 v3, 0x1

    .line 34
    const-string v0, "ContactsPolicy"

    const-string v1, "try to stop record"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.RECORD_AUDIO"

    aput-object v2, v0, v1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lrepackaging/func/PrivacyPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-ne v0, v3, :cond_0

    .line 36
    invoke-virtual {p0}, Landroid/media/MediaRecorder;->stop()V

    .line 38
    :cond_0
    return-void
.end method
