#!/bin/bash
# nrsc5 104.1 0 -f wav -o testing1234.wav  # example of how to dump hdradio to a local file

freq = $1                          # frequency in Mhz
subchannel = $2                    # HD subchannel 0, 1, 2, etc - the last one is usually data only
macaddress = "00:11:22:33:44:55"   # example mac address

# Below command line needs to be modified from rtp to bluetooth device (after pairing and etc)
nrsc5 -o - -f wav $freq $subchannel | ffmpeg -i - -ac 2 -ar $AUDIO_RATE -acodec mp3 -threads 4 -strict normal -f rtp "rtp://localhost:1234"
