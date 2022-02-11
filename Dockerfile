# A minimal Docker image with Node and Puppeteer
#
# Initially based upon:
# https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md#running-puppeteer-in-docker

FROM buildkite/puppeteer:latest

# 设置 puppeteer 的字体 #fonts-droid fonts-arphic-ukai fonts-arphic-uming
COPY source-sans-pro.zip /tmp
RUN sed -i 's/deb.debian.org/mirrors.163.com/g' /etc/apt/sources.list && \
     apt update && \
     apt-get install libreoffice-writer -y && \
     apt-get install -y dpkg wget unzip && cd /tmp && wget http://ftp.cn.debian.org/debian/pool/main/f/fonts-noto-cjk/fonts-noto-cjk_20170601+repack1-3+deb10u1_all.deb && \
     dpkg -i fonts-noto-cjk_20170601+repack1-3+deb10u1_all.deb && \
     unzip source-sans-pro.zip && cd source-sans-pro  && mv ./OTF /usr/share/fonts/  && \
     fc-cache -f -v
