#!/usr/bin/env sh

set -eu

readonly BASE_IMAGE_NAME="ghcr.io/manuel-alvarez-alvarez/demodog"

# Use buildkit to match CI as closely as possible.
export DOCKER_BUILDKIT=1

# Cache the same RFC 3339 timestamp for re-use in all images built in the same batch.
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
GIT_HEAD_REF="$(git show-ref --head --hash ^HEAD)"

do_build() {
  image=$1
  docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --label org.opencontainers.image.created="$BUILD_DATE" \
    --label org.opencontainers.image.source=https://github.com/manuel-alvarez-alvarez/demodog-repository \
    --label org.opencontainers.image.revision="$GIT_HEAD_REF" \
    --push \
    --tag "$BASE_IMAGE_NAME-$image:latest" \
    "./images/$image"
}

do_build "insecure-bank"
