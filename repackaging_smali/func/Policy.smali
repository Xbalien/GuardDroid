.class public Lrepackaging/func/Policy;
.super Ljava/lang/Object;
.source "Policy.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Policy"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkPolicy([Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5
    .parameter "permission"
    .parameter "extras"

    .prologue
    .line 17
    const-string v3, "Policy"

    const-string v4, "checkPolicy"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    const/4 v2, 0x0

    .line 19
    .local v2, result:Ljava/lang/String;
    new-instance v0, Lrepackaging/func/ClientConnect;

    invoke-direct {v0}, Lrepackaging/func/ClientConnect;-><init>()V

    .line 20
    .local v0, client:Lrepackaging/func/ClientConnect;
    invoke-virtual {v0}, Lrepackaging/func/ClientConnect;->connect()V

    .line 21
    new-instance v1, Lrepackaging/func/PolicySet;

    invoke-direct {v1}, Lrepackaging/func/PolicySet;-><init>()V

    .line 22
    .local v1, policySet:Lrepackaging/func/PolicySet;
    invoke-virtual {v1, p0}, Lrepackaging/func/PolicySet;->put([Ljava/lang/String;)V

    .line 23
    invoke-virtual {v1, p1}, Lrepackaging/func/PolicySet;->put([Ljava/lang/String;)V

    .line 24
    iget-object v3, v1, Lrepackaging/func/PolicySet;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v3}, Lrepackaging/func/ClientConnect;->send(Ljava/nio/ByteBuffer;)V

    .line 25
    invoke-virtual {v0}, Lrepackaging/func/ClientConnect;->recv()Ljava/lang/String;

    move-result-object v2

    .line 26
    invoke-virtual {v0}, Lrepackaging/func/ClientConnect;->close()V

    .line 27
    if-nez v2, :cond_0

    const/4 v3, 0x1

    .line 28
    :goto_0
    return v3

    :cond_0
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    goto :goto_0
.end method


# virtual methods
.method public showLog()V
    .locals 0

    .prologue
    .line 33
    return-void
.end method
