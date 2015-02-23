angular.module('stocks').directive('lineChart', ['ChartData', 'Indicators', function(ChartData, Indicators) {

  return {
    scope: {
      data:  '=',
      stock: '=',
    },
    templateUrl: 'line-chart-template.html',
    link: function(scope, element) {

      var chart;

      scope.indicators = Indicators.indicators;

      scope.updateChart = function() {
        var enabledIndicators = _.where(scope.indicators, { enabled: true });
        var series = [];
        series.push({ name: 'Price', data: ChartData.priceData(scope.stock) });;

        enabledIndicators.forEach(function(indicator) {
          series.push({ name: indicator.name, data: ChartData.create(scope.stock, indicator) });
        });

        draw(series);
      };

      scope.createChart = function() {
        var series = [];
        series.push({ name: 'Price', data: ChartData.priceData(scope.stock) });;
        draw(series);
      };

      function draw(series) {
        var container = element.find('.chart');
        return container.highcharts('StockChart', {
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
          series: series
        });
      }

      chart = scope.createChart();
    }

  };
}]);
