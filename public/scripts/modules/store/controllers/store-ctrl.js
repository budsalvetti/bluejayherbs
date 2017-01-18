define(['angular'],function(angular){

	'use strict';

	return angular.module('store.controllers.storeCtrl',[]).controller('storeCtrl',['$scope','storeService',function($scope,storeService){

		alert('in storeCtrl');
	}]);

});
