/*global define*/

define(['angular','app','angular-ui-router'], function(angular,app,uirouter){
    
   return angular.module('App.Routes',['ui.router']).config(['$locationProvider','$stateProvider','$urlRouterProvider','$urlMatcherFactoryProvider',function($locationProvider,$stateProvider,$urlRouterProvider,$urlMatcherFactoryProvider){
                                                                
        $locationProvider.html5Mode({enabled:true,requireBase:false}).hashPrefix('!');
        
        $urlMatcherFactoryProvider.strictMode(false);
        
        var isLoggedIn = function($q,$http){
            var myDefer = $q.defer();
            
            $http.get("/admin/isLoggedIn",{ withCredentials: true }).then(function(response){
                myDefer.resolve(true);
            },function(){
                var errorObj = {code:'UNAUTHORIZED'};
                myDefer.reject(errorObj);
            });
            
            return myDefer.promise;
        };
        
    // url '/home', but you'll never see this state directly
    $stateProvider.state('adminParent', {
                        abstract: true,
                        template: '<ui-view/>'
                        } )
                  .state('login',{
                            parent:'adminParent',
                            url:'/administrator/login',
                            templateUrl:'views/login.html'
                  }).state('main',{
                      parent:'adminParent',
                      url:'/administrator/main',
                      templateUrl:'views/main.html',
                      resolve:{isLoggedIn:['$q','$http',function($q,$http){
                            return isLoggedIn($q,$http);
                      }]}
                  }).state('edit_products',{
                      parent:'adminParent',
                      url: '/administrator/edit_products',
                      controller:'editProductsCtrl',
                      templateUrl: 'views/edit-products.html',
                        resolve:{isLoggedIn:['$q','$http',function($q,$http){
                            return isLoggedIn($q,$http);
                      }]}
                  });
        
        
        $urlRouterProvider.otherwise('administrator/main');
        
    }]);
    
});
