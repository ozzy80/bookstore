bookApp.controller('genreController', ['$scope', 'genreService', function($scope, genreService){
   
   $scope.getGenres = function(){
      var data = genreService.query(function(){
         $scope.genreList = data;
      });
   };

}]);
