#!/bin/bash

set -e

echo "Updating package list..."
sudo apt-get update

echo "Installing build-essential (includes make, gcc, etc.)..."
sudo apt-get install -y build-essential

echo "Installing cmake and arm-none-eabi-gcc toolchain..."
sudo apt-get install -y cmake gcc-arm-none-eabi

