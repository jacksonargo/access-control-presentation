$ head -n0 < /dev/tcp/104.239.175.131/22
$ head -n0 < /dev/tcp/104.239.175.131/80
-bash: connect: No route to host
-bash: /dev/tcp/104.239.175.131/80: No route to host
$ head -n0 < /dev/tcp/10.209.66.22/22
$ head -n0 < /dev/tcp/10.209.66.22/80
$ head -n0 < /dev/tcp/10.209.66.22/111
-bash: connect: No route to host
-bash: /dev/tcp/10.209.66.22/111: No route to host