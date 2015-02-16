angular.module('stocks').controller('StocksController', [ '$scope', 'Stock',
  ($scope, Stock)->

    $scope.stockName = 'ORDI.AS'

    $scope.hasResults = ->
      return angular.isDefined($scope.stock) &&
        angular.isDefined($scope.stock.currentPrice)

    $scope.search = ->
      $scope.stock = new Stock($scope.stockName)

      $scope.stock.retrieveHistoricalData()
      $scope.stock.retrievePrice()
])
