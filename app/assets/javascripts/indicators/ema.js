angular.module('stocks').service('EMA',['SMA', function(SMA) {

  this.calculate = function(data, period) {
    if (data.length < period) {
      return;
    }

    if (data.length === period) {
      return SMA.calculate(data, period);
    }

    var multiplier = 2 / ( period + 1)
    var pointToday = data.pop();
    var previousEMA = this.calculate(data, period);

    return (parseFloat(pointToday.close) - previousEMA) * multiplier + previousEMA;
  };
}]);
