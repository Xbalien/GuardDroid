.class public Lrepackaging/func/DynamicBroadcastPolicy;
.super Lrepackaging/func/Policy;
.source "DynamicBroadcastPolicy.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "DynamicBroadcastPolicy"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lrepackaging/func/Policy;-><init>()V

    return-void
.end method

.method public static registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    .locals 11
    .parameter "context"
    .parameter "receiver"
    .parameter "filter"

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    .local v3, intent:Landroid/content/Intent;
    const/4 v5, 0x0

    .line 17
    .local v5, res:I
    const-string v6, "DynamicBroadcastPolicy"

    const-string v7, "try to registerReceiver"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    invoke-virtual {p2}, Landroid/content/IntentFilter;->countActions()I

    move-result v1

    .line 19
    .local v1, count:I
    new-array v0, v1, [Ljava/lang/String;

    .line 20
    .local v0, action:[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 30
    if-lez v5, :cond_3

    .line 31
    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v3

    .line 32
    const-string v6, "DynamicBroadcastPolicy"

    const-string v7, "registerReceiver allowed"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v3

    .line 36
    .end local v3           #intent:Landroid/content/Intent;
    .local v4, intent:Landroid/content/Intent;
    :goto_1
    return-object v4

    .line 21
    .end local v4           #intent:Landroid/content/Intent;
    .restart local v3       #intent:Landroid/content/Intent;
    :cond_0
    invoke-virtual {p2, v2}, Landroid/content/IntentFilter;->getAction(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v2

    .line 22
    aget-object v6, v0, v2

    const-string v7, "android.intent.action.PHONE_STATE"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 23
    new-array v6, v9, [Ljava/lang/String;

    const-string v7, "android.permission.READ_PHONE_STATE"

    aput-object v7, v6, v8

    invoke-static {v6, v10}, Lrepackaging/func/DynamicBroadcastPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    or-int/2addr v5, v6

    .line 25
    :cond_1
    aget-object v6, v0, v2

    const-string v7, "android.provider.Telephony.SMS_RECEIVED"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 26
    new-array v6, v9, [Ljava/lang/String;

    const-string v7, "android.permission.RECEIVE_SMS"

    aput-object v7, v6, v8

    invoke-static {v6, v10}, Lrepackaging/func/DynamicBroadcastPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    or-int/2addr v5, v6

    .line 28
    :cond_2
    const-string v6, "DynamicBroadcastPolicy"

    aget-object v7, v0, v2

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 35
    :cond_3
    const-string v6, "DynamicBroadcastPolicy"

    const-string v7, "registerReceiver forbidden"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v3

    .line 36
    .end local v3           #intent:Landroid/content/Intent;
    .restart local v4       #intent:Landroid/content/Intent;
    goto :goto_1
.end method

.method public static unregisterReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    .locals 1
    .parameter "context"
    .parameter "receiver"

    .prologue
    .line 42
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :goto_0
    return-void

    .line 43
    :catch_0
    move-exception v0

    .line 44
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
