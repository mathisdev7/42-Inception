#!/bin/bash
set -e

CERTS_DIR="/etc/nginx/certs"
CERT_FILE="$CERTS_DIR/cert.pem"
KEY_FILE="$CERTS_DIR/privkey.pem"

echo "🔹 Vérification et création du dossier des certificats..."
mkdir -p "$CERTS_DIR"

echo "🔹 Génération du certificat SSL..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$KEY_FILE" -out "$CERT_FILE" \
    -subj "/C=FR/ST=Ile-de-France/L=Paris/O=MyCompany/CN=localhost"

echo "✅ Certificat généré avec succès !"

if [ -f "$CERT_FILE" ] && [ -f "$KEY_FILE" ]; then
    echo "✅ Certificats présents :"
    ls -l "$CERTS_DIR"
else
    echo "❌ Erreur : les certificats ne sont pas générés !"
    exit 1
fi
