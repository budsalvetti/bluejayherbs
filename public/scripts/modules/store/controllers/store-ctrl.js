define(['angular'],function(angular){

	'use strict';

	return angular.module('store.controllers.storeCtrl',[]).controller('storeCtrl',['$scope', 'storeService', 'productsByEntries',function($scope, storeService, productsByEntries){

		$scope.productsByArr = [{label:'All', value:'all'},
														{label:'Health Category',value:'healthCategory'},
														{label:'Symptom',value:'symptom'}];

		$scope.selectedProductsBy = $scope.productsByArr[0];

		$scope.searchingProducts = false;
		$scope.productSearchResults = [];

		$scope.selectedSymptom = {name:'Select A Symptom',id:null};
		$scope.selectedHealthCategory = {name:'Select A Health Category',id:null};
		$scope.symptomFilter = '';
		$scope.healthCatFilter = '';

		$scope.healthCategoriesList = productsByEntries.healthCategoriesList;

		$scope.symptomsList = productsByEntries.symptomsList;

		/**
		 * @function searchProductsByName
		 * @param productName
		 */
		$scope.searchProductsByName = function(productName){

			$scope.searchingProducts = true;

			return storeService.findProductsByName(productName).then(function(response){

				$scope.searchingProducts = false;

				   if(response.data.length){

						 return response.data.map(function(product){
							 return product.name;
						 })
					 }
			});
		};

		$scope.setProductsBy = function(productsBy){
			$scope.selectedProductsBy = productsBy;
		};

		$scope.selectHealthCategory = function(healthCategory){
			$scope.selectedHealthCategory = healthCategory;
		};

		$scope.selectSymptom = function(symptom){
			$scope.selectedSymptom = symptom;
		};



	}]);

});
