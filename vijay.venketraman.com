server {
        listen 80;
        listen [::]:80;

        root /var/www/node.venketraman.com/html/vijay;
        index index.html index.htm index.nginx-debian.html;

        server_name vijay.venketraman.com www.vijay.venketraman.com;

	location /vijay {
        proxy_pass http://localhost:3300;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        }
 location /chigago {
        proxy_pass http://localhost:3330;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        }

        }
