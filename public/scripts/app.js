define(['jquery','angular','routes','./modules/main'],function($,angular){
    'use strict';
    
    return angular.module('bluejayherbsApp',['bluejayherbs.Routes',
                                             'store.services.storeService',
                                             'store.services.cartService',
                                             'store.controllers.storeCtrl']).controller('MainCtrl',['$rootScope','$scope','$state', '$stateParams', function($rootScope,$scope,$state,$stateParams){
                        
        
                         window.App = $rootScope.App = {
                            name: 'bluejayherbsApp'
                         };


        
                        alert("in Main controller");
        
    }]);
    
});
