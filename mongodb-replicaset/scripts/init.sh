#!/bin/bash

echo "initalize mongo database...."
sleep 3 
mongo mongodb://root:1q2w3e4r@10.0.0.17:27020/admin < /scripts/init.js