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
   return $resource("/bookstore/topbooks/:id", {id: "@id"}, {
      getAutocomplete: {
         method: 'GET',
         url: '/bookstore/books/autocomplete',
         isArray: true
      }
   });
}]);
