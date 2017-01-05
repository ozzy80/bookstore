var myApp = angular.module('myApp', []);

myApp.controller('mainController', ['$scope', '$http', '$log', function($scope, $http, $log){
	
	$scope.refreshCart = function(cartId) {
		$http.get("/bookstore/rest/cart/"+$scope.cartId).then(function(data){
			$scope.cart = data;
			console.log($scope.cart.data.cartItems);
		});
	};

	$scope.clearCart = function(cartId) {
		$http.delete("/bookstore/rest/cart/" + $scope.cartId).then($scope.refreshCart($scope.cartId));
	};

	$scope.initCartId = function(cartId) {
		$scope.cartId = cartId;
		$scope.refreshCart(cartId);
	};

	$scope.addToCart = function(bookId){
		$http.put("/bookstore/rest/cart/add/"+bookId).then(function(data){
			$scope.refreshCart($http.get('/bookstore/rest/cart/cartId'));
			alert("Book successfully added");
		});
	};

	$scope.removeFromCart = function(bookId){
		$http.put("/bookstore/rest/cart/remove/"+bookId).then(function(data){
			$scope.refreshCart($http.get('/bookstore/rest/cart/cartId'));
			alert("Book successfully added");
		});
	};

}]);

/*
$http.get("welcome.htm")
    .then(function(response) {
        $scope.myWelcome = response.data;
    });*/