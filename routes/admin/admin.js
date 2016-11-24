
var db = require('../../database_connection');
var express = require('express');
var bodyParser = require('body-parser');
var parseUrlencoded = bodyParser.urlencoded({ extended: false });

var router = express.Router();

//admin login
router.route('/dologin').post(parseUrlencoded, function (request, response) {
    
     console.log('in /doLogin');
     
     var userName = request.body.user;
     var password = request.body.password;
     
     console.log('in /doLogin');
     console.log('session is');
     console.log(request.session);
     
    // to run a query we can acquire a client from the pool, 
    // run a query on the client, and then return the client to the pool 
    db.connect(function(err, client, done) {
        
        if(err) {
            return console.error('error fetching client from pool', err);
        }
        
        client.query("select * from bluejayusers where name=$1 and pass=$2",[userName,password], function(err, result) {
            
            //call `done()` to release the client back to the pool 
            done();
 
            if(err) {
                return console.error('error running query', err);
             }
        
            console.log(result.rows[0]);
    
            if(result.rows && result.rows.length){
                request.session.isLoggedIn = true;
                request.session.save();
                console.log(request.session);
                response.status(302);
                 response.set({"location": "/administrator"});
                response.send();
            }else{
                request.session.isLoggedIn = false;
                response.status(301);
                response.set({"location": "/administrator"});
                response.send();
            }
        });
  
    });
    
});
  

router.route('/isLoggedIn').get(function(request,response,next){
          console.log('isLoggedIn');
      if(!request.session.isLoggedIn){
            console.log('user is not logged in');
            response.status(401);
            response.send();
      }else{
          response.status(200).send();
      }
});
  
//get landing page options for admin
  router.route('/getLandingPageOptions').get(function(request,response){
          var landingPageOptions = [{label: "Edit Existing Products", value: "edit_existing_products"},
                                    {label:"Add New Product",value:"add_new_project"}];
          return response.json(landingPageOptions);
  });
  

  router.route('/getAllProducts').get(function(request,response){

        db.connect(function(err, client, done) {
        
        if(err) {
            return console.error('error fetching client from pool', err);
        }
        
        client.query("select * from products", function(err, result) {
            done();
 
            if(err) {
                return console.error('error running query', err);
             }
    
            if(result){
                request.session.save();
                response.status(200);
                response.json(result);
                response.send();
            }else if(err){
                response.status(500);
                response.json(err);
                response.send();
            }
        });
  
    });
});
  

module.exports = router;

