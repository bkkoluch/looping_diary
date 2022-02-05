#!/bin/sh
mkdir -p $FCI_BUILD_DIR/lib/secrets
echo $KEYS | base64 --decode > $FCI_BUILD_DIR/lib/secrets/keys.dart