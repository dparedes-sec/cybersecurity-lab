#!/bin/bash
# lab-setup.sh
# Starts the full cybersecurity lab environment
# Run from repo root: bash setup/lab-setup.sh

set -e

echo "Starting cybersecurity lab..."
docker-compose -f setup/docker-compose.yml up -d

echo ""
echo "Lab is running:"
echo "  Juice Shop : http://localhost:3000"
echo "  DVWA       : http://localhost:8080  (admin / password)"
echo "  WebGoat    : http://localhost:8888/WebGoat"
echo ""
echo "To stop: docker-compose -f setup/docker-compose.yml down"