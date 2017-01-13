var bookApp = angular.module('bookApp', ['ngResource']);

//Filteri
bookApp.filter('joinBy', function () {
     return function (input, delimiter) {
         return (input || []).join(delimiter || ',');
     };
 });


//Direktive
bookApp.directive('topTenBook', function(){
	return {
		templateUrl: 'resources/directives/top_ten_book.html',
		replace: true,
      scope: {
         bookObject: "=",
         rank: "@"
      },
      link: function($scope, iElm, iAttrs, controller) {
         iElm.bind('error', function() {
                console.log('image missing');
         });  
      }
	};
});

bookApp.directive('book', function(){
   return {
      templateUrl: 'resources/directives/book.html',
      replace: true,
      scope: {
         bookObject: "="
      },
      link: function($scope, iElm, iAttrs, controller) {
         iElm.bind('error', function() {
                console.log('image missing');
         });  
      }
   };
});

