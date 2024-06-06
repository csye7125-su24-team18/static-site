FROM caddy
COPY ./index.html /usr/share/caddy/
COPY Caddyfile /etc/caddy/Caddyfile
# EXPOSE 8080
