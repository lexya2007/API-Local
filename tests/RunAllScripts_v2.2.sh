#!/usr/bin/env bash

#create variables
environment=../Postman_environment/v2.2/environment_TestServer.json

#run script for each APIs

# Bi's scripts

# users_collection=../Postman_Collections_APIs/v2.2/API-Users.json
# echo "Collection: $users_collection"
# echo "Environment: $environment"
# newman run $users_collection -e $environment --insecure

# file_collection=../Postman_Collections_APIs/v2.2/API-File.json
# echo "Collection: $file_collection"
# echo "Environment: $environment"
# newman run $file_collection -e $environment --insecure

# kanban_collection=../Postman_Collections_APIs/v2.2/API-Kanbans.json
# echo "Collection: $kanban_collection"
# echo "Environment: $environment"
# newman run $kanban_collection -e $environment --insecure

 objorder_collection=../Postman_Collections_APIs/v2.2/API-ObjOrder.json
 echo "Collection: $objorder_collection"
 echo "Environment: $environment"
 newman run $objorder_collection -e $environment --insecure

# settingaccounts_collection=../Postman_Collections_APIs/v2.2/API-SettingAccounts.json
# echo "Collection: $settingaccounts_collection"
# echo "Environment: $environment"
# newman run $settingaccounts_collection -e $environment --insecure

# tracking_collection=../Postman_Collections_APIs/v2.2/API-Tracking.json
# echo "Collection: $tracking_collection"
# echo "Environment: $environment"
# newman run $tracking_collection -e $environment --insecure

#trash_collection=../Postman_Collections_APIs/v2.2/API-Trash.json
#echo "Collection: $trash_collection"
#echo "Environment: $environment"
#newman run $trash_collection -e $environment --insecure



# Khuong's scripts


#run script send email
node ../SendEmailReport.js