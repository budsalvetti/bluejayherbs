define(['angular','../module'],function(angular,editProductsModule){
    
    editProductsModule.factory('EditProductsSvc',['$rootScope','$http','$q',function($rootScope,$http,$q){


			/**
			 * @function _getAllProducts
       * @returns {*}
       * @private
       */
      var _getAllProducts = function(){
            
            console.log("admin in getAllProducts");
            
            var myDeferred = $q.defer();
            
            $http.get('/admin/getAllProducts').then(function(response){
                myDeferred.resolve(response);
            })

            return myDeferred.promise;
        };


			/**
       * @function _getAllProductCategories
       * Gets all Product Categories
       * @returns {*}
       */
      var _getAllProductCategories = function(){
            console.log("admin in getAllProductCategories");

            var myDeferred = $q.defer();

            $http.get('/admin/getAllProductCategories').then(function(response){
                myDeferred.resolve(response);
            })

            return myDeferred.promise;
        };


        /**
         * @function _getAllSizePrices
         * Gets all size/price objects for a product category
         * @returns {*}
         */
        var _getAllSizePrices = function(productCategoryId){
            console.log("admin in getAllSizePrices");

            var myDeferred = $q.defer();

            $http.get('/admin/getAllProductCategories?' + productCategoryId).then(function(response){
                myDeferred.resolve(response);
            })

            return myDeferred.promise;
        };


        /**
         * @function _getAllHealthCategories
         * @returns {*}
         * @private
         */
        var _getAllHealthCategories = function(){

            console.log("admin in getAllHealthCategories");

            var myDeferred = $q.defer();

            $http.get('/admin/getAllHealthCategories').then(function(response){
                myDeferred.resolve(response);
            })

            return myDeferred.promise;
        };


        /**
         * @function _getAllSymptoms
         * @returns {*}
         * @private
         */
        var _getAllSymptoms = function(){

            console.log("admin in getAllSymptoms");

            var myDeferred = $q.defer();

            $http.get('/admin/getAllSymptoms').then(function(response){
                myDeferred.resolve(response);
            })

            return myDeferred.promise;
        };




        /**
         * @function _getAllSymptoms
         * @returns {*}
         * @private
         */
        var _deleteProduct = function(productId){
            console.log("in delete product");
        };
        
        
        return{
            getAllProducts:_getAllProducts,
            getAllProductCategories:_getAllProductCategories,
            getAllSizePrices:_getAllSizePrices,
            getAllHealthCategories:_getAllHealthCategories,
            getAllSymptoms:_getAllSymptoms,
            deleteProduct:_deleteProduct
        };
        
    }]);
});
