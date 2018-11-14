#!/bin/sh
# Usage: ./wasm2cb.sh <filename>.wasm
out=""
for x in $(xxd -ps -c1 $1)
  do out="$out,$(( 16#$x ))"
done
echo $out|sed "s/^,\(.*\)$/var wasmCode = new Uint8Array([\1]);/"
