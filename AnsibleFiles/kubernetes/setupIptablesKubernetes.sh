#!/bin/sh
for x in 9 8 7 6 5 4 3 2 1 0
do
echo "Setting up pico$x"
ssh pico1-$x 'sudo iptables -P FORWARD ACCEPT'
done
