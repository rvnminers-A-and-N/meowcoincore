FROM node:10.5.0

EXPOSE 3001

RUN apt-get update && apt-get -y install \
    build-essential \
    curl \
    git \
    libevent-dev \
    libzmq3-dev \
    make \
    && apt-get clean

RUN useradd -ms /bin/bash -d /app api

WORKDIR /app

USER api

COPY . .
#RUN git clone https://github.com/ravendevkit/ravencore.git

RUN npm install

COPY run.sh .

CMD ["/app/run.sh"]
