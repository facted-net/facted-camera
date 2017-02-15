#!/bin/bash
mkdir -p facted_camera_publish
cp app/build/outputs/apk/app-release-unsigned.apk facted_camera_publish/facted_camera.apk
cp README.md facted_camera_publish/README
cp gpl-3.0.txt facted_camera_publish/LICENSE
OUTPUT=$(ipfs add -q -r facted_camera_publish | tail -1)
ipfs pin add $OUTPUT
ipfs name publish -k=~/keys/facted-camera-key-rsa4096.key $OUTPUT
