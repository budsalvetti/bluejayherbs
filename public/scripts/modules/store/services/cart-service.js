define(['angular'],function(angular){

	'use strict';

	return angular.module('store.services.cartService',[]).factory('cartService',['$http',function($http){

		var _addItem = function(item){
			return $http.post('/store/cart/addItem',item);
		};

		var _getCart = function(){
			return $http.get('/store/cart/getCart');
		};

		var _removeItem = function(item){
			return $http.delete('/store/cart/removeItem/' + item.productId + "/" + item.sizePriceId);
		};

		var _updateItem = function(){
		};

		return {
			addItem:_addItem,
			getCart:_getCart,
			removeItem:_removeItem,
			updateItem:_updateItem
		};

	}]);
});
