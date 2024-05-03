# AqBanking on Debian
#
# https://www.aquamaniac.de/sites/aqbanking
#
# VERSION: 6.5.5-beta

FROM debian:buster

COPY ktoblzcheck-1.53.tar.gz .

RUN \
	tar xfz ktoblzcheck-1.53.tar.gz && \
	apt-get update && apt-get -y install build-essential file libgcrypt20-dev pkg-config libgnutls28-dev libxmlsec1-dev curl libqt4-dev zlib1g-dev cmake && \
	curl https://www.aquamaniac.de/rdm/attachments/download/503/gwenhywfar-5.11.0beta.tar.gz | tar xfz - && \
	curl https://www.aquamaniac.de/rdm/attachments/download/505/aqbanking-6.5.5beta.tar.gz | tar xfz -

WORKDIR /gwenhywfar-5.11.0beta
RUN ./configure --with-guis '' && make && make install

RUN mkdir ktoblzcheck-build && apt-get -y install python2 python2-dev
WORKDIR /ktoblzcheck-build
RUN cmake ../ktoblzcheck-1.53 && make && make install

WORKDIR /aqbanking-6.5.5beta
RUN ./configure && make && make install

RUN ldconfig

WORKDIR /
