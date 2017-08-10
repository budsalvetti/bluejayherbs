define(['angular'],function(angular){
	'use strict';
	return angular.module('store.services.storeService',[]).factory('storeService',['$q','$http',function($q,$http){

		  var _findProductsByName = function(productName){
					return $http.get('/store/findProductsByName',{params:{product_name:productName.toLowerCase()}});
			};

		  var _getAllProducts = function(){
				return $http.get('/store/getAllProducts')
			};

		  var _getProductsByHealthCat = function(healthCategoryId){
				return $http.get('/store/getProductsByHealthCategory',{params:{id:healthCategoryId}});
			};

		  var _getProductsBySymptomId = function(symptomId){
				return $http.get('/store/getProductsBySymptomId',{params:{id:symptomId}});
			};

		/**
		 * @function _getProductsByEntries
		 * @description returns entries for symptoms and health categories dropdowns
		 * @private
		 */
		var _getProductsByEntries = function(){

				var deferred = $q.defer();

				$q.all([$http.get('store/getSymptomsList'),$http.get('store/getHealthCategories')]).then(function(response){

					     deferred.resolve({symptomsList:response[0].data,healthCategoriesList:response[1].data});
				});

				return deferred.promise;
			};

		  return {
							findProductsByName:_findProductsByName,
							getAllProducts:_getAllProducts,
							getProductsByEntries:_getProductsByEntries,
			        getProductsByHealthCat:_getProductsByHealthCat,
			        getProductsBySymptomId:_getProductsBySymptomId
			};
	}]);
});
