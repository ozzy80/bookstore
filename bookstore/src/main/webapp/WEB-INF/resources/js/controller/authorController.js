bookApp.controller('authorController', ['$scope','authorService',function($scope,authorService){
	
	
		
		$scope.getBooksByAuthor = function(id){
			console.log("anka prelepotica");
			var data = authorService.getBooksByAuthor({id: id}, function(){
				
				$scope.bookList = data;
				console.log($scope.bookList);
				
			});
		};
  
}]);
