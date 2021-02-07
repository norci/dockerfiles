#!/bin/sh
service ssh start
/usr/bin/code-server --bind-addr 0.0.0.0:8080 --reuse-window
