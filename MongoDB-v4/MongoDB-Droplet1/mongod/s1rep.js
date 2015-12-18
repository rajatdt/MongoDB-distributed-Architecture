rs.initiate({
        _id: "shard1",
        members: [
                {_id: 0, host: "10.10.30.10:10000", priority: 3 },
                {_id: 1, host: "10.10.30.20:10001", priority: 2 },
                {_id: 2, host: "10.10.30.30:10002", priority: 1 }
        ]
});