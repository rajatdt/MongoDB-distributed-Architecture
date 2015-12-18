rs.initiate({
        _id: "S3repset",
        members: [
                {_id: 0, host: "10.10.30.30:10002", priority: 1 },
                {_id: 1, host: "10.10.40.30:10002", priority: 2 }
        ]
});
