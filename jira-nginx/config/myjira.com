server {
    listen 8081;
    server_name myjira.com;

    access_log /var/www/myjira.com/logs/access.log;
    error_log /var/www/myjira.com/logs/error.log;

    location / {
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Server $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; 
        proxy_pass http://jira:8080/;
        client_max_body_size 10M;
    }
}