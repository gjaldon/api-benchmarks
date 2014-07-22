#! /bin/sh
./dist/build/app/app \
  #Use Runtime system
  +RTS  \
  # Allocate 4 Megabyte for GC
  -A4M  \
  # Run multiple threads, as many as processors available
  -N   \
  # Parallel GC
  -qg2 \
  # Disable idle GC
  -I0  \
