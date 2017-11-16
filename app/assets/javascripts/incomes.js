$(document).on('turbolinks:load', function(){
  if ($("#statistics").length > 0) {
    Highcharts.chart('statistics', {
      chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
      },
      title: {
        text: I18n.t("statistics.pie.titles." + $('#statistics').data('type'), {date: $('#statistics').data('date')})
      },
      tooltip: {
        formatter: function () {
          return I18n.t('statistics.pie.category') + ': ' + '<strong>' + this.key + '</strong>' + ' <br/>' +
            I18n.t('statistics.pie.serie_name') + ': ' + '<strong>' + I18n.l("currency", this.y) + '</strong>';
        }
      },
      plotOptions: {
        pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
            enabled: true,
            format: '<b>{point.name}</b>: {point.extraValue}',
            style: {
              color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
            }
          },
          showInLegend: true
        }
      },
      series: [{
        name: I18n.t('statistics.pie.serie_name'),
        colorByPoint: true,
        data: eval("(" + $('#statistics').data('statistics').replace(/&gt;/g, ">").replace(/&quot;/g,"\"").replace(/:name=>/g, "name:").replace(/:y=>/g, "y:").replace(/:extraValue=>/g, "extraValue:") + ')')
      }]
    });
  }
});
