bookApp.controller('mainController', ['$scope', '$http', '$log', 'cartService', function($scope, $http, $log, cartService){
	
	var Cart = cartService;

	$scope.refreshCart = function() {
		console.log("USAO1");
		var data = Cart.get({id : $scope.cartId}, function(){
			$scope.cart = data;
		});
	};

	$scope.clearCart = function(cartId) {
		Cart.$delete({id : $scope.cartId}, function(){
			$scope.refreshCart();
		});
	};

	$scope.initCartId = function(cartId) {
		$scope.cartId = cartId;
		$scope.refreshCart();
	};

	$scope.addToCart = function(bookId){
		$http.put("/bookstore/rest/cart/"+bookId).then(function(){
			alert("Book successfully added to the cart");
		});
	};

	$scope.removeFromCart = function(bookId){
		$http.delete("/bookstore/rest/cart/remove/"+bookId).then(function(data){
			$scope.refreshCart();
			alert("Book successfully remove");
		});
	};
	
	$scope.calGrandTotal = function(){
		var grandTotal = 0;

		/*for(var i=0; i<$scope.cart.data.cartItems.length; i++){
			grandTotal += $scope.cart.data.cartItems[i].totalPrice;
		}
		*/
		return 15;
	};

}]);