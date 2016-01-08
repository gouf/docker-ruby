#!/bin/bash

RUBY_VERSION=$(cat ruby-build-version)
PREV_DIR=$(pwd)
DOWNLOAD_DIR=$(echo ${RUBY_VERSION} | cut -c 1-3)

# Download and extract Ruby source
wget --quiet http://ftp.ruby-lang.org/pub/ruby/${DOWNLOAD_DIR}/ruby-${RUBY_VERSION}.tar.gz
tar -xzf ruby-${RUBY_VERSION}.tar.gz

# Compile and install
cd ruby-${RUBY_VERSION}
./configure
make -j 4
make install

# Install bundler gem
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler

# Remove downloaded archive and extracted directory
cd ${PREV_DIR}
rm ruby-${RUBY_VERSION}.tar.gz
rm -rf ruby-${RUBY_VERSION}
