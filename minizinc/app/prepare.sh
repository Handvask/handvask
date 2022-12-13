#!/bin/bash
touch /app/.env
echo "API_KEY=\"$API_KEY\"" >> /app/.env
echo "BACKEND_HOST=\"$BACKEND_HOST\"" >> /app/.env
echo "SOLVER_IMAGE=\"$SOLVER_IMAGE\"" >> /app/.env
echo "HOST_URL=\"$HOST_URL\"" >> /app/.env
echo "CACERT=\"$CACERT\"" >> /app/.env
echo "TOKEN=\"$TOKEN\"" >> /app/.env