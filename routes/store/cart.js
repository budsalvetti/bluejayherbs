var db = require('../../database_connection');
var express = require('express');
var bodyParser = require('body-parser');
var parseUrlencoded = bodyParser.urlencoded({ extended: false });
var Promise = require('promise');


var router = express.Router();


/**
 * @function CartItem
 * @param productId
 * @param sizePriceId
 * @constructor
 */
var CartItem = function(productId,sizePriceId){

	this.name = '';
	this.quantity = 1;
	this.price = 0;
	this.productId = productId;
	this.size = '';
	this.sizePriceId = sizePriceId;
	this.total = 0;

	this.update = function(){
		return new Promise(function(resolve,reject){

			db.connect(function(err,client,done){
				client.query('select * from retail_size_price where id=$1' ,[this.sizePriceId], function (err, result) {
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

};


/**
 * @function Cart
 * @constructor
 */
var Cart = function(){

	this.items = [];
	this.cartTotal = 0;

	/**
	 * @function addItem
	 * @param productId
	 * @param sizePriceId
	 */
	this.addItem = function(productId,sizePriceId){
		var newItem = new CartItem(productId,sizePriceId);
		this.items.push(newItem);
	};

	/**
	 * @function findItem
	 * @param productId
	 * @param sizePriceId
	 * @returns {cartItem}
	 */
	this.findItem = function (productId, sizePriceId){
		return this.items.filter(function(item){
			return item.productId === productId && item.sizePriceId === sizePriceId;
		})[0];
	};

	/**
	 * @function update
	 * @description updates all items and cart total
	 */
	this.update = function(){
		  //first update the item prices and item totals from the database
		  var itemsLength = this.items.length;
		  var i = 0;
	};

};




/**
 *
 * @param cart
 * @param productId
 * @param sizePriceId
 * @description if the productId and sizePriceId
 * then we know we already have this item in the cart
 * @returns cartItem or undefined
 */
var


router.route('addItem').post( parseUrlEncoded, function(request,response){

	//create cart if there is not one
	if(!request.session.cart){
		request.session.cart = new Cart();
	}

	var cart = request.session.cart;
	var productId = request.body.productid;
	var sizePriceId = request.body.sizepriceid;

	var existingItemInCart = cart.findItem(request.session.cart, productId, sizePriceId);

	//update the quantity if the item is already in the cart
	if(existingItemInCart ){
			existingItemInCart.quantity+= request.body.quantity;
	} else {
		request.session.cart.addItem(productId,sizePriceId);
	}

	cart.update();

	response.status(200);
	response.json(cart);

});



module.exports = router;