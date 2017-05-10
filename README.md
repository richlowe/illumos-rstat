# Illumos RPC status daemon

This is the illumos `rpc.rstatd(1M)` excised from illumos-gate prior to its
removal, for those few people who claim to need it.

It also serves as an example for anyone who may wish to save `rpc.rwalld(1M)`,
`rpc.sprayd(1M)` and such in a similar manner.

`make install` will create a `proto/` directory containing those files which
you should package.
