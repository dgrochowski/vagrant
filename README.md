# vagrant
Vagrant configuration skeleton

## Contains:
- PHP 7.3
- Nginx + Symfony 4 config
- Mysql
- Composer
- Vim

#### Default configuration
- DB user: `root`
- DB password: `pass`
- IP: `127.0.0.1` (localhost)
- Nginx port: `80` shared to host `8888`

## How to use?

1. Place your application in this directory (`index.php` file should be in `public/` dir)
2. Run `vagrant up`
3. Visit `localhost:8888`
4. Enjoy
