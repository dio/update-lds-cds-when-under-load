## Toggle ext_authz cluster

TL;DR

```
$ make up
....
$ # in separate tab, do siege or wrk against the envoy service, simulating curl localhost:10000
$ # e.g. wrk -d 5m http://localhost:10000
$ # inspect the log, at the beginning it uses "auth1". Or check on curl localhost:8001/config_dump.
$ make toggle
$ # inspect the log, after the config is updated, it uses "auth2". Or check on curl localhost:8001/config_dump.
```
