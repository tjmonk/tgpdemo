FROM alpine:latest AS build

LABEL maintainer="tjmonk@gmail.com"
LABEL version="1.0"
LABEL description="Demonstration environment for The Gateway Project"

RUN apk update
RUN apk add \
    cmake \
    alpine-sdk \
    curl \
    curl-dev \
    ossp-uuid-dev \
    ca-certificates \
    gcc \
    make \
    m4 \
    autoconf \
    autoconf-archive \
    automake \
    libtool \
    lighttpd \
    flex \
    bison \
    python3 \
    gpg \
    gpg-agent \
    openssh \
    linux-headers \
    fcgi-dev \
    paho-mqtt-c \
    paho-mqtt-c-dev

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo && chmod 755 /bin/repo

WORKDIR /tgp
COPY CMakeLists.txt .
RUN repo init -u https://github.com/tjmonk/tgp -b main && repo sync -c -j8

RUN mkdir -p build
WORKDIR /tgp/build 
RUN cmake .. && make && make install

FROM alpine:latest
COPY --from=build /tgp/bin/ /usr/local/bin/
COPY --from=build /tgp/lib/ /lib/
COPY etc/ /etc/tgp/
COPY bin/ /usr/local/bin

RUN apk add libssl3 fcgi paho-mqtt-c lighttpd curl

RUN addgroup -S varserver

ENTRYPOINT ["start.sh"]



