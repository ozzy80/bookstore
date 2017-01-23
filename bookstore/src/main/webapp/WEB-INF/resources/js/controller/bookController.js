bookApp.controller('bookController', ['$scope', 'bookService', '$location', '$rootScope', 'pagerService', 'genreService', '$window',
      function($scope, bookService, $location, $rootScope, pagerService, genreService, $window){
  
  //get books by year of publication
   $scope.getNewBooks = function(sort, start, limit){
      var data = bookService.query({sort: sort, start: start, limit: limit}, function(){
         $scope.newBooks = data;
      });
   };

   
   //autocomplete for search books
   $scope.autocomplete = function(query){
      var data = bookService.getAutocomplete({q: query}, function(){
         $scope.ACBooks = data;
         $scope.hidethis = false; 
      });
   };

   $scope.fillTextbox = function(string, isbn){  
        $scope.bookSearch = string;  
        $scope.hidethis = true;  
        $scope.isbn = isbn;
   }; 

   $scope.goToBook = function(isbn){
      $window.location.href = '/bookstore/books/'+$scope.isbn;
   };


   //search by genre on chagne hash value
   $rootScope.$on('$locationChangeSuccess', function(event){
        var url = decodeURIComponent($location.url().substr(1));
        //if is present param in url
        if(url.length > 0){
            $scope.getBooksByGenre(url, 0, 12);
        }
   });


   $scope.getBooksByGenre = function(genre, start, limit, sortBy){
      if(genre === undefined){
         genre = decodeURIComponent($location.url().substr(1)) || "Drama";
      }
      pagination(genre, start, limit, sortBy);
   };
   
   function pagination(genre, start, limit, sortBy){
        $scope.pager = {};
        $scope.setPage = setPage;       
        initController();

        function initController() {
            // initialize to page 1
            genreService.getNumberOfBooksByGenre({genre: genre}, function(data){
               $scope.numberOfPages = data.number;
               setPage(1);
            });
        }

        function setPage(page) {
            if (page < 1 || page > $scope.pager.totalPages) {
                return;
            }
            $scope.pager = pagerService.GetPager($scope.numberOfPages, page, limit);
            bookService.getBookByGenre({genre: genre, start: $scope.pager.startIndex, limit: limit, sortBy: sortBy}, function(data){
               $scope.BooksByGenreList = data;
            });

        }
   }

}]);
