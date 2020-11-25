#!/usr/bin/env fish
Lines should be listed in the work flow
set -gx SRCFILENAME

set srcfilelength $(yq '.files|length' file.yaml)
