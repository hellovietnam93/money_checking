// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require i18n
//= require i18n.js
//= require i18n/translations
//= require app.min
//= require highcharts
//= require highcharts/highcharts-more
//= require incomes
//= require monthly_blance
//= require bootstrap-datepicker

$(document).on('turbolinks:load', function(){
  set_timeout();

  $('.search-month').datepicker({
    format: 'yyyy-mm',
    viewMode: 'months',
    minViewMode: 'months'
  });

  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd'
  });
});

function set_timeout() {
  $('.alert').delay(3000).slideUp();
}
