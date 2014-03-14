'use strict';

angular.module('ngappApp')
  .controller('MainCtrl', function($scope, Restangular) {
    Restangular.setBaseUrl('http://localhost:3000');
    var baseAccounts = Restangular.all('lines');

    // This will query /accounts and return a promise.
    baseAccounts.getList().then(function(accounts) {
       $scope.lines = accounts;
       });
  });
