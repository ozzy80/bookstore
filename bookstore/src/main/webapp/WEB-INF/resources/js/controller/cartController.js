bookApp.controller('mainController', ['$scope','$log', 'cartService', function($scope, $log, cartService){
	
	var Cart = cartService;

	$scope.refreshCart = function() {
		var data = Cart.get({id : $scope.cartId}, function(){
			$scope.cart = data;
		});
	};

	$scope.clearCart = function(cartId) {
		Cart.remove({id : $scope.cartId}, function(){
			$scope.refreshCart();
		});
	};

	$scope.initCartId = function(cartId) {
		$scope.cartId = cartId;
		$scope.refreshCart();
	};

	$scope.addToCart = function(bookId){
		Cart.save({id : bookId}, function(){
			alert("Book successfully added to the cart");
		});
	};

	$scope.removeFromCart = function(bookId){
		Cart.removeBook({isbn : bookId}, function(){
			$scope.refreshCart();
			alert("Book successfully remove");
		});
	};
	
	$scope.calGrandTotal = function(){
		var grandTotal = 0;
		if($scope.cart){
			for(var i=0; i<$scope.cart.cartItems.length; i++){
				grandTotal += $scope.cart.cartItems[i].totalPrice;
			}
			return grandTotal;
		}
	};

}]);
