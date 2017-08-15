define(['angular','../module'],function(angular,editProductsModule){
    
    editProductsModule.controller('editProductsCtrl',['EditProductsSvc', '$scope',function(editProductsSvc,$scope){
        
        alert("in edit products controller");
        
        $scope.allProducts = [];
        
        
        var init = function(){
            editProductsSvc.getAllProducts().then(function(productData){
                $scope.allProducts = productData.data.rows;
                
            },function(error){
                
            });
        };
        
        init();
        
    }]);
});
