# cd /var/www/html
# curl -s https://wordpress.org/latest.tar.gz | tar xz
# curl -sI localhost/wordpress/ | awk /HTTP/
HTTP/1.1 200 OK
# ls -l wordpress/index.php
-rw-r--r--. 1 nobody nfsnobody 418 Sep 24  2013 wordpress/index.php
# chown -R jpeaches:jpeaches wordpress/
# find wordpress/ -type d -exec chmod 700 {} \+
# find wordpress/ -type f -exec chmod 600 {} \+
# curl -sI localhost/wordpress/ | awk /HTTP/
HTTP/1.1 403 Forbidden
# setfacl -R -m u:apache:rX wordpress/
# setfacl -R -m default:u:apache:rX wordpress/
# curl -sI localhost/wordpress/ | awk /HTTP/
HTTP/1.1 200 OK
# sudo -u wpftp touch wordpress/index.php 
touch: cannot touch 'wordpress/index.php': Permission denied
# setfacl -R -m u:wpftp:rwX wordpress/
# setfacl -R -m default:u:wpftp:rwX wordpress/
# sudo -u wpftp touch wordpress/index.php 
# ls -l wordpress/index.php
-rw-rw----+ 1 jpeaches jpeaches 418 Apr 18 04:06 wordpress/index.php
# sudo -u wpftp touch wordpress/newfile
# getfacl wordpress/newfile | awk "/^user:(apache|wpftp)/"
user:apache:r-x	#effective:r--
user:wpftp:rwx	#effective:rw-
# sudo -u jpeaches touch wordpress/newfile 
touch: cannot touch 'wordpress/newfile': Permission denied
# setfacl -R -m u:jpeaches:rwX wordpress/
# setfacl -R -m default:u:jpeaches:rwX wordpress/
# sudo -u jpeaches touch wordpress/newfile
# ls -l wordpress/newfile
-rw-rwx---+ 1 wpftp wpftp 0 Apr 18 04:26 wordpress/newfile
# getfacl wordpress | awk '!/^(#|$)/'
user::rwx
user:apache:r-x
user:jpeaches:rwx
user:wpftp:rwx
group::---
mask::rwx
other::---
default:user::rwx
default:user:apache:r-x
default:user:jpeaches:rwx
default:user:wpftp:rwx
default:group::---
default:mask::rwx
default:other::---

