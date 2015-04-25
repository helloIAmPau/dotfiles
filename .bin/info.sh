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

function current-ssid {
  SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep SSID | grep -v BSSID);
  if [ $? -eq 0 ]; then
    echo $SSID | awk '{ print $2 }';
  else
    echo "WiFi disconnected";
  fi
}

function ipinfos {
  NETADDR=$(ifconfig $1 | grep inet | grep -v inet6);
  if [ $? -eq 0 ]; then
    echo $NETADDR | awk '{ print $2 }';
  else
    echo "Disconnected";
  fi
}

function extip {
  EXT=$(dig +short myip.opendns.com @resolver1.opendns.com);
  if [ $? -eq 0 ]; then
    echo $EXT;
  else
    echo "No internet connection";
  fi

}

function thegw {
  GW=$(route -n get default | grep gateway);
  if [ $? -eq 0 ]; then
    echo $GW | awk '{ print $2 }';
  else
    echo "No gateway defined";
  fi
}

function network {
  echo -e "Network\n   IPs --| Lan  : $(ipinfos en0)\n         | WiFi : $(ipinfos en1)\n   Gateway      : $(thegw)\n   SSID         : $(current-ssid)\n   External IP  : $(extip)"
}

if [ "$1" = 'battery' ]; then
  battery-status;
elif [ "$1" = 'mail' ]; then
  mail-count;
elif [ "$1" = 'net' ]; then
  network;
fi
