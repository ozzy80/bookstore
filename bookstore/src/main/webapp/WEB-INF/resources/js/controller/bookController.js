bookApp.controller('bookController', ['$scope', 'bookService', function($scope, bookService){
   $scope.getNewBooks = function(sort, start, limit){
      var data = bookService.query({p: 'item/1'}, function(){
         $scope.newBooks = data;
      });
   };

   $scope.autocomplete = function(query){
      var data = bookService.getAutocomplete({q: query}, function(){
         $scope.ACBooks = data;
         $scope.hidethis = false; 
      });
   };

   $scope.fillTextbox = function(string){  
        $scope.bookSearch = string;  
        $scope.hidethis = true;  
   }; 

}]);
