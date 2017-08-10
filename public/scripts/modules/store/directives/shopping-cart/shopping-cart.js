define(['angular'], function (angular) {

	return angular.module('store.directives.shoppingCart', []).directive('shoppingCart', function () {
		return {
			templateUrl: 'scripts/modules/store/directives/shopping-cart/template.html',
			restrict: 'E',
			replace: true,
			scope: {
				cartData: '='
			},
			controller:['$scope', function($scope){

				$scope.cartExpanded = false;

				$scope.toggleCartExpanded = function(){
					$scope.cartExpanded = !$scope.cartExpanded;
				};

			}]
		}
	});

});