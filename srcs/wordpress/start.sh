sleep 30
wp core install --allow-root --path=/var/www/localhost/htdocs/ --url=192.168.99.156:5050 --title=ft_services --admin_user=wp-admin --admin_password=wpwachtwoord --admin_email=novan-ve@student.codam.nl --skip-email
wp user create author author@author.nl --role=author --user_pass=author --allow-root --path=/var/www/localhost/htdocs/
wp user create editor editor@editor.nl --role=editor --user_pass=editor --allow-root --path=/var/www/localhost/htdocs/
php -S 0.0.0.0:5050 -t /var/www/localhost/htdocs/
