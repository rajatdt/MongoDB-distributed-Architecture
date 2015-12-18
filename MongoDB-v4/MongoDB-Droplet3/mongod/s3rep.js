rs.initiate({
        _id: "shard3",
        members: [
                {_id: 0, host: "10.10.50.10:10000", priority: 1 },
                {_id: 1, host: "10.10.50.20:10001", priority: 2 },
                {_id: 2, host: "10.10.50.30:10002", priority: 3 }
        ]
});
