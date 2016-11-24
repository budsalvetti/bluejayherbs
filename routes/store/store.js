
var db = require('../../database_connection');
var express = require('express');
var bodyParser = require('body-parser');
var parseUrlencoded = bodyParser.urlencoded({ extended: false });

var router = express.Router();

router.route('/getSymptomsList').get(function (request, response) {

	console.log('in /getSymptomsList');

	// to run a query we can acquire a client from the pool,
	// run a query on the client, and then return the client to the pool
	db.connect(function(err, client, done) {

		if(err) {
			return console.error('error fetching client from pool', err);
		}

		client.query("select * from sample_indications", function(err, result) {

			//call `done()` to release the client back to the pool
			done();

			if(err) {
				return console.error('error running query', err);
			}

			console.log(result.rows[0]);

			if(result.rows && result.rows.length){
				response.status(200);
				response.json(result);
			}else{
				response.status(500);
				response.send('There was a problem retrieving symptoms list');
			}
		});

	});

});


module.exports = router;