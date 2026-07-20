FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY public/ /usr/share/nginx/html/

# Coolify / reverse proxy must target this port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
