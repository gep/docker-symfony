# set the base image first
FROM nginx:stable

# specify maintainer
MAINTAINER Andrey Semikov <andrew.semikov@gmail.com>

RUN apt-get update -y && \
	apt-get install -y --no-install-recommends \
	curl \
	vim \
	less

#ADD nginx/host.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]