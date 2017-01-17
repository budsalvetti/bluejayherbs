var express = require('express');
var app = express();

app.use(express.static('./public'));

// begin redis and session storage setup
var redis = require("redis");
var redisClient = redis.createClient();

redisClient.on('connect',function(){
    console.log('redis client connected');
});


//API endpoints
var adminRoutes = require('./routes/admin/admin');
var storeBrowseRoutes = require('./routes/store/store');
var storeCartRoutes = require('./routes/store/new_cart');


var session = require("express-session");
//set up data storage for session
var RedisStore = require("connect-redis")(session);
var redisStoreOptions = {client:redisClient};

app.use(session({store: new RedisStore(redisStoreOptions),
                secret:'whatever',
                resave:true,
                saveUninitialized:true,
                cookie:{secure:false,maxAge:86400000}
}));

//end redis and session storage


//admin routes
app.use('/admin', adminRoutes);

//store browse routes
app.use('/store', storeBrowseRoutes);

//store cart routes
app.use('/store/cart', storeCartRoutes);


app.listen(8080, function () {
  console.log("Running Express on port 8080");
});
