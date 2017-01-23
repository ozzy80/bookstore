adminApp.controller('dashboardController', ['$scope', 'cartService', 'bookService', 
      function($scope, cartService, bookService){
            
   $scope.getOrdersNumber = function(){
      var data = cartService.getOrdersNumber({},function(){
         $scope.cartData = data;
      });
   };
  
   $scope.getBooksNumber = function(){
      var data = bookService.getBooksNumber({},function(){
         $scope.bookNumber = data;
      });
   };

   $scope.storn = function(cart){
      cart.status = 'DENIDED';
      cartService.changeCartStatus(cart, function(){
        alert("Karica " + cart.cartId + " je uspesno stornirana");
        var index=$scope.cartData.indexOf(cart);
        $scope.cartData.splice(index,1);  
      });
   };

   $scope.approved = function(cart){
      cart.status = 'APPROVED';
      cartService.changeCartStatus(cart, function(){
        alert("Karica " + cart.cartId + " je uspesno odobrena");
         var index=$scope.cartData.indexOf(cart);
        $scope.cartData.splice(index,1);
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
            alert("Korisnik "+ user.username + " je banovan");
          } 
          else{
            alert("Korisniu "+ user.username + " je sklonjen ban");
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
