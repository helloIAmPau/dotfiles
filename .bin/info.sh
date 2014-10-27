#!/bin/bash

function battery-status {
  if [ "`uname`" = "Darwin" ]; then
    pmset -g batt | awk 'NR==2 { if ($3 ~ /^cha/) print $3 $2; else print $2; }' | tr ';' ' ';
  else
    acpi | awk '{ if ($3 ~ /^Cha/) print $3 $4; else print $4; }' | tr ',' ' ';
  fi
}

function mail-count {
  PASSWORD=$(security 2>&1 find-generic-password -ga climail | grep password: | awk -F'\"' '{ print $2 }')
  NMAIL=$(curl -u "boemianrapsodi:$PASSWORD" --silent "https://mail.google.com/mail/feed/atom" | grep fullcount | awk -F "<fullcount>|</fullcount>" '{print $2}')
  if [ "$NMAIL" = 0  ]; then
    echo "You have no mail";
  elif [ "$NMAIL" = 1 ]; then
    echo "You have a mail";
  elif [ "$NMAIL" -ge 2 ]; then
    echo "You have $NMAIL mail";
  else
    echo "No connection";
  fi
}

if [ "$1" = 'battery' ]; then
  battery-status;
elif [ "$1" = 'mail' ]; then
  mail-count;
fi
