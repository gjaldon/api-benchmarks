# Installing Elixir
```
$ brew install elixir
```
If you are not on Mac OSX, you can find instructions for your OS here:
http://elixir-lang.org/getting_started/1.html#1.1-installers

You'll also need Erlang! http://elixir-lang.org/getting_started/1.html#1.5-installing-erlang

# Starting the App
```
$ mix do deps.get, compile
$ ./run.sh
```

# Notes
In my benchmarks using AB, I get ~4k requests/sec.
