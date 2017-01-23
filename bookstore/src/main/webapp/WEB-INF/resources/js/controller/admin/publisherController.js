adminApp.controller('publisherController', ['$scope', 'publisherService', '$routeParams',
      function($scope, publisherService, $routeParams){
      
   //get all authors   
   $scope.getPublishers = function(){
      var data = publisherService.query({}, function(){
         $scope.publisherData = data;
      });
   };
   $scope.sort = function(keyname){
        $scope.sortKey = keyname;   
        $scope.reverse = !$scope.reverse; 
    };

    //add
    $scope.addPublisher = function(){
      publisherService.save($scope.publisher, function(){
        alert("Uspesno dodan izdavac");
        window.location.href = "#/izdavaci";
      });
    };

    //edit
    $scope.editPublisherInit = function(){
       var id = $routeParams.id;
       var data = publisherService.get({id: id}, function(){
          $scope.publisher = data;
       });
    };

    //delete
    $scope.deletePublisher = function(publisher){
      if(confirm("Da li ste sigurni da zelite da obrisete " + publisher.name + "?")){
        publisherService.delete({id: publisher.id});
        var index=$scope.publisherData.indexOf(publisher);
        $scope.publisherData.splice(index,1);  
      }
    };

    if($routeParams.id){
      $scope.editPublisherInit();
    } 

}]);
