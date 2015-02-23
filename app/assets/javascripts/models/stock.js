angular.module('stocks').factory('Stock',['$resource', 'SMA', 'EMA', function($resource, SMA, EMA) {

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
    },

    priceAt: function(date) {
      var matchingPoint = this.getHistoricalPoint(date);
      return matchingPoint.close;
    },

    getHistoricalPoint: function(date) {
      return _.find(this.historicalData, function(dataPoint) {
        return dataPoint.trade_date === date;
      });
    }
  };

  return Stock;
}]);
