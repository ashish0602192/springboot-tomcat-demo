#!/bin/bash

APP_URL="http://localhost:8080/springboot-tomcat-demo/actuator/health"
MAX_RETRIES=12
RETRY_INTERVAL=5

echo "========================================="
echo "Application Health Check"
echo "========================================="
echo "URL: $APP_URL"

for ((i=1; i<=MAX_RETRIES; i++))
do
    echo "Attempt $i/$MAX_RETRIES..."

    HTTP_STATUS=$(curl -s -o /tmp/health-response.json -w "%{http_code}" "$APP_URL")

    if [ "$HTTP_STATUS" -eq 200 ]; then

        if grep -q '"status":"UP"' /tmp/health-response.json; then
            echo "SUCCESS: Application is healthy"
            cat /tmp/health-response.json
            exit 0
        fi
    fi

    echo "Application not ready. Waiting $RETRY_INTERVAL seconds..."
    sleep $RETRY_INTERVAL
done

echo "ERROR: Application failed health check"
cat /tmp/health-response.json 2>/dev/null

exit 1
