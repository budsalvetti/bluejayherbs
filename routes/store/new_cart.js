var db = require('../../database_connection');
var express = require('express');
var bodyParser = require('body-parser');
var parseUrlEncoded = bodyParser.urlencoded({ extended: false });


var router = express.Router();

var CartItem = function(productId,sizePriceId){

   this.name = '';
   this.quantity = 1;
   this.price = 0;
   this.productId = productId;
   this.size = '';
   this.sizePriceId = sizePriceId;

   this.update = function(){

      return new Promise(function(resolve,reject){
         db.connect(function(err,client,done){
            client.query('select * from retail_size_price where id=$1',[this.sizePriceId], function (err, result) {
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


var Cart = function(){

   this.items = [];
   this.cartTotal = 0;

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

      //zero out the total
      this.cartTotal = 0;

      //first update the item prices and item totals from the database
      var itemsLength = this.items.length;
      var i = 0;

      var _this = this;

      return new Promise(function(resolve,reject){

              if(itemsLength > 0){

                 var recurseUpdate = function(){

                    this.items[i].update().then(function(queryResult){
                         var result = queryResult.rows[0];
                         _this.cartTotal += result.price;
                         item.price = result.price;
                         item.total = item.quantity * item.price;
                         if(i < itemsLength -1){
                            recurseUpdate(i++);
                         } else {
                                    resolve('updated successfully');
                                }
                        },
                        function(err){
                            reject('there has been a problem updating the cart');
                        });

                 }

                 recurseUpdate();

              } else {
                resolve('no items in cart');
              }
      });
   };
};


router.route('/addItem').post(parseUrlEncoded,function(request,response){

   //create cart if there is not one
   if(!request.session.cart){
      request.session.cart = new Cart();
   }

   var cart = request.session.cart;
   var productId = request.body.productid;
   var sizePriceId = request.body.sizepriceid;

   var existingItemInCart = cart.findItem(productId, sizePriceId);

   //update the quantity if the item is already in the cart
   if(existingItemInCart ){
      existingItemInCart.quantity += request.body.quantity;
   } else {
      request.session.cart.addItem(productId,sizePriceId);
   }

   cart.update().then(function(){
    response.status(200);
    response.json(cart)
   },function(){
     response.status(500);
     response.json('there was a problem updating the cart');
   });

});


module.exports = router;
