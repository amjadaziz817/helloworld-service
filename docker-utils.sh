#!/usr/bin/env bash

set -e

GRADLE_CACHE_ARCHIVE='build-cache/gradle.tar.gz'
GRADLE_CACHE_DIR="$HOME/.gradle/caches/"

function __load_cache {
  mkdir -p "$GRADLE_CACHE_DIR"
  if [ -f "$GRADLE_CACHE_ARCHIVE" ]
  then
  tar -xzf $GRADLE_CACHE_ARCHIVE -C "$GRADLE_CACHE_DIR"
  echo "Extracted $GRADLE_CACHE_ARCHIVE to $GRADLE_CACHE_DIR"
  else
    echo "$GRADLE_CACHE_ARCHIVE not found"
  fi
}

function __save_cache {
  echo "Inside save cache with $GRADLE_CACHE_DIR"
  echo "Home directory ==> ${PWD}, $HOME"
  echo "Inside home"
  ls  -al "$HOME"
  echo "Inside gradle"
  ls  -al "$HOME/.gradle/"
  cd "$HOME/.gradle/"
  ls -al .
  cd "/app"
  echo "Inside gradle/caches"
  ls  -al "$HOME/.gradle/caches/"
  # gzip without timestamps for consistent checksum
  # exclude dynamic files https://docs.travis-ci.com/user/languages/java/#caching
  GZIP=-n tar -czf $GRADLE_CACHE_ARCHIVE --exclude='./modules-2/modules-2.lock' --exclude='./*/plugin-resolution' -C "$GRADLE_CACHE_DIR" .
  md5sum $GRADLE_CACHE_ARCHIVE
  echo "Saved $GRADLE_CACHE_DIR to $GRADLE_CACHE_ARCHIVE"
}

case "$1" in
  load-cache)
    __load_cache
    ;;
  save-cache)
    __save_cache
    ;;
  *)
    echo 'Unknown command'
    exit 1
esac
