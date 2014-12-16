.class public Lrepackaging/func/CostPolicy;
.super Lrepackaging/func/Policy;
.source "CostPolicy.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SmsMessagePolicy"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lrepackaging/func/Policy;-><init>()V

    return-void
.end method

.method public static sendDataMessage(Landroid/telephony/SmsManager;Ljava/lang/String;Ljava/lang/String;S[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    .locals 6
    .parameter "smsManager"
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter "destinationPort"
    .parameter "data"
    .parameter "sentIntent"
    .parameter "deliveryIntent"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 29
    const-string v1, "SmsMessagePolicy"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "try to sendDataMessage to "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/String;

    .line 31
    .local v0, extras:[Ljava/lang/String;
    aput-object p1, v0, v5

    .line 32
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p4}, Ljava/lang/String;-><init>([B)V

    aput-object v1, v0, v4

    .line 33
    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "android.permission.SEND_SMS"

    aput-object v2, v1, v5

    invoke-static {v1, v0}, Lrepackaging/func/CostPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    if-ne v1, v4, :cond_0

    .line 34
    invoke-virtual/range {p0 .. p6}, Landroid/telephony/SmsManager;->sendDataMessage(Ljava/lang/String;Ljava/lang/String;S[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V

    .line 35
    const-string v1, "SmsMessagePolicy"

    const-string v2, "send data sms allowed"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    :goto_0
    return-void

    .line 37
    :cond_0
    const-string v1, "SmsMessagePolicy"

    const-string v2, "send data sms forbidden"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static sendMultipartTextMessage(Landroid/telephony/SmsManager;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 6
    .parameter "smsManager"
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/telephony/SmsManager;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, parts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p5, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 42
    const-string v1, "SmsMessagePolicy"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "try to sendMultipartTextMessage to "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/String;

    .line 44
    .local v0, extras:[Ljava/lang/String;
    aput-object p1, v0, v5

    .line 45
    const-string v1, ""

    aput-object v1, v0, v4

    .line 46
    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "android.permission.SEND_SMS"

    aput-object v2, v1, v5

    invoke-static {v1, v0}, Lrepackaging/func/CostPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    if-ne v1, v4, :cond_0

    .line 47
    invoke-virtual/range {p0 .. p5}, Landroid/telephony/SmsManager;->sendMultipartTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 48
    const-string v1, "SmsMessagePolicy"

    const-string v2, "send multipart text sms allowed"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    :goto_0
    return-void

    .line 50
    :cond_0
    const-string v1, "SmsMessagePolicy"

    const-string v2, "send multipart text sms forbidden"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static sendTextMessage(Landroid/telephony/SmsManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    .locals 6
    .parameter "smsManager"
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter "text"
    .parameter "sentIntent"
    .parameter "deliveryIntent"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 16
    const-string v1, "SmsMessagePolicy"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "try to sendTextMessage to "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/String;

    .line 18
    .local v0, extras:[Ljava/lang/String;
    aput-object p1, v0, v5

    .line 19
    aput-object p3, v0, v4

    .line 20
    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "android.permission.SEND_SMS"

    aput-object v2, v1, v5

    invoke-static {v1, v0}, Lrepackaging/func/CostPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    if-ne v1, v4, :cond_0

    .line 21
    invoke-virtual/range {p0 .. p5}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V

    .line 22
    const-string v1, "SmsMessagePolicy"

    const-string v2, "send text sms allowed"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    :goto_0
    return-void

    .line 24
    :cond_0
    const-string v1, "SmsMessagePolicy"

    const-string v2, "send text sms forbidden"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static startActivity(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 55
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 56
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 69
    :goto_0
    return-void

    .line 59
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.intent.action.CALL"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 60
    invoke-virtual {p1}, Landroid/content/Intent;->toURI()Ljava/lang/String;

    move-result-object v2

    const-string v3, "#"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 61
    .local v0, index:I
    invoke-virtual {p1}, Landroid/content/Intent;->toURI()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 62
    .local v1, number:Ljava/lang/String;
    new-array v2, v4, [Ljava/lang/String;

    const-string v3, "android.permission.CALL_PHONE"

    aput-object v3, v2, v5

    new-array v3, v4, [Ljava/lang/String;

    aput-object v1, v3, v5

    invoke-static {v2, v3}, Lrepackaging/func/CostPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    if-ne v2, v4, :cond_1

    .line 63
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 64
    const-string v2, "SmsMessagePolicy"

    const-string v3, "call allowed"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 66
    :cond_1
    const-string v2, "SmsMessagePolicy"

    const-string v3, "call forbidden"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 68
    .end local v0           #index:I
    .end local v1           #number:Ljava/lang/String;
    :cond_2
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
