define(['jquery','angular','routes','./modules/main'],function($,angular){
    'use strict';
    
    return angular.module('adminApp',['App.Routes','EditProducts']).controller('MainCtrl',['$rootScope',
                        '$scope',
                        '$state',
                        '$stateParams',
                        function($rootScope,$scope,$state,$stateParams){
                        
        
                         window.App = $rootScope.App = {
                            name: 'adminApp'
                         };

                         $rootScope.$on('$stateChangeError', function (event, toState, toParams, fromState, fromParams, error) {
                             if (angular.isObject(error) && angular.isString(error.code)) {
                                debugger;
                                switch (error.code) {
                                case 'UNAUTHORIZED':
                                $state.go('login');
                                }
                            }
                            else {
                                     // unexpected error
                                }
                        });


        
    }]);
    
});
