api-benchmark
=============

Microbenchmarking fun with several web application frameworks.

## Generate seed data

```
$ gem install mongo
$ gem install faker
$ rake
```

## How to Run

`$ ./run.sh` in each apps.


## Benchmark command

```
$ ab -c 100 -n 10000 http://localhost:3000/ping
```
