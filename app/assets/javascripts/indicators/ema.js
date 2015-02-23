angular.module('stocks').service('EMA',['SMA', function(SMA) {

  this.calculate = function(data, options) {
    if (data.length < options.period) {
      return;
    }

    if (data.length === options.period) {
      return SMA.calculate(data, options);
    }

    var multiplier = 2 / ( options.period + 1)
    var pointToday = data.pop();
    var previousEMA = this.calculate(data, options);

    return (parseFloat(pointToday.close) - previousEMA) * multiplier + previousEMA;
  };

}]);
