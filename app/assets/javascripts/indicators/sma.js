angular.module('stocks').service('SMA',[ function() {

  this.calculate = function(data, period) {
    if (data.length < period) {
      return;
    }

    var sum = _.reduce(data, function(memo, historyObj) {
      return memo + parseFloat(historyObj.close);
    }, 0);

    return sum / period;
  };

  this.plottableData = function(historicalData, period) {
    return _.reduce(historicalData, function(memo, data, index, list) {
      if (index < period) {
        return memo;
      }

      // Take the previous X entries
      var subArray = list.slice(index - period, index);

      var mean = this.calculate(subArray, period);

      memo.push([
        Date.parse(data.trade_date),
        mean
      ]);

      return memo;
    }.bind(this), []);
  };
}]);
