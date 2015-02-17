angular.module('stocks').factory('Stock',['$resource', 'SMA', function($resource, SMA) {

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
      var matchingPoint = _.find(this.historicalData, function(dataPoint) {
        return dataPoint.trade_date === date;
      });
      return matchingPoint.close;
    },

    smaAt: function(date, period) {
      var points = this.getDataPointsBefore(date, period);
      return SMA.calculate(points, period);
    },

    getDataPointsBefore: function(date, period) {
      var matchingPoint = _.find(this.historicalData, function(dataPoint) {
        return dataPoint.trade_date === date;
      });

      var index = _.indexOf(this.historicalData, matchingPoint);
      return this.historicalData.slice(index - period, index);
    }
  };

  return Stock;
}]);
