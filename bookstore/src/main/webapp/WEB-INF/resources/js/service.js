bookApp.factory('pagerService', function(){

  var service = {};

  service.GetPager = GetPager;

  return service;

  // service implementation
  function GetPager(totalItems, currentPage, pageSize) {
      
      // default to first page
      currentPage = currentPage || 1;

      // default page size is 12
      pageSize = pageSize || 12;

      // total pages
      var totalPages = Math.ceil(totalItems / pageSize);

      var startPage, endPage;
      if (totalPages <= 10) {
          // less than 10 total pages so show all
          startPage = 1;
          endPage = totalPages;
      } else {
          // more than 10 total pages so calculate start and end pages
          if (currentPage <= 6) {
              startPage = 1;
              endPage = 10;
          } else if (currentPage + 4 >= totalPages) {
              startPage = totalPages - 9;
              endPage = totalPages;
          } else {
              startPage = currentPage - 5;
              endPage = currentPage + 4;
          }
      }

      // calculate start and end item indexes
      var startIndex = (currentPage - 1) * pageSize;
      var endIndex = Math.min(startIndex + pageSize - 1, totalItems - 1);

      // create an array of pages to ng-repeat in the pager control
      var pages = _.range(startPage, endPage + 1);

      // return object with all pager properties required by the view
      return {
          totalItems: totalItems,
          currentPage: currentPage,
          pageSize: pageSize,
          totalPages: totalPages,
          startPage: startPage,
          endPage: endPage,
          startIndex: startIndex,
          endIndex: endIndex,
          pages: pages
      };
  }
});


bookApp.service('cartService', ['$resource', function($resource){
	return $resource('/bookstore/customer/:id', {id: "@id"}, {
      removeBook: {
         url: '/bookstore/customer/remove/:cartId/:cartItemid',
         method: 'DELETE',
         isArray:false
      },
      saveCart: {
         url: '/bookstore/customer/waitstatus',
         method: 'POST'
      },
      saveBook: {
         url: '/bookstore/customer/',
         method: 'GET'
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
      getNumberOfBooksByGenre: {
        method: 'GET',
         url: '/bookstore/genres/booknumber',
         isArray: false
      }
   });
}]);

bookApp.service('authorService', ['$resource', function($resource){
	   return $resource("/bookstore/authors/:id", {id: "@id"}, {
	      getBooksByAuthor: {
	        method: 'GET',
	         url: '/bookstore/authors/books',
	         isArray: true
	      }
	   });
	}]);


bookApp.service('registerService', ['$resource', function($resource){
   return $resource("/bookstore/register/");
}]);

