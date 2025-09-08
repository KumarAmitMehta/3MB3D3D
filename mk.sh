#!/bin/bash

Usage() {
  echo "Usage: $0 [command] [preset]"
  echo
  echo "Commands:"
  echo "  list-configure         List available configure presets"
  echo "  configure <preset>     Run 'cmake --preset <preset>'"
  echo "  list-build             List available build presets"
  echo "  build <preset>         Run 'cmake --build --preset <preset>'"
  echo
  echo "Examples:"
  echo "  $0 list-configure"
  echo "  $0 configure arm-m33-release"
  echo "  $0 list-build"
  echo "  $0 build arm-m33-release-build"
  exit 1
}

if [[ $# -lt 1 ]]; then
  Usage
fi

case $1 in
  list-configure)
    cmake --list-presets
    ;;
  configure)
    if [[ -z $2 ]]; then
      echo "Error: Missing configure preset."
      Usage
    fi
    cmake --preset "$2"
    ;;
  list-build)
    cmake --build --list-presets
    ;;
  build)
    if [[ -z $2 ]]; then
      echo "Error: Missing build preset."
      Usage
    fi
    cmake --build --preset "$2"
    ;;
  *)
    echo "Unknown command: $1"
    Usage
    ;;
esac

