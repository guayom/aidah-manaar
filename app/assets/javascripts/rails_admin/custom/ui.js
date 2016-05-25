//= require bootsy
//= require video

$(function() {
  $(document).on('pjax:complete', Bootsy.init);

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
