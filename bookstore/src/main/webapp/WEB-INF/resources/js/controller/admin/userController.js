adminApp.controller('userController', ['$scope', 'userService',
      function($scope, userService){
      
   //get all authors   
   $scope.getUsers = function(){
      var data = userService.query({}, function(){
         $scope.userData = data;
      });
   };
   $scope.sort = function(keyname){
        $scope.sortKey = keyname;   
        $scope.reverse = !$scope.reverse; 
    };

    //ban user
    $scope.banUser = function(user, banValue){
      user.enabled = banValue;
        userService.save(user, function(){
          if(banValue){
            alert("Korisnik "+ user.username + " je sklonjen ban");
          } 
          else{
            alert("Korisniu "+ user.username + " je banovan");
          }
       });
    };


    //role
    $scope.addRole = function(user){
       userService.changeRole(user, function(){
          console.log('Dodana privilegija admina');
       });       
    };
    $scope.removeRole = function(user){
       userService.changeRole(user, function(){
        console.log('Uklonjena privilegija admina');
       });       
    };

    $scope.checkRole = function(user){
        var data = userService.getRole({username: user.username}, function(){
          $scope.role = data;
          $scope.admin = $scope.role.authority == 'ROLE_ADMIN';
        });
    };


}]);
