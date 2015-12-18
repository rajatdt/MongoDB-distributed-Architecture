FROM mongodv5-3

### Script ###
ADD shard-routerd3.sh /shard-routerd3.sh
ADD shard-routerd3.js /shard-routerd3.js

RUN chmod a+x /shard-routerd3.sh

EXPOSE 23000 24000 25000 26000

ENTRYPOINT ["usr/bin/mongos"]