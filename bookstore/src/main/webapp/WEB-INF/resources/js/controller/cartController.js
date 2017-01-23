bookApp.controller('mainController', ['$scope','$log', 'cartService', function($scope, $log, cartService){
	
	var Cart = cartService;
	$scope.checkStatus = 1;
	$scope.number = 1;

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
		Cart.saveBook({isbn : bookId, num: $scope.number}, function(){
			alert($scope.number + " knjiga je uspesno dodana na karticu");
		});
	};

	$scope.removeFromCart = function(cartId, cartItemId){
		Cart.removeBook({cartId: cartId, cartItemid : cartItemId}, function(){
			$scope.refreshCart();
			alert("Knjiga je uspesno sklonjena");
		});
	};
	
	$scope.calGrandTotal = function(){
		var grandTotal = 0;
		if($scope.cart){
			for(var i=0; i<$scope.cart.cartItems.length; i++){
				grandTotal += $scope.cart.cartItems[i].price * $scope.cart.cartItems[i].quantity;
			}
			return grandTotal.toFixed(2);
		}
	};

	$scope.changeStatus = function(value){
		if ($scope.cart.cartItems.length < 1) {
			alert('Nemozete da idete dalje sa praznom korpom');
			window.location.href = "/bookstore";
		}
		$scope.checkStatus = value;
		console.log($scope.checkStatus);
	};

	$scope.cleanShippingAdress = function(){
		$scope.cart.shippingAddress = null;
		$scope.cart.user.firstName = null;
		$scope.cart.user.lastName = null;
	};

	$scope.saveCart = function(){
		Cart.saveCart($scope.cart, function(){
			alert("Kartica je uspesno snimljena");
			window.location.href = "/bookstore";
		});
	};

}]);
