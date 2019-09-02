## Toggle ext_authz cluster

There are two setups here, the buggy one (issue 8025) and the "fixed" one.

To run the buggy one:

```
$ make up-buggy
$ # (this uses latest tagged envoy v1.11.1).
....
$ # in separate tab, do siege or wrk against the envoy service, simulating curl localhost:8000
$ # e.g. wrk -d 5m http://localhost:8000
$ make toggle-buggy
# it should crash!
# bug-8025_envoy_1 exited with code 139
```

The "fixed" one:

```
$ make up-fixed
....
$ # in separate tab, do siege or wrk against the envoy service, simulating curl localhost:8000
$ # e.g. wrk -d 5m http://localhost:8000
$ make toggle
# it should not crash
```

To play around more:

```
$ make up
....
$ # in separate tab, do siege or wrk against the envoy service, simulating curl localhost:8000
$ # e.g. wrk -d 5m http://localhost:8000
$ # inspect the log, at the beginning it uses "auth1". Or check on curl localhost:8001/config_dump.
$ make toggle
$ # inspect the log, after the config is updated, it uses "auth2". Or check on curl localhost:8001/config_dump.
```
