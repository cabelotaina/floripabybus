'use strict';

angular.module('ngappApp')
  .controller('MainCtrl', function($scope, Restangular) {
    $scope.mensagem = "Vamo que vamo!"
    Restangular.setBaseUrl("http://127.0.0.1:3000") 
    //Restangular.setDefaultRequestParams('jsonp', {callback: 'JSON_CALLBACK'});
    Restangular.all("lines").getList().then(function() {
     $scope.lines = response;
     console.log("All ok");
     }, function(response) {
     console.log("Error with status code", response.status);
    });
  });
