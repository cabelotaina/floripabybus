'use strict';

angular.module('ngappApp')
  .controller('LineCtrl', function ($scope,$routeParams, Restangular) {
   Restangular.setBaseUrl('http://localhost:3000');
   var number = $routeParams["number"];
   var bus = Restangular.one("lines", number);
   $scope.bus = bus.get().$object;
   console.log($scope.bus);
  });
