$(document).on('turbolinks:load', function() {
  if ($("#monthly-blance").length > 0) {
    Highcharts.chart('monthly-blance', {
      chart: {
        type: 'line'
      },
      title: {
        text: I18n.t('statistics.line.titles.monthly_blance')
      },
      xAxis: {
        categories: $("#monthly-blance").data('category')
      },
      yAxis: {
        title: {
          text: I18n.t('statistics.line.y_axis')
        }
      },
      tooltip: {
        formatter: function () {
          return '<strong>' + this.key + '</strong>' + ' <br/>' +
            this.series.name + ': ' + '<strong>' + I18n.l("currency", this.y) + '</strong>';
        }
      },
      plotOptions: {
        line: {
          dataLabels: {
            enabled: true,
            formatter: function () {
              return '<strong>' + I18n.l("currency", this.y) + '</strong>';
            }
          }
        }
      },
      series: eval("(" + $("#monthly-blance").data('statistics').replace(/&gt;/g, ">").replace(/&quot;/g,"\"").replace(/:name=>/g, "name:").replace(/:data=>/g, "data:") + ')'),
      responsive: {
        rules: [{
          condition: {
            maxWidth: 500
          },
          chartOptions: {
            legend: {
              layout: 'horizontal',
              align: 'center',
              verticalAlign: 'bottom'
            }
          }
        }]
    }
    });
  }
});
