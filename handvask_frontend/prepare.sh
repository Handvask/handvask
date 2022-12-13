#!/bin/bash
touch /app/.env
echo "NEXT_PUBLIC_API_URL=\"$API_URL\"" >> /app/.env