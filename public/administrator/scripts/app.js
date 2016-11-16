define(['jquery','angular','routes','./modules/main'],function($,angular){
    'use strict';
    
    return angular.module('adminApp',['App.Routes','EditProducts','services.EndPointService']).controller('MainCtrl',['$rootScope',
                        '$scope',
                        '$state',
                        '$stateParams',
                        'EndPointService',
                        function($rootScope,$scope,$state,$stateParams,endPointService){
                        
        
                         window.App = $rootScope.App = {
                            name: 'adminApp'
                         };
        
                        //set the ip address for any rest operation
                        $rootScope.ipAddress = endPointService.ipAddress;
        
        
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

        
                        alert("in Main controller");

                          debugger;
        
    }]);
    
});
