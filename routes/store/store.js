
var db = require('../../database_connection');
var express = require('express');
var bodyParser = require('body-parser');
var parseUrlencoded = bodyParser.urlencoded({ extended: false });
var Promise = require('promise');


var router = express.Router();


//all productsCache will just be an object keyed by product id
var allProductsCache = {
	productsById:{},
	productsArray:[]
};


/**
 * @function populateProductsCache
 */
var populateProductsCache = function(){

	/**
	 * getSizePrices
	 * @param productCategoryId
	 * @returns promise
	 */
	var getSizePrices = function(productCategoryId){

		return new Promise(function(resolve,reject){

			db.connect(function dbConnectionClient(err,client,done){

				client.query('select * from retail_size_price where product_category_id=$1' ,[productCategoryId], function (err, result) {

					done();

					if (err) {
						reject(err);
					}else{
						resolve(result);
					}

				});

			});

		});

	};


	return new Promise(function(resolve,reject){

		allProdsPromise = new Promise(function(resolve,reject){

			db.connect(function(err, client, done) {
				if(err) {
					return console.error('error fetching client from pool', err);
				}

				client.query('select * from products order by name',function(err, queryResult){

					done();

					if (err) {
						reject(err);
					}else{
						resolve(queryResult);
					}
				});
			});

		}).then(function(queryResult){

			var i = 0;

			if(Array.isArray(queryResult.rows) && queryResult.rows.length){



				var recursFunc = function(){

					//add prod data keyed by productId
					allProductsCache.productsById[queryResult.rows[i].productID] = queryResult.rows[i];

					getSizePrices(queryResult.rows[i].product_category_id).then(function(sizePrices){

						//add the size_prices array to cached prod data
						allProductsCache.productsById[queryResult.rows[i].productID]["size_prices"] = sizePrices.rows;

						//add sizePrices to the query result row obj
						queryResult.rows[i]["size_prices"] = sizePrices.rows;

						if(i < queryResult.rows.length - 1){
							//recall mysef
							recursFunc(i++);
						}else{
							//now we are done and all size prices for each row
							//have been populated
							allProductsCache.productsArray = queryResult.rows;
							console.log(JSON.stringify(allProductsCache));
							resolve('products are populated');
						}
					},function(err){
						reject('problem populating products');
					});

				};

				//call the recursive function for the first time
				recursFunc();

			}

		});

	});
};


/**
 * getAllProducts
 */
router.route('/getAllProducts').get(function(request,response){
	console.log("in getAllProducts");
	 if(!allProductsCache.productsArray.length){
		 populateProductsCache().then(function(){
			 response.json(allProductsCache.productsArray);
		 });
	 }else{
		 response.json(allProductsCache.productsArray);
	 }
});

/**
 * findProductsByName
 */
router.route('/findProductsByName').get(function(request,response){

	var name = request.query.product_name + '%';
	var current_product_category_id;
	var prodQueryStr = 'select * from products where lower(name) like $1';
	var resultRows = [];
	var i = 0;

	console.log('in /findProductsByName');
	console.log(prodQueryStr);

	/**
	 * getSizePrices
	 * @param productCategoryId
	 * @returns promise
	 */
	var getSizePrices = function(productCategoryId){

		return new Promise(function(resolve,reject){

			db.connect(function dbConnectionClient(err,client,done){

				client.query('select * from retail_size_price where product_category_id=$1' ,[productCategoryId], function (err, result) {

					done();

					if (err) {
						reject(err);
					}else{
						resolve(result);
					}

				});

			});

		});

	};

	var prodsByNamePromise = new Promise(function(resolve,reject){

		console.log('in promise');

		db.connect(function(err, client, done) {
			if(err) {
				return console.error('error fetching client from pool', err);
			}

			client.query(prodQueryStr, [name], function(err, queryResult){

					done();

					if (err) {
						reject(err);
					}else{
						resolve(queryResult);
					}
				});
		});

	}).then(function(queryResult){

		console.log('got the first result');

		var i = 0;

		if(Array.isArray(queryResult.rows) && queryResult.rows.length){

			console.log('query result rows length is ' + queryResult.rows.length);

			var recursFunc = function(){

				getSizePrices(queryResult.rows[i].product_category_id).then(function(sizePrices){

					console.log("in getSizePrices");

					queryResult.rows[i]["size_prices"] = sizePrices.rows;

					if(i < queryResult.rows.length - 1){
						//recall mysef
						recursFunc(i++);
					}else{
						//now we are done and all size prices for each row
						//have been populated
						response.json(queryResult.rows);
					}
				},function(err){
					response.status(500).end();
				});

			};

			//call the recursive function for the first time
			recursFunc();

		} else{
			response.json([]);
		}
	},function(error){
		response.status(500).send(error);
	});

});


/**
 * getSymptomsList
 */
router.route('/getSymptomsList').get(function (request, response) {

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

			if(result.rows && result.rows.length){
				console.log('returning symptoms list');
				response.status(200);
				response.json(result.rows);
			}else{
				response.status(500);
				response.send('There was a problem retrieving symptoms list');
			}
		});
	});
});


/**
 * getProductsBySymptomId
 */
router.route('/getProductsBySymptomId').get(function(request,response){

	var symptomId = request.query.id;
	var current_product_category_id;
	var prodQueryStr = 'select * from products where products."productID" in(select product_id from product_sample_indications where sample_indications_id=$1)';
	var resultRows = [];
	var i = 0;

	/**
	 * getSizePrices
	 * @param productCategoryId
	 * @returns promise
	 */
	var getSizePrices = function(productCategoryId){

		return new Promise(function(resolve,reject){

			db.connect(function dbConnectionClient(err,client,done){

				client.query('select * from retail_size_price where product_category_id=$1' ,[productCategoryId], function (err, result) {

					done();

					if (err) {
						reject(err);
					}else{
						resolve(result);
					}

				});

			});

		});

	};

	prodsBySymtomPromise = new Promise(function(resolve,reject){

		db.connect(function(err, client, done) {
			if(err) {
				return console.error('error fetching client from pool', err);
			}

			client.query(prodQueryStr, [symptomId], function(err, queryResult){

				done();

					if (err) {
						reject(err);
					}else{
						resolve(queryResult);
					}
				});
		});

	}).then(function(queryResult){

		console.log('got the first result');

		var i = 0;

		if(Array.isArray(queryResult.rows) && queryResult.rows.length){

			 var recursFunc = function(){

				 getSizePrices(queryResult.rows[i].product_category_id).then(function(sizePrices){

					 queryResult.rows[i]["size_prices"] = sizePrices.rows;

					 if(i < queryResult.rows.length - 1){
						 //recall mysef
						 recursFunc(i++);
					 }else{
             //now we are done and all size prices for each row
						 //have been populated
						 response.json(queryResult.rows);
					 }
				 },function(err){
					  response.status(500).end();
				 });

			 };

      //call the recursive function for the first time
			recursFunc();

		}
	});

});

/**
 * getProductsByHealthCategory
 */
/**
 * getProductsBySymptomId
 */
router.route('/getProductsByHealthCategory').get(function(request,response){

	var healthCategoryId = request.query.id;
	var prodQueryStr = 'select * from products where products."productID" in(select product_id from product_health_category where health_category_id=$1)';
	var resultRows = [];
	var i = 0;

	/**
	 * getSizePrices
	 * @param productCategoryId
	 * @returns promise
	 */
	var getSizePrices = function(productCategoryId){

		return new Promise(function(resolve,reject){

			db.connect(function dbConnectionClient(err,client,done){

				client.query('select * from retail_size_price where product_category_id=$1' ,[productCategoryId], function (err, result) {

					done();

					if (err) {
						reject(err);
					}else{
						resolve(result);
					}
				});

			});

		});
	};

	prodsByHealthCatPromise = new Promise(function(resolve,reject){

		db.connect(function(err,client,done) {

			if(err) {
				return console.error('error fetching client from pool', err);
			}

			client.query(prodQueryStr, [healthCategoryId], function(err, queryResult){

					done();

					if (err) {
						reject(err);
					}else{
						resolve(queryResult);
					}
				});
		});

	}).then(function(queryResult){

		console.log('got the first result');

		var i = 0;

		if(Array.isArray(queryResult.rows) && queryResult.rows.length){

			var recursFunc = function(){

				getSizePrices(queryResult.rows[i].product_category_id).then(function(sizePrices){

					queryResult.rows[i]["size_prices"] = sizePrices.rows;

					if(i < queryResult.rows.length - 1){
						//recall mysef
						recursFunc(i++);
					}else{
						//now we are done and all size prices for each row
						//have been populated
						response.json(queryResult.rows);
					}
				},function(err){
					response.status(500).end();
				});

			};

			//call the recursive function for the first time
			recursFunc();

		}
	});

});


/**
 * getHealthCategories
 */
router.route('/getHealthCategories').get(function (request, response) {

	// to run a query we can acquire a client from the pool,
	// run a query on the client, and then return the client to the pool
	db.connect(function(err,client,done) {

		if(err) {
			return console.error('error fetching client from pool', err);
		}

		client.query("select * from health_category", function(err, result) {

			//call `done()` to release the client back to the pool
			done();

			if(err) {
				return console.error('error running query', err);
			}

			if(result.rows && result.rows.length){
				console.log('returning health categories');
				response.status(200);
				response.json(result.rows);
			}else{
				response.status(500);
				response.send('There was a problem retrieving health categories');
			}
		});

	});

});

module.exports = router;