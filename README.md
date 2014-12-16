GuardDroid
==========
将需要监控保护的app进行smali插桩重打包，对其中配置的关键api进行监控，控制app敏感行为

大体分为三部分
1.加固代码
需要监控的关键API以及信息，主要根据解析权限后匹配表(略为简单的demo，大家可以深究)
2.服务端重打包
使用python。就完成以上关键匹配后修改dalvik字节码，加入加固代码以及重新打包
3.手机管理端
负责权限控制、加固进程通信，主要使用localsocket，以及sqllite3操作等

repackaging_java目录为插桩源代码，将其转换为smali后可通过main.py将其插入到待打包app中

详细细节参考项目文档 https://github.com/Xbalien/GuardDroid/blob/master/%E4%BD%9C%E5%93%81%E6%8A%A5%E5%91%8A-%E5%9F%BA%E4%BA%8EAndroid%E9%87%8D%E6%89%93%E5%8C%85%E7%9A%84%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E5%AE%89%E5%85%A8%E7%AD%96%E7%95%A5%E5%8A%A0%E5%9B%BA%E7%B3%BB%E7%BB%9F.pdf
