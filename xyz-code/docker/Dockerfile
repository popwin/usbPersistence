FROM ubuntu

# load in the environment.yml file - this file controls what Python packages we install
#ADD package.json /


#ADD ./sources.list /etc/apt/sources.list
#RUN cat /etc/apt/sources.list
RUN apt-get update && apt-get install -y libxkbfile-dev
RUN apt-get install -y libsecret-1-dev

RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y vim 
RUN npm install -g n
RUN apt-get install -y curl
RUN n stable
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
RUN cnpm install -g npm
RUN cnpm install -g body-parser
RUN cnpm install -g request
RUN cnpm install -g request-promise-native
RUN cnpm install -g vue
RUN cnpm install -g bootstrap
RUN cnpm install -g nodemailer

#用于使得npm全局包生效
RUN echo "export NODE_PATH=/usr/local/lib/node_modules/" >> /etc/profile
RUN echo "export NODE_PATH=/usr/local/lib/node_modules/" >> /root/.bashrc

#安装vscode 必要时查看最新版本的vscode
RUN wget https://github.com/cdr/code-server/releases/download/1.939-vsc1.33.1/code-server1.939-vsc1.33.1-linux-x64.tar.gz \
      && tar -xzvf code-server1.939-vsc1.33.1-linux-x64.tar.gz && chmod +x code-server1.939-vsc1.33.1-linux-x64/code-server

COPY ./docker/docker-entrypoint.sh /usr/local/bin/

ADD ./code /code

ENTRYPOINT ["docker-entrypoint.sh"]
