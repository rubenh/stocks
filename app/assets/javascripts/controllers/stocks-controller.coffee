angular.module('stocks').controller('StocksController', [ '$scope', '$resource',
  ($scope, $resource)->

    $scope.stockName = 'ORDI.AS'

    $scope.hasResults = ->
      angular.isDefined($scope.stockInfo)

    $scope.search = ->
      query = $resource('/stocks/', { format: 'json', stocks: $scope.stockName })

      query.save({}, (data) ->
        $scope.stockInfo = data
      )
])
