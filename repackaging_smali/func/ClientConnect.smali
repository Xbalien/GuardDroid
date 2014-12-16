.class Lrepackaging/func/ClientConnect;
.super Ljava/lang/Object;
.source "Policy.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ClientConnect"

.field private static final name:Ljava/lang/String; = "com.repackaging.localsocket"


# instance fields
.field private Client:Landroid/net/LocalSocket;

.field private is:Ljava/io/BufferedReader;

.field private os:Ljava/io/OutputStream;

.field private timeout:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/16 v0, 0x7530

    iput v0, p0, Lrepackaging/func/ClientConnect;->timeout:I

    .line 37
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 85
    :try_start_0
    iget-object v1, p0, Lrepackaging/func/ClientConnect;->is:Ljava/io/BufferedReader;

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 86
    iget-object v1, p0, Lrepackaging/func/ClientConnect;->os:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 87
    iget-object v1, p0, Lrepackaging/func/ClientConnect;->Client:Landroid/net/LocalSocket;

    invoke-virtual {v1}, Landroid/net/LocalSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    :goto_0
    return-void

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public connect()V
    .locals 4

    .prologue
    .line 49
    :try_start_0
    new-instance v1, Landroid/net/LocalSocket;

    invoke-direct {v1}, Landroid/net/LocalSocket;-><init>()V

    iput-object v1, p0, Lrepackaging/func/ClientConnect;->Client:Landroid/net/LocalSocket;

    .line 50
    iget-object v1, p0, Lrepackaging/func/ClientConnect;->Client:Landroid/net/LocalSocket;

    new-instance v2, Landroid/net/LocalSocketAddress;

    const-string v3, "com.repackaging.localsocket"

    invoke-direct {v2, v3}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V

    .line 51
    iget-object v1, p0, Lrepackaging/func/ClientConnect;->Client:Landroid/net/LocalSocket;

    iget v2, p0, Lrepackaging/func/ClientConnect;->timeout:I

    invoke-virtual {v1, v2}, Landroid/net/LocalSocket;->setSoTimeout(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    :goto_0
    return-void

    .line 52
    :catch_0
    move-exception v0

    .line 53
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public recv()Ljava/lang/String;
    .locals 5

    .prologue
    .line 71
    const-string v2, "ClientConnect"

    const-string v3, "recv"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    const/4 v1, 0x0

    .line 74
    .local v1, result:Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    iget-object v4, p0, Lrepackaging/func/ClientConnect;->Client:Landroid/net/LocalSocket;

    invoke-virtual {v4}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v2, p0, Lrepackaging/func/ClientConnect;->is:Ljava/io/BufferedReader;

    .line 75
    iget-object v2, p0, Lrepackaging/func/ClientConnect;->is:Ljava/io/BufferedReader;

    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 76
    const-string v2, "ClientConnect"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :goto_0
    return-object v1

    .line 77
    :catch_0
    move-exception v0

    .line 78
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public send(Ljava/nio/ByteBuffer;)V
    .locals 5
    .parameter "buffer"

    .prologue
    .line 59
    :try_start_0
    iget-object v3, p0, Lrepackaging/func/ClientConnect;->Client:Landroid/net/LocalSocket;

    invoke-virtual {v3}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    iput-object v3, p0, Lrepackaging/func/ClientConnect;->os:Ljava/io/OutputStream;

    .line 60
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    .line 61
    .local v2, len:I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 62
    .local v0, data:[B
    iget-object v3, p0, Lrepackaging/func/ClientConnect;->os:Ljava/io/OutputStream;

    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 63
    const-string v3, "ClientConnect"

    const-string v4, "send buffer"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .end local v0           #data:[B
    .end local v2           #len:I
    :goto_0
    return-void

    .line 64
    :catch_0
    move-exception v1

    .line 65
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
