eCrytfs 用于加密文件

存放在硬盘上的内容是经过加密的，必须知道密码和加密设置才能进行解密。
安全性很高，不像windows里所谓的加密软件，只是把文件隐藏而己。
此软件只能把文件加密，防止别人阅读，不能防止被人删除。
缺点：挂载过程太复杂繁琐，但可能相对安全性更高。

安装

安装eCrytfs： 
$sudo apt-get install ecryptfs-utils

创建一个目录用于存放加密文件： 
$mkdir ~/.Files

给这个目录设置权限让他人无法访问： 
$chmod 700 ~/.Files

创建一个目录用于挂载文件： 
$mkdir ~/Files

挂载

挂载加密文件夹：
sudo mount -t ecryptfs ~/.Files ~/Files （把前面的文件夹加密挂载到后面的目录中，此处如需密码是sudo要用的密码）

挂载选项：
passphrase:（加密文件夹的密码，自设。）

select cipher:
1) aes: blocksize = 16; min keysize = 16; max keysize = 32 (not loaded)
2) blowfish: blocksize = 16; min keysize = 16; max keysize = 56 (not loaded)
3) des3_ede: blocksize = 8; min keysize = 24; max keysize = 24 (not loaded)
4) twofish: blocksize = 16; min keysize = 16; max keysize = 32 (not loaded)
5) cast6: blocksize = 16; min keysize = 16; max keysize = 32 (not loaded)
6) cast5: blocksize = 8; min keysize = 5; max keysize = 16 (not loaded)
Selection [aes]: （选择加密方式，默认是[aes]。）

:Select key bytes: 
1) 16
2) 32
3) 24
（选择加密位数，默认是[16]。）

Enable plaintext passthrough(y/n) [n]:
（是否允许使用明文， n）

Enable filename encryption (y/n) [n]:
（是否把文件名也进行加密，y）

Filename Encryption Key (FNEK) Signature [xxxxxxxx]: （提示加密选项，和例行警告）
Attempting to mount with the following options:
ecryptfs_unlink_sigs
ecryptfs_fnek_sig=xxxxxxxx
ecryptfs_key_bytes=16
ecryptfs_cipher=aes
ecryptfs_sig=xxxxxxxx
WARNING: Based on the contents of [/root/.ecryptfs/sig-cache.txt],it looks like you have never mounted with this key before. This could mean that you have typed your passphrase wrong.

Would you like to proceed with the mount (yes/no)? : yes（再次确认挂载）

Would you like to append sig [xxxxxxxx] to [/root/.ecryptfs/sig-cache.txt] 
in order to avoid this warning in the future (yes/no)? : no（保存密钥到记录中，以避免提示，no）
Not adding sig to user sig cache file; continuing with mount.

Mounted eCryptfs （己成功挂载，可以进行读写文件了）
（注意：以上的加密的所有选项，必须记住，解密时必须用相同的设置）

卸载

卸载加密文件夹
sudo umount ~/Files
