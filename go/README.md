# Quipper API benchmark Go version

# How to install Go

```
$ brew install go
```

After install set `GOROOT` and `GOPATH` and add it to `PATH`.
Add following to your init script (.bash_profile, .bashrc, .zshrc, etc...)

```
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME
export PATH=$GOPATH/bin:$PATH
```

# How to build

```
$ go get github.com/gin-gonic/gin
$ go get labix.org/v2/mgo
$ go get labix.org/v2/mgo/bson
```

# How to run

```
$ ./run.sh
```
