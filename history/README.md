History
=======

## 21/07/1999
  
  - MacWorld NewYork 1999 - Steve Jobs presents Wifi (AirPort) which supports 11 Mbit/s
    - [Wikipedia - Airport](http://en.wikipedia.org/wiki/AirPort)
    - [Youtube - MacWorld NY 1999 Full](https://www.youtube.com/watch?v=zxPkD9y7_uo)
    - [Youtube - Steve Jobs introduces WiFi to the masses with a hula hoop!](https://www.youtube.com/watch?v=HFngngjy4fk)
    


### TODO

  - 04/11/1999 - Work through history of awi(4) driver
    - starting in NetBSD https://github.com/jsonn/src/commits/trunk/sys/dev/ic/awi.c?page=3
    - look into FreeBSD's awi(4) work
    - look into OpenBSD's awi(4) work
  - 04/01/2000 - NetBSD added net/if_ieee80211.h
    - http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/net/Attic/if_ieee80211.h?only_with_tag=MAIN
  - 18/09/2001 - NetBSD moved IEEE 802.11 MAC management functions from awi driver to net/if_ieee80211subr.c
    - https://github.com/jsonn/src/commit/208a21ce2058584c8830ee89b847e9c7bc10140b 
  - 23/06/2003 - FreeBSD imported new net80211 layer based on if_ieee80211.h / net/if_ieee80211subr.c
    - https://github.com/freebsd/freebsd/commit/505adc686a0029ab4aa4877118f251a1894a2603
    - [Github - FreeBSD net80211 history](https://github.com/freebsd/freebsd/commits/master/sys/net80211?page=29)
  - 30/08/2003 - NetBSD pulls in net80211 layer from FreeBSD
    - https://github.com/jsonn/src/commit/843b3e0cf641239a209761af530d33d657743223
    - [Github - NetBSD net80211 history](https://github.com/jsonn/src/commits/trunk/sys/net80211?page=10)
  - 23/06/2004 - OpenBSD pulls in net80211 layer from NetBSD
    - https://github.com/Mischi/openbsd-src/commit/36a464030ee8ae15735a19d3edd5bea6eb8b37d1 
    - [Github - OpenBSD net80211 history](https://github.com/Mischi/openbsd-src/commits/master/sys/net80211?page=12)
