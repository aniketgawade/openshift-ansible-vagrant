#!/bin/bash
for a in $(vagrant status | egrep running | awk '{print $1}'); do ip=$(vagrant ssh $a -c "hostname -I | cut -d' ' -f2" 2>/dev/null); echo $a $ip; done
