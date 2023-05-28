### Dockerized XMPLUS
---

#### After cloning  the repo, follow these steps:
1. Run `cp .env.sample .env`. the default database password is `xmplus`. You can change it by editing `MYSQL_ROOT_PASSWORD` variable inside `.env` file
2. Run `cp caddy.conf.sample caddy.conf` and replace `<host>` with your domain. Also for https, replace `<email>` with your email
3. Download the xmplus project by running these commands
    ```
    cd www

    wget https://github.com/xcode75/XManagerPlus/releases/download/v20230521/XMPlus.zip
    
    unzip XMPlus.zip
    rm XMPlus.zip
    ```
4. Edit `www/config/config.php.back` and change database host to `mysql` and password to the database password which specified in `.env` file
5. Then build and run services by running:`docker-compose up -d`. Please make sure that the services start successfully by seeing their log: `docker-compose logs -f`
6. Go to phpmyadmin panel by visiting `http://<your domain>:8080/` (username is root and password is specified in .env) and then import database file `www/database/database.sql` into database (default database name is xmplus)
7. Then run a interactive bash by running `docker-compose exec www bash`, After entering to it, run `sh install.sh` to install the panel
8. When installing finished, you can run `php xmplus admin` to create a admin user in panel.
9. Done! the panel is located in `https://<your domain>`