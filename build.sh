#!/bin/sh

USER_NAME='innocentzero'
RUBY_VERSION=$(cat ruby-build-version)

sudo docker build -t ${USER_NAME}/ruby:${RUBY_VERSION} .
