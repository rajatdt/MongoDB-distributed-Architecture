rs.initiate({
        _id: "S2repset",
        members: [
                {_id: 1, host: "10.10.40.20:10001", priority: 10 },
                {_id: 2, host: "10.10.50.20:10001", priority: 9 },
                {_id: 3, host: "10.10.60.20:10001", priority: 5 }
        ]
});

//rs.addArb("10.10.30.40:10002")