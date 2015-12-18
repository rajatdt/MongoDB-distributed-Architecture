rs.initiate({
        _id: "shard2",
        members: [
                {_id: 0, host: "10.10.40.10:10000", priority: 1 },
                {_id: 1, host: "10.10.40.20:10001", priority: 3 },
                {_id: 2, host: "10.10.40.30:10002", priority: 2 }
        ]
});