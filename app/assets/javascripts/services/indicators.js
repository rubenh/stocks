angular.module('stocks').service('Indicators',['SMA', 'EMA', 'SafeZone', function(SMA, EMA, SafeZone) {

  this.indicators = [
    { name: 'EMA', clazz: EMA, enabled: false, options: { period: 10 } },
    { name: 'SMA', clazz: SMA, enabled: false, options: { period: 10 } },
    { name: 'Safe zone', clazz: SafeZone, enabled: false, options: { period: 10 } }
  ]
}]);
