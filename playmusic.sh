#!/bin/bash

#################################################################
#                                                               #
# Proof of concept program for portable HD radio using a        #
# raspberry pi 3b+ to stream HD on the go without a cell phone  #
# connection.                                                   #
#                                                               #
# Hopefully without using a 3.5mm jack but rather through       #
# bluetooth using a hard coded bluetooth make address           #
#                                                               #
# Control will work via a SB360                                 #
#                                                               #
# They can be purchased via Amazon here                         #
#                                                               #
# https://amzn.com/B00RH29CJO                                   #
#                                                               #
#                                                               #
# Source code neccessory to be compiled and install for this    #
# project to work:                                              #
#                                                               #
# https://github.com/theori-io/nrsc5                            #
#################################################################

#########################################################################################################################################
#                                                                                                                                       #
#  To List                                                                                                                              #
#                                                                                                                                       #  
#  1. Create a list of depencencies eventually                                                                                          #
#  2. Figure out how to connect and transfer out to a bluetooth device give a statically set mac address                                #
#  3. Control said bluetooth device using the play/pause button and use skip                                                            #
#  4  Control said bluetooth device using back and forward bluetooth on the SB360 (presents or jump every .2 Mhz TBD decision in future #
#  5. Create a complete list of depencies for raspbian                                                                                  #
#  etc etc                                                                                                                              #
#                                                                                                                                       #
#########################################################################################################################################

# nrsc5 104.1 0 -f wav -o testing1234.wav  # example of how to dump hdradio to a local file

freq = $1
subchannel = $2

nrsc5 -o - -f wav $freq $subchannel | ffmpeg -i - -ac 2 -ar $AUDIO_RATE -acodec mp3 -threads 4 -strict normal -f rtp "rtp://localhost:1234"

