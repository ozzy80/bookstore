bookApp.controller('registerValidationController',['$scope',  'registerService',function($scope,registerService){

	$scope.submitForm = function() 
	{
		if($scope.registerForm.$valid)
			{
				$scope.userData = new registerService;
				$scope.userData.user = $scope.user;
				registerService.save($scope.user,function(){
					alert('Snimljeno!!!');
				})
				console.log($scope.user);
				alert('Forma je uspešno popunjena!');
			}
	};


	$scope.kopiraj = function(sa)
	{ 	
		$scope.user.shippingAddress = {};
		$scope.user.shippingAddress.streetName = $scope.user.billingAddress.streetName;
		$scope.user.shippingAddress.apartmentNumber = $scope.user.billingAddress.apartmentNumber;
		$scope.user.shippingAddress.city = $scope.user.billingAddress.city;
		$scope.user.shippingAddress.state = $scope.user.billingAddress.state;
		$scope.user.shippingAddress.country = $scope.user.billingAddress.country;
		$scope.user.shippingAddress.postalCode = $scope.user.billingAddress.postalCode;
	}
	
}]);