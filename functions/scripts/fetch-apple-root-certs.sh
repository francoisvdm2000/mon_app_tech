#!/usr/bin/env bash
# Télécharge les certificats racine Apple nécessaires à SignedDataVerifier
# (vérification des JWS App Store Server API / Server Notifications V2).
# À relancer si Apple fait tourner ses certificats (rare, mais surveiller
# https://www.apple.com/certificateauthority/).
set -euo pipefail

cd "$(dirname "$0")/../certs"

curl -sSL -o AppleRootCA-G3.cer https://www.apple.com/certificateauthority/AppleRootCA-G3.cer
curl -sSL -o AppleRootCA-G2.cer https://www.apple.com/certificateauthority/AppleRootCA-G2.cer

echo "Certificats téléchargés dans $(pwd) :"
ls -la ./*.cer

echo
echo "Vérification (doit afficher 'Apple Root CA - G3' / 'Apple Root CA - G2') :"
openssl x509 -inform DER -in AppleRootCA-G3.cer -noout -subject
openssl x509 -inform DER -in AppleRootCA-G2.cer -noout -subject
