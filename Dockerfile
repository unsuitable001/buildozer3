FROM bitnami/minideb:latest

LABEL maintainer="unsuitable001"

ENV DIR '/src'

ENV PATH /usr/local/bin:$PATH
ENV LANG C.UTF-8

ENV CYTHON_VERSION=0.25.2

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -ex \
    && dpkg --add-architecture i386 \
    && apt-get update -y -qq \
    && apt-get upgrade -y -qq \
    && install_packages build-essential libtool python3 python-dev libportmidi-dev libswscale-dev libavformat-dev
RUN set -ex \
    && install_packages libavcodec-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev python3-kivy python3-pip \
        git unzip zlib1g-dev zlib1g:i386 openjdk-8-jdk libgtk2.0-0:i386 libpangox-1.0-0:i386 libpangoxft-1.0-0:i386
RUN set -ex \
    && install_packages libidn11:i386 lib32stdc++6 libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev \
        libc6-dev libbz2-dev wget libstdc++6:i386 bsdtar autotools-dev autoconf sudo zip python3-dev python3-setuptools

RUN set -ex \
	&& sudo ln -fs /usr/bin/python3 /usr/bin/python \
	&& sudo ln -s /usr/bin/pip3 /usr/bin/pip \
	&& pip install cython

RUN set -ex \
    && useradd kivy -mN \
    && echo "kivy:kivy" | chpasswd && adduser kivy sudo \
    && mkdir -p $DIR \
    && chown kivy:users /opt \
    && chown kivy:users /src

RUN set -ex \
    && sudo -u kivy -i \
    && cd /opt \
    && git clone https://github.com/kivy/buildozer \
    && cd buildozer \
    && python setup.py build \
    && pip install -e . \
    && sed -i -e 's/build.gradle/~build.gradle/g' /opt/buildozer/buildozer/targets/android.py


RUN ln -s /usr/local/bin/buildozer /bin/buildozer

RUN mkdir /buildozer && chown kivy /buildozer


VOLUME /home/kivy/

WORKDIR /home/kivy/

RUN set -ex \
    && wget -q https://raw.githubusercontent.com/unsuitable001/buildozer3/master/buildozer.spec \
    && wget -q https://raw.githubusercontent.com/unsuitable001/buildozer3/master/main.py \
    && wget -q https://github.com/unsuitable001/buildozer3/blob/master/ndkloader \
    && chmod +x ndkloader


WORKDIR /home/kivy/

USER kivy

CMD bash -C 'ndkloader';'bash'
