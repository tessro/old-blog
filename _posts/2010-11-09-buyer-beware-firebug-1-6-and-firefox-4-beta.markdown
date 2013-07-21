---
layout: post
title: "Buyer Beware: Firebug 1.6 + Firefox 4 Beta"
date: 2010-11-09 12:00
comments: true
categories:
---

There is a bug in Firefox 4 beta 6 ([#557791](https://bugzilla.mozilla.org/show_bug.cgi?id=557791))
that interferes with Firebug’s "XHR Spy" feature (Firebug issue [#3223](http://code.google.com/p/fbug/issues/detail?id=3223)).
The net effect is that XmlHttpRequest onReadyStateChange events don't fire.

With JQuery, this manifests through $.ajax calls: success and error handlers don’t fire.

The workaround is to uncheck the "Show XmlHttpRequests" option in the Console panel.

For more details, see [Firebug's Known Issues](http://getfirebug.com/knownissues) page.

Hopefully this short post saves someone more time than I lost dealing with this bug today.
