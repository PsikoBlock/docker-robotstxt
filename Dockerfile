FROM nginx:1.23.2-alpine

# This is a hardcoded placeholder.
# We'll likely configure confd to write this file
# from key value pairs from something like etcd.
COPY robots.txt /usr/share/nginx/html/
