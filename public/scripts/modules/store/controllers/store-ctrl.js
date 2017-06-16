define(['angular'],function(angular){

	'use strict';

	return angular.module('store.controllers.storeCtrl',[]).controller('storeCtrl',['$scope', 'storeService', 'productsByEntries',function($scope, storeService, productsByEntries){

		$scope.productsByArr = [{label:'All', value:'all'},
														{label:'Health Category',value:'healthCategory'},
														{label:'Symptom',value:'symptom'}];

		$scope.selectedProductsBy = $scope.productsByArr[0];

		$scope.selectedSymptom = {name:'Select A Symptom',id:null};
		$scope.selectedHealthCategory = {name:'Select A Health Category',id:null};
		$scope.symptomFilter = '';
		$scope.healthCatFilter = '';

		$scope.healthCategoriesList = productsByEntries.healthCategoriesList;

		$scope.symptomsList = productsByEntries.symptomsList;

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
