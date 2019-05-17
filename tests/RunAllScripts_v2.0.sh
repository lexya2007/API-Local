#!/usr/bin/env bash

#environment variables
environment=../Postman_environment/v2.0/environment.json

#run script for each APIs

# Tu's scripts
project_collection=../Postman_Collections_APIs/v2.0/API-Projects.json
echo "Collection: $project_collection"
echo "Environment: $environment"
newman run $project_collection -e $environment --insecure

canvas_collection=../Postman_Collections_APIs/v2.0/API-Canvas.json
echo "Collection: $canvas_collection"
echo "Environment: $environment"
newman run $canvas_collection -e $environment --insecure

setting_collection=../Postman_Collections_APIs/v2.0/API-Setting.json
echo "Collection: $setting_collection"
echo "Environment: $environment"
newman run $setting_collection -e $environment --insecure

device_collection=../Postman_Collections_APIs/v2.0/API-DeviceToken.json
echo "Collection: $device_collection"
echo "Environment: $environment"
newman run $device_collection -e $environment --insecure

history_collection=../Postman_Collections_APIs/v2.0/API-ContactHistory.json
echo "Collection: $history_collection"
echo "Environment: $environment"
newman run $history_collection -e $environment --insecure


# Bi's scripts



# Khuong's scripts



#run script send email
node ../SendEmailReport.js