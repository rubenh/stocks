angular.module('stocks').factory('Stock',['$resource', function($resource) {

  function Stock(symbol) {
    this.symbol = symbol;
    this.historicalData = [];
  }

  Stock.prototype = {
    retrieveHistoricalData: function() {
      stockHistory = $resource('stocks/historical',
                               {},
                               { 'save': { method: 'POST', isArray: true }});

      return stockHistory.save({}, { stock: this.symbol }).$promise.then(function(data) {
        return this.historicalData = data;
      }.bind(this));
    },

    retrievePrice: function() {
      stockInfo = $resource('/stocks/info');
      return stockInfo.save({}, { stock: this.symbol }).$promise.then(function(data) {
        return this.currentPrice = data.price;
      }.bind(this));
    }
  };

  return Stock;
}]);
