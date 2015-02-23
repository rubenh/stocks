angular.module('stocks').service('SMA',[ function() {

  this.calculate = function(data, options) {
    if (data.length < options.period) {
      return;
    }

    var sum = _.reduce(data, function(memo, historyObj) {
      return memo + parseFloat(historyObj.close);
    }, 0);

    return sum / options.period;
  };

}]);
