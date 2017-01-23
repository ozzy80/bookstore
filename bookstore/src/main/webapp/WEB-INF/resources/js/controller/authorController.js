bookApp.controller('authorController', ['$scope','authorService',function($scope,authorService){
	
	
		
		$scope.getBooksByAuthor = function(id){
			var data = authorService.getBooksByAuthor({id: id}, function(){
				
				$scope.bookList = data;
				console.log($scope.bookList);
				
			});
		};
  
}]);
