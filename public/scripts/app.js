define(['jquery','angular','routes','./modules/main'],function($,angular){
    'use strict';
    
    return angular.module('bluejayherbsApp',['bluejayherbs.Routes']).controller('MainCtrl',['$rootScope',
                        '$scope',
                        '$state',
                        '$stateParams',
                        function($rootScope,$scope,$state,$stateParams){
                        
        
                         window.App = $rootScope.App = {
                            name: 'bluejayherbsApp'
                         };


        
                        alert("in Main controller");

                          debugger;
        
    }]);
    
});