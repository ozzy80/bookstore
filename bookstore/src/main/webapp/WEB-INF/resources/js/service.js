bookApp.service('cartService', ['$resource', function($resource){
	return $resource('/bookstore/rest/cart/:id');
}]);