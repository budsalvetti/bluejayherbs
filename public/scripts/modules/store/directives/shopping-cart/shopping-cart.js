define(['angular'], function (angular) {

	return angular.module('store.directives.shoppingCart', []).directive('shoppingCart', function () {
		return {
			templateUrl: 'scripts/modules/store/directives/shopping-cart/template.html',
			restrict: 'E',
			replace: true,
			scope: {
			},
			controller:['$scope','cartService', function($scope, cartService){

				$scope.cartExpanded = false;

				$scope.cartData = {};

				$scope.$on('CART_ITEM_ADDED', function(event, cartData){
					 $scope.cartData = cartData;
					$scope.cartExpanded = true;
				});

				$scope.toggleCartExpanded = function(){
					$scope.cartExpanded = !$scope.cartExpanded;
				};


				$scope.removeItem = function(item){
					cartService.removeItem(item).then(function(response){
						  $scope.cartData = response.data;
							alert(item.name + " has been removed from your cart");
					});
				};


				var init = function(){
					cartService.getCart().then(function(response){
						$scope.cartData = response.data;
					})

				};

				init();

			}]
		}
	});

});