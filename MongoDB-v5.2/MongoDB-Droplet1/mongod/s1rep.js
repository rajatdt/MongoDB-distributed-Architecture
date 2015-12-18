rs.initiate({
        _id: "S1repset",
        members: [
                {_id: 0, host: "10.10.30.10:10000", priority: 3 },
                {_id: 1, host: "10.10.40.10:10000", priority: 2 },
                {_id: 2, host: "10.10.50.10:10000", priority: 1 },
                {_id: 3, host: "10.10.60.10:10000", priority: 0 }
        ]
});
