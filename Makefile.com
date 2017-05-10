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

CC= gcc
CFLAGS= -Wall -Wno-unknown-pragmas

ROOT = ../proto/
ROOTMANDIR = $(ROOT)/usr/share/man
ROOTMAN1DIR = $(ROOTMANDIR)/man1
ROOTMAN1CDIR = $(ROOTMANDIR)/man1c
ROOTMAN1MDIR = $(ROOTMANDIR)/man1m

ROOTNETSVCDIR = $(ROOT)/usr/lib/netsvc/rstat
ROOTMANIFESTDIR = $(ROOT)/lib/svc/manifest/rpc

ROOTBINDIR= $(ROOT)/usr/bin

$(ROOTMAN1DIR): FRC
	ginstall -d $(ROOTMAN1DIR)

$(ROOTMAN1CDIR): FRC
	ginstall -d $(ROOTMAN1CDIR)

$(ROOTBINDIR): FRC
	ginstall -d $(ROOTBINDIR)

$(ROOTNETSVCDIR): FRC
	ginstall -d $(ROOTNETSVCDIR)

$(ROOTMANIFESTDIR): FRC
	ginstall -d $(ROOTMANIFESTDIR)

$(ROOTMAN1MDIR): FRC
	ginstall -d $(ROOTMAN1MDIR)

$(ROOTMAN1DIR)/%:  $(ROOTMAN1DIR) ./%
	rm -f $@; ginstall -m 0444 -t $(@D) $<

$(ROOTMAN1CDIR)/%: $(ROOTMAN1CDIR) ./%
	rm -f $@; ginstall -m 0444 -t $(@D) $<

$(ROOTBINDIR)/%: $(ROOTBINDIR) ./%
	rm -f $@; ginstall -m 0555 -t $(@D) $<

$(ROOTNETSVCDIR)/%: % $(ROOTNETSVCDIR)
	rm -f $@; ginstall -m 0555 -t $(@D) $<

$(ROOTMANIFESTDIR)/%: % $(ROOTMANIFESTDIR)
	rm -f $@; ginstall -m 0444 -t $(@D) $<

$(ROOTMAN1MDIR)/%: % $(ROOTMAN1MDIR)
	rm -f $@; ginstall -m 0444 -t $(@D) $<


FRC:
