// 投稿フォーム表示/非表示関数
$(function() {
  $(document).on('click', '.post-form-appear', function() {
    $('.post-form').css({
      'display': 'block'
    });
    $('.navbar').css({
      'z-index': '0'
    });
  });
});

$(function() {
  $(document).on('click', '.post-form-disappear', function() {
    $('.post-form').css({
      'display': 'none'
    });
    $('.navbar').css({
      'z-index': '1'
    });
  });
});
