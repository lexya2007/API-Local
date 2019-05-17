#!/usr/bin/env bash

#create variables
environment=../Postman_environment/v2.1.1/environment.json

#run script for each APIs

# Tu's scripts
# setting_collection=../Postman_Collections_APIs/v2.0/API-Setting.json
# echo "Collection: $setting_collection"
# echo "Environment: $environment"
# newman run $setting_collection -e $environment --insecure

# device_collection=../Postman_Collections_APIs/v2.0/API-DeviceToken.json
# echo "Collection: $device_collection"
# echo "Environment: $environment"
# newman run $device_collection -e $environment --insecure

# history_collection=../Postman_Collections_APIs/v2.0/API-ContactHistory.json
# echo "Collection: $history_collection"
# echo "Environment: $environment"
# newman run $history_collection -e $environment --insecure

# canvas_collection=../Postman_Collections_APIs/v3.0/API-Canvas.json
# echo "Collection: $canvas_collection"
# echo "Environment: $environment"
# newman run $canvas_collection -e $environment --insecure

# project_collection=../Postman_Collections_APIs/v3.0/API-Projects.json
# echo "Collection: $project_collection"
# echo "Environment: $environment"
# newman run $project_collection -e $environment --insecure


# Bi's scripts
# users_collection=../Postman_Collections_APIs/v2.2/API-Users.json
# echo "Collection: $users_collection"
# echo "Environment: $environment"
# newman run $users_collection -e $environment --insecure

file_collection=../Postman_Collections_APIs/v2.2/API-File.json
echo "Collection: $file_collection"
echo "Environment: $environment"
newman run $file_collection -e $environment --insecure

kanban_collection=../Postman_Collections_APIs/v3.0/API-Kanbans.json
echo "Collection: $kanban_collection"
echo "Environment: $environment"
newman run $kanban_collection -e $environment --insecure

objorder_collection=../Postman_Collections_APIs/v2.2/API-ObjOrder.json
echo "Collection: $objorder_collection"
echo "Environment: $environment"
newman run $objorder_collection -e $environment --insecure

settingaccounts_collection=../Postman_Collections_APIs/v2.2/API-SettingAccounts.json
echo "Collection: $settingaccounts_collection"
echo "Environment: $environment"
newman run $settingaccounts_collection -e $environment --insecure

tracking_collection=../Postman_Collections_APIs/v3.0/API-Tracking.json
echo "Collection: $tracking_collection"
echo "Environment: $environment"
newman run $tracking_collection -e $environment --insecure

trash_collection=../Postman_Collections_APIs/v2.2/API-Trash.json
echo "Collection: $trash_collection"
echo "Environment: $environment"
newman run $trash_collection -e $environment --insecure


# Khuong's scripts

#run script send email
node ../SendEmailReport.js