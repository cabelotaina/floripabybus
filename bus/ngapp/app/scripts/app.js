'use strict';

angular.module('ngappApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'restangular'
])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/line/:number', {
        templateUrl: 'views/line.html',
        controller: 'LineCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });

  });
