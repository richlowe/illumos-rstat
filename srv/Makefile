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

PROG= rpc.rstatd

OBJS= rstat_main.o rstat_proc.o rstat_svc.o rstat_v2_svc.o rstat_v2_xdr.o
SRCS= $(OBJS:%.o=%.c)

CFLAGS += -I/usr/include/rpcsvc -Wno-implicit-function-declaration -Wno-unused \
	-Wno-parentheses -Wno-missing-braces

LDLIBS += -lsocket -lnsl -lrpcsvc -lkstat 

rstat_svc.c: /usr/include/rpcsvc/rstat.x
	rpcgen -C -m /usr/include/rpcsvc/rstat.x > $@

rstat_v2.h: rstat_v2.x
	rpcgen -C -h rstat_v2.x > $@

rstat_v2_svc.c: rstat_v2.x
	rpcgen -C -m rstat_v2.x > $@

rstat_v2_xdr.c: rstat_v2.x
	rpcgen -c rstat_v2.x > $@

$(PROG): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDLIBS)

$(OBJS): rstat_v2.h

all: $(PROG)

clean:
	rm -f $(PROG)

clobber: clean
	rm -f $(OBJS) rstat_svc.c rstat_v2.h rstat_v2_svc.c rstat_v2_xdr.c

install: all $(ROOTNETSVCDIR)/$(PROG) $(ROOTMANIFESTDIR)/rstat.xml \
	$(ROOTMAN1MDIR)/rpc.rstatd.1m $(ROOTMAN1MDIR)/rstatd.1m

$(ROOTMAN1MDIR)/rstatd.1m:
	ln -s rpc.rstatd.1m $@

.KEEP_STATE:
