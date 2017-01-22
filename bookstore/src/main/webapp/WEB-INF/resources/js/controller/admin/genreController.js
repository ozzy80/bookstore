adminApp.controller('genreController', ['$scope', 'genreService', '$routeParams',
      function($scope, genreService, $routeParams){
      
   //get all authors   
   $scope.getGenres = function(){
      var data = genreService.getGenres({}, function(){
         $scope.genreData = data;
      });
   };
   $scope.sort = function(keyname){
        $scope.sortKey = keyname;   
        $scope.reverse = !$scope.reverse; 
    };

    //add
    $scope.addGenre = function(){
      genreService.save($scope.genre, function(){
        alert("Uspesno dodan zanr");
        window.location.href = "#/zanrovi";
      });
    };

    //edit
    $scope.editGenreInit = function(){
       var id = $routeParams.id;
       var data = genreService.get({id: id}, function(){
          $scope.genre = data;
       });
    };

    //delete
    $scope.deleteGenre = function(genre){
      if(confirm("Da li ste sigurni da zelite da obrisete " + genre.genreName + "?")){
        genreService.delete({id: genre.genreID}, function(){
          var index=$scope.genreData.indexOf(genre);
          $scope.genreData.splice(index,1);        
        });
      }
    };


    if($routeParams.id){
      $scope.editGenreInit();
    } 

}]);
