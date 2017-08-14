var db = require('../../database_connection');
var express = require('express');
var bodyParser = require('body-parser');
var parseUrlEncoded = bodyParser.urlencoded({ extended: true });
var jsonParser = bodyParser.json();


var router = express.Router();


//had to move this out of CartItem object because redis won't store
//the functions
var cartItemUpdateCost = function(cartItem){
  var item = cartItem;

    return new Promise(function(resolve,reject){
      db.connect(function(err,client,done){
        client.query('select * from retail_size_price where id=$1',[item.sizePriceId], function (err, result) {
          done();
          if (err) {
            reject(err);
          }else{
            item.size = result.rows[0].size;
            item.price = Number(result.rows[0].price);
            item.total = item.price * item.quantity;
            resolve(item);
          }
        });
      });
    });
};

var cartItemUpdateQuantity = function(cartItem,newQuantity){
   cartItem.quantity = Number(newQuantity);
};

var CartItem = function(name,productId,sizePriceId,quantity){
   this.name = name;
   this.quantity = quantity || 1;
   this.price = 0;
   this.productId = productId;
   this.size = '';
   this.sizePriceId = sizePriceId;
};


//had to move this out of Cart object because redis won't store
//the functions
var cartAddItem = function(cart,name,productId,sizePriceId,quantity){
    var newItem = new CartItem(name,productId,sizePriceId,quantity);
    cart.items.push(newItem);
};

//had to move this out of Cart object because redis won't store
//the functions
var cartFindItem = function (cart, productId, sizePriceId){
  return cart.items.filter(function(item){
    return item.productId === productId && item.sizePriceId === sizePriceId;
  })[0];
};

//had to move this out of Cart because redis won't store javascript functions in session
//resets all prices and totals
//we don't want users setting prices by hacking
var cartUpdate = function(cart){
  //zero out the total
  var myCart = cart;
  myCart.cartTotal = 0;
  var i = 0;

  return new Promise(function(resolve,reject){

    if(myCart.items.length){

      var recurseUpdate = function(){
        cartItemUpdateCost(myCart.items[i]).then(function(updatedItem){
            myCart.cartTotal += updatedItem.total;
            if(i < myCart.items.length -1){
              recurseUpdate(i++);
            } else {
              resolve('updated successfully');
            }
          },
          function(err){
            reject('there has been a problem updating the cart');
          });
      };

      recurseUpdate();

    } else {
      resolve('no items in cart');
    }
  });
};


cartRemoveItem = function(cart, productId, sizePriceId){

  return new Promise(function(resolve,reject){
    var currItem;
    var itemIndex = -1;

    for(var i = 0; i< cart.items.length; i++){
      currItem = cart.items[i];
      if(currItem.productId === Number(productId)  && currItem.sizePriceId === Number(sizePriceId) ){
        itemIndex = i;
        break;
      }
    }

    if(itemIndex > -1){
      cart.items.splice(itemIndex,1);
      cartUpdate(cart).then(function(){
        resolve("Item successfully removed");
      });
    } else {
      reject("Item not found in cart");
    }

  });

};


var Cart = function(){
   this.items = [];
   this.cartTotal = 0;
};


router.route('/addItem').post(jsonParser, function(request,response){

   //create cart if there is not one
   if(!request.session.cart){
      request.session.cart =  new Cart();
   }

   var cart = request.session.cart;
   var productId = Number(request.body.productid);
   var sizePriceId = Number(request.body.sizepriceid);
   var name = request.body.name;
   var quantity = Number(request.body.quantity);


   var existingItemInCart = cartFindItem(cart, productId, sizePriceId);

   //update the quantity if the item is already in the cart
   if(existingItemInCart ){
      existingItemInCart.quantity += quantity;
   } else {
      cartAddItem(cart,name,productId,sizePriceId,quantity);
   }

  //return the complete updated cart data
   cartUpdate(cart).then(function(){
     request.session.cart = cart;
    response.status(200);
    response.json(cart)
   },function(){
     response.status(500);
     response.json('there was a problem updating the cart');
   });

});

router.route('/removeItem/:id/:sizepriceid').delete(function(request,response){

  //create cart if there is not one
  if(!request.session.cart){
    request.session.cart =  new Cart();
  }

  var cart = request.session.cart;

  cartRemoveItem(cart,request.params.id,request.params.sizepriceid).then(function(result){
    response.json(cart);
  },function(error){
    response.status(500);
    response.json(error);
  });

});

router.route('/getCart').get(function(request,response){
  //create cart if there is not one
  if(!request.session.cart){
    request.session.cart =  new Cart();
  }
  response.json(request.session.cart);
});


module.exports = router;
