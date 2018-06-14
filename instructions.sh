#!/usr/bin/env bash

# Install dependencies
sudu apt-get update
apt-get install -y \
	vim \
	curl \
	wget \
	git \
	make \
	netcat \
	python \
	python2.7-dev \
	g++ \
	bzip2 \
	binutils \
      libasound2 \
      libasound-dev \
      libssl-dev

# Download and install more dependencies
git clone https://github.com/theintencity/py-audio.git
pushd py-audio
wget http://www.music.mcgill.ca/~gary/rtaudio/release/rtaudio-4.0.12.tar.gz
wget http://downloads.xiph.org/releases/speex/speex-1.2rc1.tar.gz
wget http://www.speech.cs.cmu.edu/flite/packed/flite-1.4/flite-1.4-release.tar.bz2

tar -zxvf rtaudio-4.0.8.tar.gz
tar -zxvf speex-1.2rc1.tar.gz
bunzip2 flite-1.4-release.tar.bz2
tar -xvf flite-1.4-release.tar

pushd rtaudio-4.0.8
./configure && make
popd && pushd speex-1.2rc1
./configure && make
popd && pushd flite-1.4-release
./configure CFLAGS="-fPIC" && make

cp ../setup.py .
CXX=g++ CFLAGS=-Wl,--no-as-needed python setup.py -v build
cp build/lib*/audio*.so .
popd

git clone https://github.com/theintencity/rtclite.git
cp caller2.py rtclite/rtclite/app/sip