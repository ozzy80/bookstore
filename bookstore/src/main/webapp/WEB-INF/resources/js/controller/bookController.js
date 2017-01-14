bookApp.controller('bookController', ['$scope', 'bookService', '$location', '$rootScope',
      function($scope, bookService, $location, $rootScope){
  
   $scope.getNewBooks = function(sort, start, limit){
      var data = bookService.query({sort: sort, start: start, limit: limit}, function(){
         $scope.newBooks = data;
      });
   };


   //Autocomplete
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


   //Search by genre
   $rootScope.$on('$locationChangeSuccess', function(event){
        var url = decodeURIComponent($location.url().substr(1));
        if(url.length > 0){
            $scope.getBooksByGenre(url, 0, 12);
        }
   });

   $scope.getBooksByGenre = function(genre, start, limit){
      if(genre === undefined){
         genre = decodeURIComponent($location.url().substr(1));
      }
      bookService.getBookByGenre({genre: genre, start: start, limit: limit}, function(data){
         $scope.BooksByGenreList = data;
      });
   };


}]);
