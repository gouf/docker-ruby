FROM ubuntu:wily

# download and extract source archive, build Ruby
ADD build-ruby.sh /build-ruby.sh
ADD ruby-build-version /ruby-build-version

# Update and install dependencies
RUN apt-get -y update;\
    apt-get -y upgrade;\
    apt-get -y build-dep ruby-defaults;\
    apt-get -y install wget git openssl git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev;\
    apt-get clean;\
    apt-get autoclean;\
    /build-ruby.sh;rm /build-ruby.sh;rm /ruby-build-version
