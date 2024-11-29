FROM ubuntu:xenial

RUN apt-get update -y
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 libssl-dev git nano libboost-dev libboost-all-dev software-properties-common

RUN add-apt-repository ppa:bitcoin/bitcoin --yes \
  && apt-get -y update \
  && apt-get install -y libdb4.8-dev libdb4.8++-dev libminiupnpc-dev

ENV GIT_COIN_URL=https://github.com/bbqcoin2012/BBQCoin
ENV GIT_COIN_NAME=BBQCoin   

RUN git clone https://github.com/bitcoin-core/secp256k1 \
    && cd secp256k1 \
    && git checkout ac83be33 \
    && ./autogen.sh \
    && ./configure --enable-module-schnorrsig --enable-experimental \
    && make \
    && make install \
    && ldconfig

RUN apt-get install -y wget

RUN	git clone $GIT_COIN_URL $GIT_COIN_NAME

RUN cd $GIT_COIN_NAME \
    && wget https://github.com/litecoin-project/litecoin/blob/master/autogen.sh \
    && chmod +x configure \
	&& chmod +x src/leveldb/build_detect_platform

RUN cd $GIT_COIN_NAME/src/secp256k1/ \
	&& chmod +x autogen.sh \
	&& ./autogen.sh \
    && ./configure

RUN cd $GIT_COIN_NAME \
    && ./configure --with-incompatible-bdb --disable-tests

RUN cd $GIT_COIN_NAME \
    && make