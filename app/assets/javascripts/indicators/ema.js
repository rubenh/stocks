angular.module('stocks').service('EMA',['SMA', function(SMA) {

  this.calculate = function(data, options) {
    if (data.length < options.period) {
      return;
    }

    if (data.length === options.period) {
      return SMA.calculate(data, options);
    }

    var multiplier = 2 / ( options.period + 1)
    var pointToday = data[data.length - 1];
    var previousEMA = this.calculate(data.slice(0, data.length - 1), options);

    return (parseFloat(pointToday.close) - previousEMA) * multiplier + previousEMA;
  };

}]);
