define(['angular'],function(angular){

	'use strict';

	return angular.module('store.controllers.storeCtrl',[]).controller('storeCtrl',['$scope', 'storeService', 'cartService', '$uibModal', 'productsByEntries',function($scope, storeService, cartService, $uibModal, productsByEntries){

		$scope.searchingProducts = false;
		$scope.productSearchResults = [];

		var defaultSelectedSymptom = {name:'Select A Symptom',id:null};
		$scope.selectedSymptom = defaultSelectedSymptom;

		var defaultSelectedHealthCategory = {name:'Select A Health Category',id:null};
		$scope.selectedHealthCategory = defaultSelectedHealthCategory;

		$scope.symptomFilter = '';
		$scope.healthCatFilter = '';
		$scope.productsToBrowse = [];

		$scope.viewProductsBy = "ALL";

		$scope.healthCategoriesList = productsByEntries.healthCategoriesList;

		$scope.symptomsList = productsByEntries.symptomsList;


		/**
		 * @function addToCart
		 * @description fired from add to cart button
		 * on modal
		 *
		 * fires 'CART_ITEM_ADDED' event listened to by
		 * shopping cart directive
		 */
		var addToCart = function(itemData){
			var item = {};

			item.productid = itemData.product.productID;
			item.sizepriceid = itemData.sizePrice.id;
			item.name = itemData.product.name;
			item.quantity = 1;

			cartService.addItem(item).then(function addToCartSuccess(response){
				$scope.$broadcast("CART_ITEM_ADDED", response.data);
			});
		};

		/**
		 * @function getAllProducts
		 */
		var getAllProducts = function(){
			storeService.getAllProducts().then(function(response){
				$scope.productsToBrowse = response.data;
			});
		};

		/**
		 * @function getProductsBySymptomId
		 * @param symptomId
		 */
		var getProductsBySymptomId = function(symptomId){
			storeService.getProductsBySymptomId(symptomId).then(function(response){
				$scope.productsToBrowse = response.data;
			});
		};

		/**
		 * @function getProductsByHealthCatId
		 * @param healthCategoryId
		 */
		var getProductsByHealthCatId = function(healthCategoryId){
			storeService.getProductsByHealthCat(healthCategoryId).then(function(response){
				$scope.productsToBrowse = response.data;
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
					//we will set a new attibute 'checked' on this object
					$scope.selectedItem = $scope.chosenProduct.size_prices[0];
					$scope.selectedItem["checked"] = true;
					$scope.selectedItem.quantity = 1;

					$scope.ok = function () {
						$uibModalInstance.close({sizePrice:$scope.selectedItem,product:$scope.chosenProduct});
					};

					$scope.selectItem = function(sizePriceObj){
						$scope.selectedItem["checked"] = false;
						$scope.selectedItem = sizePriceObj;
						$scope.selectedItem["checked"] = true;
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

		/**
		 * @function viewAllProducts
		 * @description click handler for view all button
		 **/
		$scope.viewAllProducts = function(){
			$scope.viewProductsBy = "ALL";
			$scope.selectedSymptom = defaultSelectedSymptom;
			$scope.selectedHealthCategory = defaultSelectedHealthCategory;
			getAllProducts();
		};

		/**
		 * @function selectHealthCategory
		 * @description change handler for health category dropdown
		 **/
		$scope.selectHealthCategory = function(healthCategory){
			$scope.viewProductsBy = 'HEALTH_CATEGORY';
			$scope.selectedHealthCategory = healthCategory;
			$scope.selectedSymptom = defaultSelectedSymptom;
			getProductsByHealthCatId(healthCategory.id);
		};

		/**
		 * @function selectSymptom
		 * @description change handler for symptom select dropdown
		 **/
		$scope.selectSymptom = function(symptom){
			$scope.viewProductsBy = "SYMPTOM";
			$scope.selectedSymptom = symptom;
			$scope.selectedHealthCategory = defaultSelectedHealthCategory;
			getProductsBySymptomId(symptom.id);
		};

		/**
		 * function init
		 * first we will get all products
		 */
		var init = function(){
			getAllProducts();
		};

		init();

	}]);

});
