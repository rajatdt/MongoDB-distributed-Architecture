FROM mongodv5-2

### Script ###
ADD shard-routerd4.sh /shard-routerd4.sh
ADD shard-routerd4.js /shard-routerd4.js

RUN chmod a+x /shard-routerd4.sh

EXPOSE 23000 24000 25000 26000

ENTRYPOINT ["usr/bin/mongos"]