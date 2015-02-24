angular.module('stocks').service('SMA',[ function() {

  this.calculate = function(data, options) {
    if (data.length < options.period) {
      return;
    }

    var length = data.length;
    var subArray = data.slice(length - options.period, length);

    var sum = _.reduce(subArray, function(memo, historyObj) {
      return memo + parseFloat(historyObj.close);
    }, 0);

    return sum / options.period;
  };

}]);
