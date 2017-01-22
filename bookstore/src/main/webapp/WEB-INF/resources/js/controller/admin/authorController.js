adminApp.controller('authorController', ['$scope', 'authorService', '$routeParams', 'Upload', '$timeout',
      function($scope, authorService, $routeParams, Upload, $timeout){
      
   //get all authors   
   $scope.getAuthors = function(){
      var data = authorService.query({}, function(){
         $scope.authorData = data;
      });
   };
   $scope.sort = function(keyname){
        $scope.sortKey = keyname;   
        $scope.reverse = !$scope.reverse; 
    };

    
    //delete
    $scope.deleteAuthor = function(author){
      if(confirm("Da li ste sigurni da zelite da obrisete " + author.firstName + "?")){
        authorService.delete({id: author.authorId}, function(){
          var index=$scope.authorData.indexOf(author);
          $scope.authorData.splice(index,1);        
        });
      }
    };





  //edit
    $scope.editAuthorInit = function(){
       var id = $routeParams.id;
       var data = authorService.get({id: id}, function(){
          $scope.author = data;
       });
    };


    //add
    $scope.addAuthor = function(){
      //update slike
      var id;
      if($scope.author.authorId != undefined){
        if($scope.picFile !== undefined && $scope.picFile !== null){
           authorService.deletePicture({id: $scope.author.authorId}, function(){
              var id = authorService.save($scope.author, function(){
                  uploadPic($scope.picFile, $scope.author.firstName + "_" + $scope.author.lastName + "_" + id.id + ".jpg", id.id);
                  alert("Uspesno snimljen autor");
                  window.location.href = "#/autori";
              });
           });
        } else {
          id = authorService.save($scope.author, function(){
                  alert("Uspesno snimljen autor");
                  window.location.href = "#/autori";
              });
        }
      } else {
          id = authorService.save($scope.author, function(){
            uploadPic($scope.picFile, $scope.author.firstName + "_" + $scope.author.lastName + "_" + id.id + ".jpg", id.id);
            alert("Uspesno snimljen autor");
            window.location.href = "#/autori";
        });
      }
    };

    function uploadPic(file, imgName, authorId){
       file.upload = Upload.upload({
         url: '/bookstore/admin/upload',
         fields: {'imageName': imgName, 'id': authorId},     
         file: file
       });

       file.upload.then(function (response) {
         $timeout(function () {
           file.result = response.data;
         });
       }, function (response) {
         if (response.status > 0)
           $scope.errorMsg = response.status + ': ' + response.data;
       }, function (evt) {
         // Math.min is to fix IE which reports 200% sometimes
         file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
       });
    }

    if($routeParams.id){
      $scope.editAuthorInit();
    } 
}]);
