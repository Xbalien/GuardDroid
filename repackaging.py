import os
import fileinput
import subprocess

def unpackaging(apk_path):
    subprocess.call(['apktool','d',apk_path],shell=True)

def packaging(file_path):
    subprocess.call(['apktool','b',file_path],shell=True)

def signer(unsigned_path):
    print 'Start Signing...'
    signer_comm=['jarsigner','-verbose','-keystore','key','-digestalg','SHA1','-sigalg', 'MD5withRSA' ,'-signedjar','signed.apk']
    signer_comm += [unsigned_path,'key']
    p = subprocess.Popen(signer_comm,stdin=subprocess.PIPE,stdout = subprocess.PIPE, stderr = subprocess.PIPE, shell = True)
    p.communicate(input='key123456')
    p.wait()

def zipalign(outapk_path):
    subprocess.call(['zipalign','-v','4','signed.apk',outapk_path],shell=True)

def copy_code(dest_path):
    p = subprocess.Popen(['xcopy','.\\repackaging',dest_path,'/s','/d'],stdin=subprocess.PIPE,stdout = subprocess.PIPE, stderr = subprocess.PIPE, shell = True)
    p.communicate(input='D')
    p.wait()
    
def analyze_perm(filename,dictionary):
    import xml.dom.minidom
    per_set=set()
    dom=xml.dom.minidom.parse(filename)
    root=dom.documentElement
    upermission_list=root.getElementsByTagName('uses-permission')
    for upermission_unit in upermission_list:
        per_name=upermission_unit.getAttribute('android:name')
        if per_name in dictionary.keys():
            per_set=per_set|set(dictionary[per_name])
    #print per_set
    return per_set


def analyze_smali(per_set,dictionary,basedir):    

    def handle_file(file_list,dictionary,per_set):
        for filename in file_list:
            for line in fileinput.input(filename,inplace=True):
                if len(line) == 0:
                    break
                if 'invoke' in line:
                    itemstart=line.find('L')
                    itemend=line.find('(')
                    semicolon=line.find('->')
                    if itemstart>=0 or itemend>itemstart:
                        keyline=line[itemstart:itemend+1]
                        if (keyline in per_set) or keyline.find(';->registerReceiver(')!=-1 or keyline.find(';->unregisterReceiver(')!=-1 or keyline.find(';->startActivity(')!=-1: 
                            if keyline=='Landroid/hardware/Camera;->open(':
                                line=line[:itemstart]+dictionary[keyline]+line[semicolon:]
                            elif keyline.find(';->registerReceiver(')!=-1 or keyline.find(';->unregisterReceiver(')!=-1 or keyline.find(';->startActivity(')!=-1:
                                index_start=keyline.find(';')
                                index_end=keyline.find('(')
                                key = keyline[index_start:index_end+1]
                                line=line[:itemstart]+dictionary[key]+line[semicolon:itemend+1]+'Landroid/content/Context;'+line[itemend+1:]
                                line=line.replace('virtual','static')
                            else:
                                line=line[:itemstart]+dictionary[keyline]+line[semicolon:itemend+1]+line[itemstart:semicolon]+line[itemend+1:]
                                line=line.replace('virtual','static')
                print line.rstrip()
        fileinput.close() 
          
    def import_file(floder_path):
        file_list = []
        if floder_path is None:
            raise Exception("floder_path is None")
        for dirpath, dirnames, filenames in os.walk(floder_path):
            if floder_path+os.sep+'android' in dirpath:
                continue
            #print dirpath
            for name in filenames:
                #if dirpath==floder_path+os.sep+'com'+os.sep+'lyx'+os.sep+'my_trojan':
                #    continue
                #    if name[:2]=='R$':
                #        continue
                #    if name=='R.smali':
                #        continue
                file_list.append(dirpath + os.sep + name)
                #print dirpath+os.sep+name
        return file_list
    
    handle_file(import_file(basedir),dictionary,per_set)
