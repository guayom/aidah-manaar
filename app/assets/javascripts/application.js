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
//= require jquery.maskedinput
//= require jquery-ui
//= require jquery-migrate.min
//= require modernizr.min
//= require jquery.easing.1.3

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

//= require jquery.flexslider-min
//= require parallax.min
//= require tweetie.min
//= require waypoints.min
//= require jquery.sticky
//= require wow.min
//= require contact-form

//= require jquery.themepunch.enablelog.js
//= require jquery.themepunch.tools.min.js
//= require jquery.themepunch.revolution.min
//= require revolution-custom

//= require jquery.cubeportfolio.min
//= require cube-portfolio
//= require pricing

// require jquery.magnific-popup.min
// require jquery.particleground

// require jquery.imagesloaded.min
// require jquery.backstretch.min

//= require masterslider
//= require masterslider-custom
//= require pace.min

//= require template

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
