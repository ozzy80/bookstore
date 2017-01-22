adminApp.controller('letterController', ['$scope', 'letterService', '$routeParams',
      function($scope, letterService, $routeParams){
      
   //get all authors   
   $scope.getLetters = function(){
      var data = letterService.query({}, function(){
         $scope.letterData = data;
      });
   };
   $scope.sort = function(keyname){
        $scope.sortKey = keyname;   
        $scope.reverse = !$scope.reverse; 
    };

    //add
    $scope.addLetter = function(){
      letterService.save($scope.letter, function(){
        alert("Uspesno dodano pismo");
        window.location.href = "#/pisma";
      });
    };

    //edit
    $scope.editGenreInit = function(){
       var id = $routeParams.id;
       var data = letterService.get({id: id}, function(){
          $scope.letter = data;
       });
    };

    //delete
    $scope.deleteLetter = function(letter){
      if(confirm("Da li ste sigurni da zelite da obrisete " + letter.letterType + "?")){
        letterService.delete({id: letter.letterID}, function(){
          var index=$scope.letterData.indexOf(letter);
          $scope.letterData.splice(index,1);        
        });
      }
    };


    if($routeParams.id){
      $scope.editGenreInit();
    } 

}]);
