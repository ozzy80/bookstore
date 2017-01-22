adminApp.service('authorService', ['$resource', function($resource){
   return $resource("/bookstore/admin/authors/:id", {id: "@id"}, {
      deletePicture: {
         url: '/bookstore/admin/deletepicture',
         method: 'GET',
         isArray: false
      }
   });
}]);

adminApp.service('publisherService', ['$resource', function($resource){
   return $resource("/bookstore/admin/publishers/:id", {id: "@id"});
}]);

adminApp.service('genreService', ['$resource', function($resource){
   return $resource("/bookstore/admin/genres/:id", {id: "@id"},{
      getGenres: {
         url: '/bookstore/genres',
         method: 'GET',
         isArray: true
      }
   });
}]);

adminApp.service('letterService', ['$resource', function($resource){
   return $resource("/bookstore/admin/letters/:id", {id: "@id"});
}]);

adminApp.service('userService', ['$resource', function($resource){
   return $resource("/bookstore/admin/users/:id", {id: "@id"},{
      changeRole: {
         url: '/bookstore/admin/users/role',
         method: 'POST',
         isArray: false
      },
      getRole: {
         url: '/bookstore/admin/users/role/:username',
         method: 'GET',
         isArray: false
      }
   });
}]);

adminApp.service('cartService', ['$resource', function($resource){
   return $resource("/bookstore/admin/letters/:id", {id: "@id"}, {
      getOrdersNumber: {
         url: '/bookstore/admin/cartnumber',
         method: 'GET',
         isArray: true
      }
   });
}]);

adminApp.service('bookService', ['$resource', function($resource){
   return $resource("/bookstore/admin/letters/:id", {id: "@id"}, {
      getBooksNumber: {
         url: '/bookstore/admin/books/booknumber',
         method: 'GET'
      }
   });
}]);
