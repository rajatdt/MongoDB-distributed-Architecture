FROM mongodv2

### Script ###
ADD shard-routerd1.sh /shard-routerd1.sh
ADD shard-routerd1.js /shard-routerd1.js

RUN chmod a+x /shard-routerd1.sh

EXPOSE 23000 24000 25000 26000

ENTRYPOINT ["usr/bin/mongos"]