# mkdir /etc/httpd/passwd/
# chown apache:apache /etc/httpd/passwd/
# chmod 700 /etc/httpd/passwd/
# awk -F: -v OFS=: '/^jpeaches/ { print $1, $2 }' /etc/shadow > /etc/httpd/passwd/passwords
# htpasswd -b /etc/httpd/passwd/passwords wpftp ILovePeaches
# chown apache:apache /etc/httpd/passwd/passwords
# chmod 600 /etc/httpd/passwd/passwords
# curl -sI localhost/wordpress/ -u jpeaches:ILovePeaches | awk /HTTP/
HTTP/1.1 200 OK
# curl -sI 127.0.0.1/wordpress/ -u jpeaches:ILovePeaches | awk /HTTP/
HTTP/1.1 200 OK
# curl -sg6 -I [::1]/wordpress/ -u jpeaches:ILovePeaches | awk /HTTP/
HTTP/1.1 200 OK
# curl -sI 104.239.175.131/wordpress/ -u jpeaches:ILovePeaches | awk /HTTP/
HTTP/1.1 403 Forbidden