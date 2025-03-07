#!/bin/bash
set -e

CERTS_DIR="/etc/nginx/certs"
KEY_FILE="/etc/ssl/private/privkey.pem"
CERT_FILE="/etc/nginx/certs/cert.pem"

echo "🔹 Génération du certificat SSL pour localhost..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$KEY_FILE" -out "$CERT_FILE" \
    -subj "/C=FR/ST=Ile-de-France/L=Paris/O=MyCompany/CN=localhost"

echo "✅ Certificat généré avec succès !"

chmod 600 "$KEY_FILE" "$CERT_FILE"
