FROM mongod

### Script ###
ADD shard-routerd2.sh /shard-routerd2.sh
ADD shard-routerd2.js /shard-routerd2.js

RUN chmod a+x /shard-routerd2.sh

EXPOSE 23000 24000 25000 26000

ENTRYPOINT ["usr/bin/mongos"]
