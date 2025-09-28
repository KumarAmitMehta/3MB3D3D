#!/bin/bash

set -e

echo "Updating package list..."
sudo apt update

echo "Upgrading existing packages..."
sudo apt upgrade -y

echo "Installing Zephyr host dependencies..."
sudo apt install -y --no-install-recommends \
  git cmake ninja-build gperf ccache dfu-util device-tree-compiler wget \
  python3-dev python3-venv python3-tk xz-utils file make gcc gcc-multilib \
  g++-multilib libsdl2-dev libmagic1

echo "Setting up Python virtual environment at ~/zephyrproject/.venv..."
python3 -m venv ~/zephyrproject/.venv
source ~/zephyrproject/.venv/bin/activate

pip install --upgrade pip west

echo "Initializing Zephyr workspace..."
mkdir -p ~/zephyrproject
cd ~/zephyrproject
west init
west update
west zephyr-export

echo "Installing Zephyr SDK with only ARM toolchain..."
west sdk install --toolchains arm-zephyr-eabi

echo "Setup complete. 
echo "Remember to activate the Python virtual environment and zephyr environment before working:"
echo "source ~/zephyrproject/.venv/bin/activate"
echo "source ~/zephyrproject/zephyr/zephyr-env.sh"

