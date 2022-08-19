# AqBanking on Debian
#
# https://www.aquamaniac.de/sites/aqbanking
#
# VERSION: 5.99.34beta

FROM debian:buster

RUN \
	apt-get update && apt-get -y install build-essential file libgcrypt20-dev pkg-config libgnutls28-dev libxmlsec1-dev curl libqt4-dev zlib1g-dev cmake && \
	curl https://www.aquamaniac.de/rdm/attachments/download/156/gwenhywfar-4.99.17rc1.tar.gz | tar xfz - && \
	curl https://iweb.dl.sourceforge.net/project/ktoblzcheck/ktoblzcheck-1.50.tar.gz | tar xfz - && \
	curl https://www.aquamaniac.de/rdm/attachments/download/157/aqbanking-5.99.34beta.tar.gz | tar xfz -

WORKDIR /gwenhywfar-4.99.17rc1
RUN ./configure --with-guis '' && make && make install

RUN mkdir ktoblzcheck-build && apt-get -y install python2 python2-dev
WORKDIR /ktoblzcheck-build
RUN cmake ../ktoblzcheck-1.50 && make && make install

WORKDIR /aqbanking-5.99.34beta
RUN ./configure && make && make install

WORKDIR /
