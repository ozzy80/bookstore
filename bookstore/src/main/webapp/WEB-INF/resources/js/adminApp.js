var adminApp = angular.module('adminApp', ['angularUtils.directives.dirPagination', 'ngResource', 'ngRoute', 'ngFileUpload', 'uiSwitch']);

adminApp.config(function ($routeProvider) {
    
    $routeProvider
    
    .when('/', {
        templateUrl: '/bookstore/resources/routePages/dashboard.html',
        controller: 'dashboardController'
    })
    
    .when('/knjige', {
        templateUrl: '/bookstore/resources/routePages/bookList.html',
        controller: 'bookController'
    })

    .when('/knjige/dodaj/', {
        templateUrl: '/bookstore/resources/routePages/bookAdd.html',
        controller: 'bookController'
    })

    .when('/autori', {
        templateUrl: '/bookstore/resources/routePages/authorList.html',
        controller: 'authorController'
    })

    .when('/autori/dodaj/', {
        templateUrl: '/bookstore/resources/routePages/author.html',
        controller: 'authorController'
    })

    .when('/autori/izmeni/:id', {
        templateUrl: '/bookstore/resources/routePages/author.html',
        controller: 'authorController'
    })
    
    .when('/izdavaci', {
        templateUrl: '/bookstore/resources/routePages/publisherList.html',
        controller: 'publisherController'
    })

    .when('/izdavaci/dodaj/', {
        templateUrl: '/bookstore/resources/routePages/publisherAdd.html',
        controller: 'publisherController'
    })

    .when('/izdavaci/izmeni/:id', {
        templateUrl: '/bookstore/resources/routePages/publisherAdd.html',
        controller: 'publisherController'
    })

    .when('/zanrovi', {
        templateUrl: '/bookstore/resources/routePages/genreList.html',
        controller: 'genreController'
    })

    .when('/zanrovi/dodaj/', {
        templateUrl: '/bookstore/resources/routePages/genreAdd.html',
        controller: 'genreController'
    })
    
    .when('/zanrovi/izmeni/:id', {
        templateUrl: '/bookstore/resources/routePages/genreAdd.html',
        controller: 'genreController'
    })

    .when('/pisma', {
        templateUrl: '/bookstore/resources/routePages/letterList.html',
        controller: 'letterController'
    })

    .when('/pisma/dodaj/', {
        templateUrl: '/bookstore/resources/routePages/letterAdd.html',
        controller: 'letterController'
    })

    .when('/pisma/izmeni/:id', {
        templateUrl: '/bookstore/resources/routePages/letterAdd.html',
        controller: 'letterController'
    })

    .when('/korisnici', {
        templateUrl: '/bookstore/resources/routePages/userList.html',
        controller: 'userController'
    })

});


adminApp.controller('MyCtrl', ['$scope', 'Upload', '$timeout', function ($scope, Upload, $timeout) {
    $scope.uploadPic = function(file) {
    file.upload = Upload.upload({
      url: '/bookstore/upload',
      fields: {'imageName': $scope.author.firstName + "_" + $scope.author.lastName + "_" + 1 + ".jpg",
               'id': 1},     
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
    };
}]);
