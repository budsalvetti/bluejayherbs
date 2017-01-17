var db = require('../../database_connection');
var express = require('express');
var bodyParser = require('body-parser');
var parseUrlEncoded = bodyParser.urlencoded({ extended: false });


var router = express.Router();

var CartItem = function(name,productId,sizePriceId,quantity){

   this.name = name;
   this.quantity = quantity || 1;
   this.price = 0;
   this.productId = productId;
   this.size = '';
   this.sizePriceId = sizePriceId;

   this.update = function(){

     var _this = this;

      return new Promise(function(resolve,reject){
         db.connect(function(err,client,done){
            client.query('select * from retail_size_price where id=$1',[_this.sizePriceId], function (err, result) {
               done();
               if (err) {
                  reject(err);
               }else{
                 _this.size = result.rows[0].size;
                 _this.price = Number(result.rows[0].price);
                 _this.total = _this.price * _this.quantity;
                  resolve(_this);
               }
            });
         });
      });
   };

};


var Cart = function(){

   this.items = [];
   this.cartTotal = 0;

    this.addItem = function(name,productId,sizePriceId,quantity){
      var newItem = new CartItem(name,productId,sizePriceId,quantity);
      this.items.push(newItem);
   };

   this.findItem = function (productId, sizePriceId){
      return this.items.filter(function(item){
         return item.productId === productId && item.sizePriceId === sizePriceId;
      })[0];
   };

   this.update = function(){

      //zero out the total
      this.cartTotal = 0;
      var i = 0;

      var _this = this;

      return new Promise(function(resolve,reject){

              if(_this.items.length){

                 var recurseUpdate = function(){

                    _this.items[i].update().then(function(updatedItem){
                         _this.cartTotal += updatedItem.total;
                         if(i < _this.items.length -1){
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
      request.session.cart =  JSON.encode(new Cart());
   }

   var cart = JSON.parse(request.session.cart);
   var productId = Number(request.body.productid);
   var sizePriceId = Number(request.body.sizepriceid);
   var name = request.body.name;
   var quantity = Number(request.body.quantity);

   var existingItemInCart = cart.findItem(productId, sizePriceId);

   //update the quantity if the item is already in the cart
   if(existingItemInCart ){
      existingItemInCart.quantity += quantity;
   } else {
      cart.addItem(name,productId,sizePriceId,quantity);
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
