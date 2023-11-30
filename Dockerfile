FROM nginx:1.25.3
LABEL maintainer="Aurélien LE MOULLEC"
RUN rm -rf /var/www/html/*
RUN apt-get update -y && apt-get upgrade -y
COPY webapp/ /var/www/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Expose is NOT supported by Heroku
# EXPOSE 80
# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku	
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'