#!/usr/bin/env bash

sudo rm -r /etc/nixos/include
sudo cp -r include /etc/nixos
sudo nixos-rebuild --upgrade boot
