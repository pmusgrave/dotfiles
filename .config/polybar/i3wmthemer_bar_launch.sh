#!/bin/env sh

pkill polybar

sleep 1;

polybar i3wmthemer_bar &
polybar i3wmthemer_bar_second_monitor &
