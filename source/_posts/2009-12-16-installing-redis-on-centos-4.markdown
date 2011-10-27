---
layout: post
title: "Installing Redis on CentOS 4"
date: 2009-12-16 12:00
comments: true
categories:
---
TL;DR: CentOS 4 initscript for Redis at: http://gist.github.com/257849

## Vanity Is Nice

I am a huge fan of Vanity, Assaf Arkin’s “Experiment Driven Development” framework.  (A/B testing and metric tracking.)
"Gem install" to "cap deploy" in under an hour.  Talk about reducing the time investment required to get going with data-driven development!
It Just Makes Life Easier.

Vanity uses Redis as its backing store.  Redis is fast and lightweight — no problem there.  It builds on CentOS right out of the gate.
However, I want to use Redis with Vanity on a production site.  If Redis is down, Vanity crashes and takes my app with it.
I need it installed at runlevels 345, so it always starts at boot time. (We need adequate monitoring, too, but that’s a topic for another post.)

## CentOS Needs a Friend

There is a Ubuntu initscript floating around, but building dpkg to get the start-stop-service binary is a little heavyweight for my taste.
Instead, I’ve gutted an old Nginx initscript, and it works handily.

You can find it at: http://gist.github.com/257849

## If You Came for the Show

How to install Redis on CentOS 4, in 13 easy steps:

1. curl http://redis.googlecode.com/files/redis-1.02.tar.gz | tar zx
2. cd redis-1.02
3. make
4. sudo cp redis-server /usr/local/sbin
5. sudo cp redis-cli /usr/local/bin
6. sudo mkdir /var/lib/redis /etc/redis
7. sudo sed -e “s/^daemonize no$/daemonize yes/” -e “s/^dir .//dir /var/lib/redis//” -e “s/^loglevel debug$/loglevel notice/” -e “s/^logfile stdout$/logfile /var/log/redis.log/” redis.conf > /etc/redis/redis.conf
8. curl http://gist.github.com/gists/257849/download | tar -zxO > redis-server
9. chmod u+x redis-server
10. mv redis-server /etc/init.d
11. sudo /sbin/chkconfig –add redis-server
12. sudo /sbin/chkconfig –level 345 redis-server on
13. sudo /sbin/service redis-server start

Congratulations, you have a complete Redis installation!

* Config: /etc/redis/redis.conf
* Data: /var/lib/redis
* Logfile: /var/log/redis.log
* PID: /var/run/redis.pid

If you tweak the paths, you’ll need to edit redis.conf and/or the redis-server initscript accordingly.
