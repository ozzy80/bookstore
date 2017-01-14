bookApp.service('cartService', ['$resource', function($resource){
	return $resource('/bookstore/rest/cart/:id', {id: "@id"}, {
      removeBook: {
         url: '/bookstore/rest/cart/remove/:isbn',
         method: 'DELETE',
         isArray:false
      }
   });
}]);

bookApp.service('topBookService', ['$resource', function($resource){
   return $resource("/bookstore/topbooks/:id", {id: "@id"});
}]);

bookApp.service('bookService', ['$resource', function($resource){
   return $resource("/bookstore/books/new", {}, {
      getAutocomplete: {
         method: 'GET',
         url: '/bookstore/books/autocomplete',
         isArray: true
      },
      getBookByGenre: {
         method: 'GET',
         url: '/bookstore/books/genre',
         isArray: true
      }
   });
}]);

bookApp.service('genreService', ['$resource', function($resource){
   return $resource("/bookstore/genres/:id", {id: "@id"}, {
   });
}]);
