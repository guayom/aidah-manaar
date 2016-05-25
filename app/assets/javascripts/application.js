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
//= require jquery.maskedinput
//= require video
//= require jquery-ui
//= require blueimp-file-upload
//= require forms
//= require header

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
