var myApp = angular.module('myApp', []);

myApp.controller('mainController', ['$scope', '$http', '$log', function($scope, $http, $log){
	
	$scope.refreshCart = function() {
		$http.get("/bookstore/rest/cart/"+$scope.cartId).then(function(data){
			$scope.cart = data;
			console.log($scope.cart.data.cartItems);
		});
	};

	$scope.clearCart = function(cartId) {
		$http.delete("/bookstore/rest/cart/" + $scope.cartId).then($scope.refreshCart());
	};

	$scope.initCartId = function(cartId) {
		$scope.cartId = cartId;
		$scope.refreshCart(cartId);
	};

	$scope.addToCart = function(bookId){
		$http.put("/bookstore/rest/cart/"+bookId).then(function(){
			alert("Book successfully added to the cart");
		});
	};

	$scope.removeFromCart = function(bookId){
		$http.put("/bookstore/rest/cart/remove/"+bookId).then(function(data){
			$scope.refreshCart();
			alert("Book successfully added");
		});
	};
	
	$scope.calGrandTotal = function(){
		var grandTotal = 0;
		
		for(var i=0; i<$scope.cart.cartItems.length; i++){
			grandTotal += scope.cart.cartItems[i].totalPrice;
		}
		
		return grandTotal;
	}

}]);

/*
$http.get("welcome.htm")
    .then(function(response) {
        $scope.myWelcome = response.data;
    });*/