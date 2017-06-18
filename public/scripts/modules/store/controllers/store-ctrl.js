define(['angular'],function(angular){

	'use strict';

	return angular.module('store.controllers.storeCtrl',[]).controller('storeCtrl',['$scope', 'storeService', 'cartService', '$uibModal', 'productsByEntries',function($scope, storeService, cartService, $uibModal, productsByEntries){

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
		$scope.productsToBrowse = [];

		$scope.healthCategoriesList = productsByEntries.healthCategoriesList;

		$scope.symptomsList = productsByEntries.symptomsList;


		/**
		 * @function addToCart
		 * @description fired from add to cart button
		 * on modal
		 */
		var addToCart = function(itemData){
			var item = {};

			item.productid = itemData.product.productID;
			item.sizepriceid = itemData.sizePrice.id;
			item.name = itemData.product.name;
			item.quantity = 1;

			cartService.addItem(item).then(function addToCartSuccess(cart){

				alert(JSON.stringify(cart));

			});
		};

		/**
		 * @function showChosenProduct
		 * @description opens a modal so the user can add to cart
		 */
		$scope.showChosenProduct = function(product){

			var modalInstance = $uibModal.open({
				animation: true,
				ariaLabelledBy: 'modal-title',
				windowClass:'bluejay-modal',
				size:'lg',
				ariaDescribedBy: 'modal-body',
				templateUrl: '/scripts/modules/store/views/addToCartModal.html',
				controller: ['$scope','$uibModalInstance','chosenProduct',function ($scope, $uibModalInstance, chosenProduct) {

					$scope.chosenProduct = chosenProduct;

					//set the selectedItem initially to the first element
					//this covers the case where there is only one size_price
					$scope.selectedItem = $scope.chosenProduct.size_prices[0];

					$scope.ok = function () {
						$uibModalInstance.close({sizePrice:$scope.selectedItem,product:$scope.chosenProduct});
					};

					$scope.selectItem = function(sizePriceObj){
						$scope.selectedItem = sizePriceObj;
					};

					$scope.cancel = function () {
						$uibModalInstance.dismiss('cancel');
					};
				}],
				resolve: {
					chosenProduct: function () {
						return product;
					}
				}
			});

			modalInstance.result.then(function (itemData) {
				addToCart(itemData);
			});

		};

		/**
		 * @function searchProductsByName
		 * @param productName
		 */
		$scope.searchProductsByName = function(productName){

			$scope.searchingProducts = true;

			return storeService.findProductsByName(productName).then(function(response){

				$scope.searchingProducts = false;

				   if(response.data.length){
						 return response.data;
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
