# Dockerfile for AqBanking on Debian Buster
Version: 5.99.34beta


### Build
```bash
docker build -t aqbanking .
```

### Initial run
```bash
cd ~
mkdir -p .aqbanking/settings/backends
docker run --rm -ti -v "$(pwd)/.aqbanking":/root/.aqbanking aqbanking:latest aqbanking-cli versions
```

#### Example Usage: Create user for HASPA Account and get balance
```bash
docker run --rm -ti -v "$(pwd)/.aqbanking":/root/.aqbanking aqbanking:latest aqhbci-tool4 adduser -t pintan --context=1 -b 20050550 -u 1234567890 -s 'https://banking-hh7.s-fints-pt-hh.de/fints30' -N 'Max Mustermann' --hbciversion=300
docker run --rm -ti -v "$(pwd)/.aqbanking":/root/.aqbanking aqbanking:latest aqhbci-tool4 listusers
docker run --rm -ti -v "$(pwd)/.aqbanking":/root/.aqbanking aqbanking:latest aqhbci-tool4 getbankinfo -u 1
docker run --rm -ti -v "$(pwd)/.aqbanking":/root/.aqbanking aqbanking:latest aqhbci-tool4 getsysid -u 1
docker run --rm -ti -v "$(pwd)/.aqbanking":/root/.aqbanking aqbanking:latest aqhbci-tool4 listitanmodes -u 1
docker run --rm -ti -v "$(pwd)/.aqbanking":/root/.aqbanking aqbanking:latest aqhbci-tool4 setitanmode -u 1 -m 3920
docker run --rm -ti -v "$(pwd)/.aqbanking":/root/.aqbanking aqbanking:latest aqhbci-tool4 getaccounts -u 1
docker run --rm -ti -v "$(pwd)/.aqbanking":/root/.aqbanking aqbanking:latest aqhbci-tool4 listaccounts -v
docker run --rm -ti -v "$(pwd)/.aqbanking":/root/.aqbanking aqbanking:latest aqhbci-tool4 mkpinlist -o /root/.aqbanking/settings/backends/max

# Replace <PIN> with your pin (e.g. 12345)
docker run --rm -ti -v "$(pwd)/.aqbanking":/root/.aqbanking aqbanking:latest sed -i 's/""/"<PIN>"/' /root/.aqbanking/settings/backends/max
docker run --rm -ti -v "$(pwd)/.aqbanking":/root/.aqbanking aqbanking:latest aqbanking-cli -n -P /root/.aqbanking/settings/backends/max request -b 20050550 -a 1234567890 --balance
```
