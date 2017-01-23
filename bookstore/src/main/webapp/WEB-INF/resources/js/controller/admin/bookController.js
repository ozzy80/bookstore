adminApp.controller('bookController', ['$scope', 'bookService', '$routeParams', 'Upload', '$timeout', 'publisherService',
      function($scope, bookService, $routeParams, Upload, $timeout, publisherService){
      
   //get all authors   
   $scope.getBooks = function(){
      var data = bookService.query({}, function(){
         $scope.booksData = data;
      });
   };
   $scope.sort = function(keyname){
        $scope.sortKey = keyname;   
        $scope.reverse = !$scope.reverse; 
    };

    
    




  //edit
    $scope.editAuthorInit = function(){
       var id = $routeParams.id;
       var data = authorService.get({id: id}, function(){
          $scope.author = data;
       });
    };










    //add
    $scope.addBook = function(){
      //update slike
       var id = bookService.save($scope.book, function(){
         uploadPic($scope.picFile, "//" + $scope.book.title + "-" + $scope.book.isbn + ".jpg", $scope.book.publisher.name);
         alert("Uspesno snimljen autor");
         window.location.href = "#/knjige";
        });
    };

    function uploadPic(file, imgName, publisherName){
       file.upload = Upload.upload({
         url: '/bookstore/admin/book/upload',
         fields: {'imageName': imgName, 'publisherName': publisherName},     
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

    //search publisher
    $scope.autocompletePublisher = function(){
      var data = $scope.book.publisher = publisherService.query({q: $scope.book.publisher}, function(){
         $scope.publisherList = data;
         $scope.hidethis = false; 
      });
    };

    $scope.fillPublisherTextbox = function(publisher){  
        $scope.book.publisher = publisher;  
        $scope.publisher.name = publisher.name;
        $scope.hidethis = true;  
    }; 





    if($routeParams.id){
      $scope.editAuthorInit();
    } 

}]);
