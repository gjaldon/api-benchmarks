#!/bin/sh

MIX_ENV=prod mix compile.protocols
MIX_ENV=prod PORT=3000 elixir -pa _build/prod/consolidated -S mix phoenix.start
