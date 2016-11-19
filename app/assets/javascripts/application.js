// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require bootstrap/affix
//= require bootstrap/alert
//= require bootstrap/carousel
//= require bootstrap/collapse
//= require bootstrap/dropdown
//= require bootstrap/modal
//= require bootstrap/transition
//= require bootstrap/tooltip
//= require bootstrap-select
//= bootstrap-hover-dropdown.min

//= require jquery.maskedinput
//= require jquery-ui
//= jquery.magnific-popup.min
//= jquery.particleground
//= jquery.sticky
//= jquery.imagesloaded.min
//= jquery-migrate-1.2.1.min
//= jquery.backstretch.min
//= jquery.easing.1.3
//= jquery-migrate.min
//= jquery.flexslider-min

//= contact-form
//= pricing

//= template

//= cube-portfolio
//= masterslider-custom
//= moderniz.min
//= pace.min
//= parallax.min
//= tweetie.min
//= waypoints.min
//= wow.min
//= revolution-custom

$(function() {
  $('form').submit(function() {
    $('#student_id_number').val($('#student_id_number').mask());
    $('#student_phone').val($('#student_phone').mask());
  });

  $('.selectpicker').selectpicker();
  $('#student_id_number').mask('9-9999-9999');
  $('#student_phone').mask('9999-9999');
});

$(document).on('pjax:complete', function() {
  $('form').submit(function() {
    $('#student_id_number').val($('#student_id_number').mask());
    $('#student_phone').val($('#student_phone').mask());
  });

  $('.selectpicker').selectpicker();
  $('#student_id_number').mask('9-9999-9999');
  $('#student_phone').mask('9999-9999');
});
