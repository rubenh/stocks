angular.module('stocks').directive('lineChart', ['SMA', function(SMA) {

  return {
    scope: {
      data: '=data'
    },
    link: function(scope, element) {

      scope.$watchCollection('data', function(data) {
        if (angular.isDefined(data)) {
          var data = scope.data.map(function(historyRecord) {
            return [Date.parse(historyRecord.trade_date), parseFloat(historyRecord.close)];
          });

          var sma = SMA.plottableData(scope.data, 20);
          console.log(sma);
          element.highcharts('StockChart', {
            title: {
              text: 'Prices',
            },
            xAxis: {
              type: 'datetime'
            },
            yAxis: {
              title: {
                text: 'Price'
              }
            },
            series: [{ name: 'foo',  data: data },
              { name: 'sma', data: sma }]
          });
        }
      });
    }
  };
}]);
