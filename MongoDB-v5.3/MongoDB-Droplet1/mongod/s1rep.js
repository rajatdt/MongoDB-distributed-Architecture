rs.initiate({
        _id: "S1repset",
        members: [
                {_id: 0, host: "10.10.30.10:10000", priority: 10 },
                {_id: 1, host: "10.10.40.10:10000", priority: 9 },
                {_id: 2, host: "10.10.50.10:10000", priority: 5 }       
        ]
});

//rs.addArb("10.10.30.40:10000")