import os
import sys
import repackaging

  
key_priv1 = 'Landroid/content/ContentResolver;->query('
key_priv2 = 'Landroid/media/MediaRecorder;->start('
key_priv3 = 'Landroid/media/MediaRecorder;->stop('
key_priv4 = 'Landroid/location/LocationManager;->getLastKnownLocation('
key_priv5 = 'Landroid/hardware/Camera;->open('
key_cost1 = ';->startActivity('
#key_cost1 = 'Landroid/content/Context;->startActivity('
key_cost2 = 'Landroid/telephony/SmsManager;->sendDataMessage('
key_cost3 = 'Landroid/telephony/SmsManager;->sendTextMessage('
key_cost4 = 'Landroid/telephony/SmsManager;->sendMultipartTextMessage('
#key_dbroad1 = 'Landroid/content/Context;->registerReceiver('
key_dbroad1 = ';->registerReceiver('
key_dbroad2 = ';->unregisterReceiver('
#key_dbroad2 = 'Landroid/content/Context;->unregisterReceiver('
key_inter1 = 'Ljava/net/URL;->openConnection('
value_priv = 'Lrepackaging/func/PrivacyPolicy;'
value_cost = 'Lrepackaging/func/CostPolicy;'
value_dbroad = 'Lrepackaging/func/DynamicBroadcastPolicy;'
value_inter = 'Lrepackaging/func/InternetPolicy;'


smalimap={}
smalimap[key_priv1] = value_priv
smalimap[key_priv2] = value_priv
smalimap[key_priv3] = value_priv
smalimap[key_priv4] = value_priv
smalimap[key_priv5] = value_priv
smalimap[key_cost1] = value_cost
smalimap[key_cost2] = value_cost
smalimap[key_cost3] = value_cost
smalimap[key_cost4] = value_cost
smalimap[key_dbroad1] = value_dbroad
smalimap[key_dbroad2] = value_dbroad
smalimap[key_inter1] = value_inter

analyzemap = {}
key_readsms = 'android.permission.READ_SMS'
key_sendsms = 'android.permission.SEND_SMS'
key_receive = 'android.permission.RECEIVE_SMS'
key_callph = 'android.permission.CALL_PHONE'
key_readstate = 'android.permission.READ_PHONE_STATE'
key_readcontact = 'android.permission.READ_CONTACTS'
key_internet = 'android.permission.INTERNET'
key_recordau = 'android.permission.RECORD_AUDIO'
key_accessloc = 'android.permission.ACCESS_FINE_LOCATION'
key_camera = 'android.permission.CAMERA'
analyzemap[key_readsms] = {'Landroid/content/ContentResolver;->query('}
analyzemap[key_sendsms] = {'Landroid/telephony/SmsManager;->sendDataMessage(','Landroid/telephony/SmsManager;->sendTextMessage(','Landroid/telephony/SmsManager;->sendMultipartTextMessage('}
analyzemap[key_receive] = {';->registerReceiver(',';->unregisterReceiver('}
analyzemap[key_callph] = {';->startActivity('}
analyzemap[key_readstate] = {'Landroid/content/Context;->registerReceiver(','Landroid/content/Context;->unregisterReceiver('}
analyzemap[key_readcontact] = {'Landroid/content/ContentResolver;->query('}
analyzemap[key_internet] = {'Ljava/net/URL;->openConnection('}
analyzemap[key_recordau] = {'Landroid/media/MediaRecorder;->start(','Landroid/media/MediaRecorder;->stop('}
analyzemap[key_accessloc] = {'Landroid/location/LocationManager;->getLastKnownLocation('}
analyzemap[key_camera] = {'Landroid/hardware/Camera;->open('}

if len(sys.argv) >1:
    print 'Start Repackaging...'
    apk_path = sys.argv[1]
    file_path = apk_path[:-4]
    dest_path = '.\\'+file_path+'\\smali\\repackaging'
    unsigned_path = './'+file_path+'/dist/'+apk_path
    outapk_path = './repackaging_apk/'+apk_path
    Manifest_path = os.getcwd ()+os.sep+file_path+os.sep+'AndroidManifest.xml'
    smali_path = os.getcwd()+os.sep+file_path+os.sep+'smali'
    #start repackaging
    repackaging.unpackaging(apk_path)
    permission_set = repackaging.analyze_perm(Manifest_path,analyzemap)
    repackaging.analyze_smali(permission_set,smalimap,smali_path)
    repackaging.copy_code(dest_path)
    repackaging.packaging(file_path)   
    repackaging.signer(unsigned_path)
    repackaging.zipalign(outapk_path)
else: print 'useage:main.py apk_name'


