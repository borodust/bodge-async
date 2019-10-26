#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

lisp download-specs --lib-postfix ".bodged" \
     uv https://github.com/borodust/bodge-uv \
     "$script_dir/../src/spec/" $1
