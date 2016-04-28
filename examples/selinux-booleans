# curl -sI localhost | awk /HTTP/
HTTP/1.1 403 Forbidden
# tail -n1 /var/log/httpd/error_log
... (13)Permission denied...
# ls -lZ /var/www/html/index.html 
-rwxr-xr-x. root root system_u:object_r:nfs_t:s0       /var/www/html/index.html
# awk '/var\/www/ { print $1, $2, $3 }' /etc/mtab
127.0.0.1:/srv/nfs/www/html /var/www/html nfs4
# getsebool -a | awk '/httpd/ && /nfs/'
httpd_use_nfs --> off
# setsebool -P httpd_use_nfs on
# getsebool -a | awk '/httpd_use_nfs/'
httpd_use_nfs --> on
# curl -sI localhost | awk /HTTP/
HTTP/1.1 200 OK