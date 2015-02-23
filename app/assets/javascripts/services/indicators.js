angular.module('stocks').service('Indicators',['SMA', 'EMA', function(SMA, EMA) {

  this.indicators = [
    { name: 'EMA', clazz: EMA, enabled: false, options: { period: 10 } },
    { name: 'SMA', clazz: SMA, enabled: false, options: { period: 10 } }
  ]
}]);
