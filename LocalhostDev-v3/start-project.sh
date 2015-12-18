#!/bin/bash
echo "Started Mongod instance"

echo "Nodemon started"
cd /grandsocial/

npm install

nodemon --ignore 'tmp/*' --ext js . start app.js
