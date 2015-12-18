rs.initiate({
        _id: "S3repset",
        members: [
                {_id: 0, host: "10.10.30.30:10002", priority: 5 },
                {_id: 2, host: "10.10.50.30:10002", priority: 10 },
                {_id: 3, host: "10.10.60.30:10002", priority: 9 }
        ]
});


//rs.addArb("10.10.50.40:10002")