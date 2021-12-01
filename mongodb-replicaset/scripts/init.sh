#!/bin/bash

echo "initalize mongo database...."
sleep 3 
mongo mongodb://$MONGO_INITDB_ROOT_USERNAME:$MONGO_INITDB_ROOT_PASSWORD@10.0.0.17:27020/admin < /scripts/init.js