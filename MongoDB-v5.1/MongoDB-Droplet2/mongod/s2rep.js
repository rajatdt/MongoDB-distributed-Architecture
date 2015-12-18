rs.initiate({
        _id: "S2repset",
        members: [
                {_id: 0, host: "10.10.30.20:10001", priority: 1 },
                {_id: 1, host: "10.10.40.20:10001", priority: 3 },
                {_id: 2, host: "10.10.50.20:10001", priority: 2 }
        ]
});