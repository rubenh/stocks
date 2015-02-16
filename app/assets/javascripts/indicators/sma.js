angular.module('stocks').service('SMA',[ function() {

  this.plottableData = function(historicalData, period) {
    return _.reduce(historicalData, function(memo, data, index, list) {
      if (index < period) {
        return memo;
      }

      // Take the previous X entries
      var subArray = list.slice(index - period - 1, index - 1);

      var sum = _.reduce(subArray, function(memo, historyObj) {
        return memo + parseFloat(historyObj.close);
      }, 0);

      var mean = sum / period;

      memo.push([
        Date.parse(data.trade_date),
        mean
      ]);

      return memo;
    }, []);
  };
}]);
