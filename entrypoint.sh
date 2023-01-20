#!/bin/bash

set -xe

# Start emulator
exec firebase emulators:start --only firestore --export-on-exit=/data/firebase --import=/data/firebase --project "${FIRESTORE_PROJECT_ID}"
