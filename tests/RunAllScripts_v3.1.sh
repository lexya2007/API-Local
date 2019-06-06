#!/usr/bin/env bash

#create variables
environment=../Postman_environment/v3.0/environment_123Server.json

#run script for each APIs

# Tu's scripts
#setting_collection=../Postman_Collections_APIs/v3.0/API-Setting.json
#echo "Collection: $setting_collection"
#echo "Environment: $environment"
#newman run $setting_collection -e $environment --insecure
#
#device_collection=../Postman_Collections_APIs/v3.0/API-DeviceToken.json
#echo "Collection: $device_collection"
#echo "Environment: $environment"
#newman run $device_collection -e $environment --insecure
#
#history_collection=../Postman_Collections_APIs/v3.1/API-ContactHistory.json
#echo "Collection: $history_collection"
#echo "Environment: $environment"
#newman run $history_collection -e $environment --insecure
#
#canvas_collection=../Postman_Collections_APIs/v3.1/API-Canvas.json
#echo "Collection: $canvas_collection"
#echo "Environment: $environment"
#newman run $canvas_collection -e $environment --insecure
#
#canvas_collection_share=../Postman_Collections_APIs/v3.1/API-Canvas_share.json
#echo "Collection: $canvas_collection"
#echo "Environment: $environment"
#newman run $canvas_collection_share -e $environment --insecure
#
#project_collection=../Postman_Collections_APIs/v3.1/API-Projects.json
#echo "Collection: $project_collection"
#echo "Environment: $environment"
#newman run $project_collection -e $environment --insecure
#
#project_collection_share=../Postman_Collections_APIs/v3.1/API-Projects_share.json
#echo "Collection: $project_collection"
#echo "Environment: $environment"
#newman run $project_collection_share -e $environment --insecure


# Bi's scripts
#users_collection=../Postman_Collections_APIs/v2.0/API-Users.json
#echo "Collection: $users_collection"
#echo "Environment: $environment"
#newman run $users_collection -e $environment --insecure

file_collection=../Postman_Collections_APIs/v2.0/API-File.json
echo "Collection: $file_collection"
echo "Environment: $environment"
newman run $file_collection -e $environment --insecure

objorder_collection=../Postman_Collections_APIs/v2.0/API-ObjOrder.json
echo "Collection: $objorder_collection"
echo "Environment: $environment"
newman run $objorder_collection -e $environment --insecure

settingaccounts_collection=../Postman_Collections_APIs/v2.0/API-SettingAccounts.json
echo "Collection: $settingaccounts_collection"
echo "Environment: $environment"
newman run $settingaccounts_collection -e $environment --insecure

tracking_collection=../Postman_Collections_APIs/v2.0/API-Tracking.json
echo "Collection: $tracking_collection"
echo "Environment: $environment"
newman run $tracking_collection -e $environment --insecure

trash_collection=../Postman_Collections_APIs/v2.0/API-Trash.json
echo "Collection: $trash_collection"
echo "Environment: $environment"
newman run $trash_collection -e $environment --insecure

cloudstorage_collection=../Postman_Collections_APIs/v2.0/API-CloudStorage.json
echo "Collection: $cloudstorage_collection"
echo "Environment: $environment"
newman run $cloudstorage_collection -e $environment --insecure

kanbans_collection=../Postman_Collections_APIs/v3.1/API-Kanbans.json
echo "Collection: $kanbans_collection"
echo "Environment: $environment"
newman run $kanbans_collection -e $environment --insecure

kanban_collection_share=../Postman_Collections_APIs/v3.1/API-Kanbans-Shared.json
echo "Collection: $kanban_collection_share"
echo "Environment: $environment"
newman run $kanban_collection_share -e $environment --insecure


link_collection=../Postman_Collections_APIs/v3.1/API-Link.json
echo "Collection: $link_collection"
echo "Environment: $environment"
newman run $link_collection -e $environment --insecure

#run script send email
node ../SendEmailReport.js