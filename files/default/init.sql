CREATE DATABASE fisheye CHARACTER SET utf8 COLLATE utf8_bin;	
GRANT ALL PRIVILEGES ON fisheye.* TO 'fisheye'@'%' IDENTIFIED BY 'fisheye';
GRANT ALL PRIVILEGES ON fisheye.* TO 'fisheye'@'localhost' IDENTIFIED BY 'fisheye';
