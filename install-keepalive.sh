#!/bin/bash

# Gr33nDrag0n 2021-08-02

tmp=${TMPDIR:-/tmp}/forger-sync.$$

# Capture crontab & delete command if exist
crontab -l | sed '/forger-sync\/keepalive.sh/d' > $tmp

# Add command
echo '*/1 * * * * /bin/bash ~/forger-sync/keepalive.sh > /dev/null 2>&1' >> $tmp

# Write new crontab
crontab < $tmp

# Remove tmp file
rm -f $tmp
