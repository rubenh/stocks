angular.module('stocks').service('SafeZone',[function() {

  // This still needs the calculation for down trends
  this.calculate = function(data, options) {
    if (data.length < options.period + 1) {
      return;
    }

    return upTrend(data, options.period);
  };

  function upTrend(data, period) {
    var directionalMovement = _.reduceRight(data, function(memo, dataPoint, index, list) {
      if (index < data.length - period) {
        return memo;
      }
      var currentLow = dataPoint.low;
      var previousLow = list[index - 1].low;

      if ((previousLow - currentLow) > 0) {
        memo.total = memo.total + (previousLow - currentLow);
        memo.days++;
      }
      return memo;
    }, { total: 0, days: 0 });

    var DMAverage = directionalMovement.total / directionalMovement.days;
    return data[data.length - 1].low - 2 * DMAverage;
  }
}]);
