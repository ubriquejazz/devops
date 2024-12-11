CREATE USER mediauser@'%' IDENTIFIED BY 'mediapassword';

CREATE DATABASE my_wiki;

GRANT ALL PRIVILEGES ON my_wiki.* TO mediauser@'%';

flush privileges;
quit
