stocks = angular.module('stocks',['templates','ngRoute','ngResource', 'ngMessages'])

stocks.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

  defaults = $httpProvider.defaults.headers
  defaults.patch = defaults.patch || {}
  defaults.patch['Content-Type'] = 'application/json'

stocks.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: 'index.html'
        controller: 'StocksController'
      )
      .when('/positions',
        templateUrl:  'positions.html'
        controller:   'PositionsController'
      )
])

