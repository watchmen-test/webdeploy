# https://docs.docker.com/engine/reference/builder/

# base this image on the PHP image that comes with Apache https://hub.docker.com/_/php/
FROM httpd:latest

# Run Apache
ADD test-app/ /usr/local/apache2/htdocs/
