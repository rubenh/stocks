angular.module('stocks').service('ChartData',[ function() {

  this.create = function(stock, indicator) {
    return _.reduce(stock.historicalData, function(memo, data, index) {
      var date = data.trade_date;

      var subArray = stock.historicalData.slice(0, index);
      var value = indicator.clazz.calculate(subArray, indicator.options);

      if (angular.isDefined(value)) {
        memo.push([Date.parse(date), round(value)]);
      }

      return memo;
    }, []);
  };

  this.priceData = function(stock) {
    return _.reduce(stock.historicalData, function(memo, data) {
      var date = data.trade_date;

      var price = stock.priceAt(date);

      if (angular.isDefined(price)) {
        memo.push([Date.parse(date), round(price)])
      }

      return memo;
    }, []);
  };

  function round(value) {
    return Math.round(value * 100) / 100;
  }

}]);
