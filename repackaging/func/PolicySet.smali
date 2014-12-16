.class public Lrepackaging/func/PolicySet;
.super Ljava/lang/Object;
.source "PolicySet.java"


# instance fields
.field buffer:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    const/16 v0, 0x800

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lrepackaging/func/PolicySet;->buffer:Ljava/nio/ByteBuffer;

    .line 7
    return-void
.end method


# virtual methods
.method public getString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 38
    iget-object v5, p0, Lrepackaging/func/PolicySet;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 39
    .local v2, i:I
    const/4 v3, 0x0

    .line 40
    .local v3, string:Ljava/lang/String;
    const/4 v5, -0x1

    if-ne v2, v5, :cond_0

    move-object v4, v3

    .line 49
    .end local v3           #string:Ljava/lang/String;
    :goto_0
    return-object v4

    .line 41
    .restart local v3       #string:Ljava/lang/String;
    :cond_0
    new-array v0, v2, [B

    .line 42
    .local v0, arrayOfByte:[B
    iget-object v5, p0, Lrepackaging/func/PolicySet;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 44
    :try_start_0
    new-instance v4, Ljava/lang/String;

    const-string v5, "utf-8"

    invoke-direct {v4, v0, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3           #string:Ljava/lang/String;
    .local v4, string:Ljava/lang/String;
    move-object v3, v4

    .line 45
    .end local v4           #string:Ljava/lang/String;
    .restart local v3       #string:Ljava/lang/String;
    goto :goto_0

    .line 46
    :catch_0
    move-exception v1

    .line 47
    .local v1, e:Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    move-object v4, v3

    .line 49
    .end local v3           #string:Ljava/lang/String;
    .restart local v4       #string:Ljava/lang/String;
    goto :goto_0
.end method

.method public getStringArray()[Ljava/lang/String;
    .locals 5

    .prologue
    .line 53
    iget-object v4, p0, Lrepackaging/func/PolicySet;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 54
    .local v2, i:I
    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/String;

    .line 55
    .local v0, arrayOfString:[Ljava/lang/String;
    const/4 v4, -0x1

    if-ne v2, v4, :cond_0

    move-object v1, v0

    .line 59
    .end local v0           #arrayOfString:[Ljava/lang/String;
    .local v1, arrayOfString:[Ljava/lang/String;
    :goto_0
    return-object v1

    .line 56
    .end local v1           #arrayOfString:[Ljava/lang/String;
    .restart local v0       #arrayOfString:[Ljava/lang/String;
    :cond_0
    new-array v0, v2, [Ljava/lang/String;

    .line 57
    const/4 v3, 0x0

    .local v3, j:I
    :goto_1
    if-lt v3, v2, :cond_1

    move-object v1, v0

    .line 59
    .end local v0           #arrayOfString:[Ljava/lang/String;
    .restart local v1       #arrayOfString:[Ljava/lang/String;
    goto :goto_0

    .line 58
    .end local v1           #arrayOfString:[Ljava/lang/String;
    .restart local v0       #arrayOfString:[Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Lrepackaging/func/PolicySet;->getString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v3

    .line 57
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method public put(I)V
    .locals 1
    .parameter "paramInt"

    .prologue
    .line 12
    iget-object v0, p0, Lrepackaging/func/PolicySet;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 13
    return-void
.end method

.method public put(Ljava/lang/String;)V
    .locals 4
    .parameter "paramString"

    .prologue
    .line 16
    if-eqz p1, :cond_0

    .line 18
    :try_start_0
    const-string v2, "utf-8"

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 19
    .local v0, arrayOfByte:[B
    iget-object v2, p0, Lrepackaging/func/PolicySet;->buffer:Ljava/nio/ByteBuffer;

    array-length v3, v0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 20
    iget-object v2, p0, Lrepackaging/func/PolicySet;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .end local v0           #arrayOfByte:[B
    :goto_0
    return-void

    .line 21
    :catch_0
    move-exception v1

    .line 22
    .local v1, e:Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0

    .line 24
    .end local v1           #e:Ljava/io/UnsupportedEncodingException;
    :cond_0
    iget-object v2, p0, Lrepackaging/func/PolicySet;->buffer:Ljava/nio/ByteBuffer;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    goto :goto_0
.end method

.method public put([Ljava/lang/String;)V
    .locals 4
    .parameter "paramStringArray"

    .prologue
    .line 28
    if-eqz p1, :cond_1

    .line 29
    array-length v1, p1

    .line 30
    .local v1, len:I
    iget-object v2, p0, Lrepackaging/func/PolicySet;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 31
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, p1

    if-lt v0, v2, :cond_0

    .line 35
    .end local v0           #i:I
    .end local v1           #len:I
    :goto_1
    return-void

    .line 32
    .restart local v0       #i:I
    .restart local v1       #len:I
    :cond_0
    aget-object v2, p1, v0

    invoke-virtual {p0, v2}, Lrepackaging/func/PolicySet;->put(Ljava/lang/String;)V

    .line 31
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 34
    .end local v0           #i:I
    .end local v1           #len:I
    :cond_1
    iget-object v2, p0, Lrepackaging/func/PolicySet;->buffer:Ljava/nio/ByteBuffer;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    goto :goto_1
.end method
