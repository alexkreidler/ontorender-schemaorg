#!/usr/bin/env bash

echo "Starting Schema download to directory: $1"
wget https://schema.org/version/latest/schemaorg-current-http.ttl -O $1