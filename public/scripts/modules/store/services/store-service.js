define(['angular'],function(angular){
	'use strict';
	return angular.module('store.services.storeService').factory('storeService',['$http',function($http){

		  var _getAllProducts = function(){
				return $http.get('/store/getAllProducts')
			};

		  var _getProductsByHealthCat = function(healthCategoryId){
				return $http.get('/store/getProductsByHealthCategory',{id:healthCategoryId});
			};

		  var _getProductsBySymptomId = function(symtomId){
				return $http.get('/store/getProductsBySymptomId',{id:symptomId});
			};

		  return {getAllProducts:_getAllProducts,
			        getProductsByHealthCat:_getProductsByHealthCat,
			        getProductsBySymptomId:_getProductsBySymptomId
			};
	}]);
});
