bookApp.controller('optionsController', ['$scope', function($scope){

	$scope.$watch('options.value', function() {
        var sortBy = $scope.options || "title asc";
        $scope.getBooksByGenre(undefined,0,12,sortBy);
    });

}]);