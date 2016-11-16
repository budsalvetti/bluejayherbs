define(['angular','../module'],function(angular,editProductsModule){
    
    editProductsModule.factory('EditProductsSvc',['$rootScope','$http','$q',function($rootScope,$http,$q){
        
        
        var getAllProducts = function(){
            
            console.log("in getAllProducts");
            
            var myDeferred = $q.defer();
            
            $http.get('/admin/getAllProducts').then(function(productData){
                myDeferred.resolve(productData);
            })
            
            
            return myDeferred.promise;
            
        };
        
        
        var deleteProduct = function(id){
            console.log("in delete product");
        };
        
        
        return{
            getAllProducts:getAllProducts,
            deleteProduct:deleteProduct
        };
        
    }]);
});
