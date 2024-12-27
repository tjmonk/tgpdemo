FROM ubuntu:latest AS build

LABEL maintainer="tjmonk@gmail.com"
LABEL version="1.0"
LABEL description="Demonstration environment for The Gateway Project"

RUN apt update
RUN apt -y install \
    repo \
    cmake \
    build-essential \
    curl \
    libcurl4-openssl-dev \
    libssl-dev \
    uuid-dev \
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
    bison

WORKDIR /tgp
COPY CMakeLists.txt .
RUN repo init -u https://github.com/tjmonk/tgp -b main && repo sync -c -j8

RUN mkdir -p build
WORKDIR /tgp/build 
RUN cmake .. && make && make install

FROM busybox
COPY --from=build /tgp/bin/ /usr/local/bin/
COPY --from=build /tgp/lib/ /lib/
COPY etc/ /etc/
COPY bin/ /usr/local/bin

RUN addgroup -S varserver

ENTRYPOINT ["start.sh"]



