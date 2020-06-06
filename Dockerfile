FROM node:12.14.1

ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /dealio
COPY service1/ /dealio
RUN npm install
RUN npm install -g pm2
CMD ["pm2-runtime", "app.js"]
