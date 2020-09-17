FROM node:14.10.1-stretch
WORKDIR /node

RUN apt-get update
RUN apt-get -y install locales-all

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

RUN wget -q https://github.com/gohugoio/hugo/releases/download/v0.74.3/hugo_extended_0.74.3_Linux-64bit.tar.gz \
&& tar xvf hugo_extended_0.74.3_Linux-64bit.tar.gz \
&& install hugo /usr/bin

RUN npm init -y \
&&  npm install autoprefixer \
&&  npm install -g postcss-cli

ENTRYPOINT ["sh","/app/run.sh"]
CMD ["console"]
