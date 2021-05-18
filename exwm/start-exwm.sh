#!/bin/sh

# Fire up EXWM
exec dbus-launch --exit-with-session emacs -mm --debug-init
