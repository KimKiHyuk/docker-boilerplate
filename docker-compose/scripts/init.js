
rs.initiate(
    {
        "_id" : "demo-replica-set","members" : [
            {"_id" : 0,"host" : "10.0.0.17:27020"},
            {"_id" : 1,"host" : "10.0.0.17:27021"}, 
            {"_id" : 2,"host" : "10.0.0.17:27022"},
            {"_id" : 3,"host" : "10.0.0.17:27023"}
        ]
    });

conf = rs.config();
conf.members[0].priority = 4;
conf.members[1].priority = 3;
conf.members[2].priority = 2;
conf.members[3].priority = 1;


rs.reconfig(conf, {force:true});