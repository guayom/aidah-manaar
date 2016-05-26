//= require video
//= require ckeditor/init
//= require rails_admin/custom/ckeditor_ajax
//= require rails_admin/custom/ckeditor_config

$(function() {
  $(document).on('pjax:start', function() {
    $('.video-js').each(function() {
      var video = videojs(this);
      video.dispose();
    });
  });

  $(document).on('pjax:end', function() {
    $('.video-js').each(function() {
      videojs(this);
    });
  });
});
