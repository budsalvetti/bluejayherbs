define(['angular'],function(angular){

	'use strict';

	return angular.module('store.services.cartService').factory('cartService',['$http',function($http){

		var _addItem = function(){

		};

		var _removeItem = function(){

		};

		var _updateItem = function(){


		};

		return {
			addItem:_addItem,
			removeItem:_removeItem,
			updateItem:_updateItem
		};

	}]);
});
