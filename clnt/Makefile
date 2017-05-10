#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

# Copyright 2017, Richard Lowe.

include ../Makefile.com

PROG= rup
CFLAGS +=  -Wno-unused -Wno-implicit-function-declaration -Wno-parentheses	
LDLIBS= -lsocket -lnsl -lrpcsvc

MAN1= rup.1
MAN1C = rup.1c

ROOTPROG=$(PROG:%=$(ROOTBINDIR)/%)
ROOTMAN=$(MAN1:%=$(ROOTMAN1DIR/%)) $(MAN1C:%=$(ROOTMAN1CDIR/%))

all: $(PROG)

install: all $(ROOTPROG) $(MAN)

clean:
	rm -f rup

clobber: clean

lint:

.KEEP_STATE:

