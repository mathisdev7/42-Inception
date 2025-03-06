#!/bin/bash

CERTS_DIR="./certs"

CERT_FILE="$CERTS_DIR/cert.pem"
KEY_FILE="$CERTS_DIR/privkey.pem"

DAYS_VALID=365
COUNTRY="FR"
STATE="Ile-de-France"
LOCALITY="Paris"
ORG_NAME="MyCompany"
COMMON_NAME="localhost"

mkdir -p "$CERTS_DIR"

openssl req -x509 -nodes -days $DAYS_VALID -newkey rsa:2048 \
    -keyout "$KEY_FILE" -out "$CERT_FILE" \
    -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORG_NAME/CN=$COMMON_NAME"

echo "✅ Certificat SSL généré avec succès !"
echo "📂 Certificat : $CERT_FILE"
echo "🔑 Clé privée : $KEY_FILE"
