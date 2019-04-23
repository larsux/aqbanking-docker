# AqBanking on Debian Stretch
#
# https://www.aquamaniac.de/sites/aqbanking
#
# VERSION: 5.99.24beta

FROM debian:stretch

RUN \
	apt-get update && apt-get -y install build-essential file libgcrypt20-dev pkg-config libgnutls28-dev libxmlsec1-dev curl && \
	curl https://www.aquamaniac.de/rdm/attachments/download/85/gwenhywfar-4.99.11beta.tar.gz | tar xfz - && \
	curl https://www.aquamaniac.de/rdm/attachments/download/86/aqbanking-5.99.24beta.tar.gz | tar xfz -

WORKDIR /gwenhywfar-4.99.11beta
RUN ./configure --with-guis '' && make && make install

WORKDIR /aqbanking-5.99.24beta
RUN ./configure && make && make install

WORKDIR /
