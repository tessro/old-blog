---
layout: post
title: "Point-and-Click Install of MongoDB on OS X 10.5+"
date: 2010-06-01 12:00
comments: true
categories:
---

Update: v1.4.4 is now available!  See download links below.

Our skunk-works project at [CollegeJobConnect](http://collegejobconnect.com/) uses [MongoDB](http://mongodb.org/) extensively for persistence.
(Through the excellent [Mongoid](http://mongoid.org/) ODM.)  MongoDB is fantastic, but setup on my MacBook Pro is still a manual process with each new version,
so I've packaged up a simple installer that should get you up and running in no time.

## The Old Way

1. Download the MongoDB binary distribution from the matrix at MongoDB.org
2. Extract
3. Move to /usr/local
4. Symlink mongodb-osx-x86_64-1.4.4 -> mongodb
5. Create a .plist file in /Library/LaunchDaemons
6. Load the .plist file into launchd using launchctl
7. Create data and log directories in /var
8. Add Mongo to the path (/etc/paths.d/mongodb)

## The New Way

1. Download the MongoDB installer from Github ([click here](http://github.com/paulrosania/mongo-installer/downloads))
2. Run the installer

You can check to see if it’s working properly by visiting [http://localhost:28017/](http://localhost:28017/) after installation has completed.

## Requirements

The installer uses launchd and the x86_64 release of MongoDB v.1.4.4.  It requires:

* Mac OS X 10.5 (Leopard) or 10.6 (Snow Leopard)
* A 64-bit CPU (Core 2 Duo or newer)

Steps to get it working on 10.4 (Tiger) are probably minimal but are left as an exercise for the reader.  I don't use Tiger anymore... YMMV.

Feel free to leave feedback in the comments.  Issues should be lodged at [Github](http://github.com/paulrosania/mongo-installer/issues).

### Disclaimer

The installer is provided as a community service to people like me who are looking for an easier way to install MongoDB and keep it up to date.  It comes with no warranty.  I am not responsible for any damage caused by the installer.  The project is freely available on Github.  Feel free to [peruse the source](http://github.com/paulrosania/mongo-installer) if you like.
