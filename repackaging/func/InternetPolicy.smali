.class public Lrepackaging/func/InternetPolicy;
.super Lrepackaging/func/Policy;
.source "InternetPolicy.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "InternetPolicy"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lrepackaging/func/Policy;-><init>()V

    return-void
.end method

.method public static openConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 7
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 13
    const-string v3, "InternetPolicy"

    const-string v4, "try to connect internet"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    new-array v1, v5, [Ljava/lang/String;

    .line 15
    .local v1, toUrl:[Ljava/lang/String;
    const/4 v2, 0x0

    .line 16
    .local v2, urlConnection:Ljava/net/URLConnection;
    invoke-virtual {p0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v6

    .line 17
    new-array v3, v5, [Ljava/lang/String;

    const-string v4, "android.permission.INTERNET"

    aput-object v4, v3, v6

    invoke-static {v3, v1}, Lrepackaging/func/InternetPolicy;->checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 33
    :goto_0
    return-object v2

    .line 19
    :pswitch_0
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    .line 20
    const-string v3, "InternetPolicy"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "allowed to connect "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v5, v1, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 23
    :pswitch_1
    new-instance v0, Ljava/net/URL;

    const-string v3, "https"

    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v3, v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .local v0, httpsUrl:Ljava/net/URL;
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    .line 25
    const-string v3, "InternetPolicy"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "encrpy to connect "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 28
    .end local v0           #httpsUrl:Ljava/net/URL;
    :pswitch_2
    const-string v3, "InternetPolicy"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "forbidden to connect "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v5, v1, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    new-instance v3, Ljava/io/IOException;

    const-string v4, "forbidden to this connection"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 17
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
