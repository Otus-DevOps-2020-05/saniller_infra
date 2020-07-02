#!/bin/sh
#install git
apt-get install git
#deploy
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

# start server
puma -d
# print port to console
ps aux | grep puma
