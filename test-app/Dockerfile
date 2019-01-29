FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm

RUN npm install -g http-server

RUN mkdir /src
WORKDIR /src

# copy app folder content to docker '/src/app' folder
COPY ./ /src/

CMD ["http-server", "-s"]