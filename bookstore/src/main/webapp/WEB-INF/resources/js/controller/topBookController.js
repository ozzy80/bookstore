bookApp.controller('topBookCotroller', ['$scope', 'topBookService', function($scope, topBookService){
   
   $scope.getTopBookList = function(){
      var books = topBookService.query(function(){
         $scope.topBooks = books;
      });
   };
   
}]);
