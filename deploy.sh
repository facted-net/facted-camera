#!/bin/bash
mkdir -p facted_camera_deploy
cp app/build/outputs/apk/app-release-unsigned.apk facted_camera_deploy/facted_camera.apk
cp README.md facted_camera_deploy/README
cp gpl-3.0.txt facted_camera_deploy/LICENSE
OUTPUT=$(ipfs add -q -r facted_camera_deploy | tail -1)
ipfs pin add $OUTPUT
ipfs name publish -k=factedcamerakey $OUTPUT
