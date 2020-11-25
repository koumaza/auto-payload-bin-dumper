#!/usr/bin/env fish

function Usage
# build.fish
#  # Not need arg
#  # But need exported vars:
#  ## $SRCTYPE
#  ## $SRCFILENAME
#  ## $SRCURI
end

function preparation
  mkdir -p ~/dump/img && cd ~/dump
  aria2c -x16 -s20 --max-tries=0 --retry-wait=0 \
    $SRCURI
  cd img
end

function extract
  set cl $PWD
  preparation
  chmod a+rx ~/go/bin/android-ota-payload-extractor||true
  ~/go/bin/android-ota-payload-extractor ../$SRCFILENAME
  cd $cl
end

extract
