collection=./Postman_Collections_APIs/$1
environment=./Postman_environment/$2
datafile=./Postman_Collections_APIs/$3
echo "Collection: $collection"
echo "Environment: $environment"
# -z if not exist
if [ -z $3 ]
then
newman run $collection -e $environment --insecure  #v2.2/API-Users.json #v2.2/environment.json
else
echo "File CSV: $datafile"
newman run $collection -e $environment -d $datafile --insecure  #v2.2/API-Users.json #v2.2/environment.json #v2.2/folder/file.csv
fi
