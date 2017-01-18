/*global define*/

define(['angular','app','angular-ui-router'], function(angular,app,uirouter){
    
   return angular.module('bluejayherbs.Routes',['ui.router']).config(['$locationProvider','$stateProvider','$urlRouterProvider','$urlMatcherFactoryProvider',function($locationProvider,$stateProvider,$urlRouterProvider,$urlMatcherFactoryProvider){
                                                                
        $locationProvider.html5Mode({enabled:true,requireBase:false}).hashPrefix('!');
        
        $urlMatcherFactoryProvider.strictMode(false);

        
    // url '/home', but you'll never see this state directly
    $stateProvider.state('mainParent', {
                        abstract: true,
                        template: '<ui-view/>'
                        } )
                  .state('home',{
                            parent:'mainParent',
                            url:'/',
                            templateUrl:'views/home.html'
                  }).state('store',{parent:'mainParent',
                                    url:'/store',
                                    templateUrl:'views/store.html',
                                    controller:'storeCtrl'});

        $urlRouterProvider.otherwise('/');
        
    }]);
    
});
